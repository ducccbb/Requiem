-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

--[[
__________                   __               __    __________              .__
\______   \_______  ____    |__| ____   _____/  |_  \______   \ ____ _____  |  |
 |     ___/\_  __ \/  _ \   |  |/ __ \_/ ___\   __\  |       _// __ \\__  \ |  |
 |    |     |  | \(  <_> )  |  \  ___/\  \___|  |    |    |   \  ___/ / __ \|  |__
 |____|     |__|   \____/\__|  |\___  >\___  >__|    |____|_  /\___  >____  /____/
                        \______|    \/     \/               \/     \/     \/
]]
--                           Project Real  |  Luau Decompiler
--                                   Made by @zinvera
--    File: ReplicatedStorage.Packages._Index.evaera_promise@4.0.0.promise.init.spec
--                               Dumped in 0.0105 seconds
--                         Bytecode version 9  |  310 functions

return function() -- Line: 1
    local Parent = require(script.Parent)
    Parent.TEST = true
    local BindableEvent = Instance.new("BindableEvent")
    Parent._timeEvent = BindableEvent.Event
    local pack = 0
    function Parent._getTime() -- Line: 12 -- upvalues: pack (ref)
        return pack
    end
    local function advanceTime(p1) -- Line: 16 -- upvalues: pack (ref), BindableEvent (val)
        local v1 = p1 or 0.016666666666666666
        pack = pack + v1
        BindableEvent:Fire(v1)
    end
    function pack(...) -- Line: 24
        return select("#", ...), {...}
    end
    describe("Promise.Status", function() -- Line: 30 -- upvalues: Parent (val)
        it("should error if indexing nil value", function() -- Line: 31 -- upvalues: Parent (upval)
            expect(function() end).to.throw()
        end)
    end)
    describe("Unhandled rejection signal", function() -- Line: 38 -- upvalues: Parent (val), advanceTime (ref)
        it("should call unhandled rejection callbacks", function() -- Line: 39 -- upvalues: Parent (upval), advanceTime (upval)
            local u3 = Parent.new(function(p1, p2) -- Line: 40
                p2(1, 2)
            end)
            local u4 = 0
            local v1 = Parent.onUnhandledRejection(function(p1, p2, p3) -- Line: 46 -- upvalues: u4 (ref), u3 (val)
                u4 = u4 + 1
                expect(p1).to.equal(u3)
                expect(p2).to.equal(1)
                expect(p3).to.equal(2)
            end)
            advanceTime()
            expect(u4).to.equal(1)
            v1()
            Parent.new(function(p1, p2) -- Line: 62
                p2(3, 4)
            end)
            advanceTime()
            expect(u4).to.equal(1)
        end)
    end)
    describe("Promise.new", function() -- Line: 72 -- upvalues: Parent (val)
        it("should instantiate with a callback", function() -- Line: 73 -- upvalues: Parent (upval)
            local v1 = Parent.new(function() end)
            expect(v1).to.be.ok()
        end)
        it("should invoke the given callback with resolve and reject", function() -- Line: 79 -- upvalues: Parent (upval)
            local u1, u2
            local u0 = 0
            local v1 = Parent.new(function(p1, p2) -- Line: 84 -- upvalues: u0 (ref), u1 (ref), u2 (ref)
                u0 = u0 + 1
                u1 = p1
                u2 = p2
            end)
            expect(v1).to.be.ok()
            expect(u0).to.equal(1)
            expect(nil).to.be.a("function")
            expect(nil).to.be.a("function")
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
        end)
        it("should resolve promises on resolve()", function() -- Line: 98 -- upvalues: Parent (upval)
            local u0 = 0
            local v1 = Parent.new(function(p1) -- Line: 101 -- upvalues: u0 (ref)
                u0 = u0 + 1
                p1()
            end)
            expect(v1).to.be.ok()
            expect(u0).to.equal(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
        end)
        it("should reject promises on reject()", function() -- Line: 111 -- upvalues: Parent (upval)
            local u0 = 0
            local v1 = Parent.new(function(p1, p2) -- Line: 114 -- upvalues: u0 (ref)
                u0 = u0 + 1
                p2()
            end)
            expect(v1).to.be.ok()
            expect(u0).to.equal(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
        end)
        it("should reject on error in callback", function() -- Line: 124 -- upvalues: Parent (upval)
            local u0 = 0
            local v1 = Parent.new(function() -- Line: 127 -- upvalues: u0 (ref)
                u0 = u0 + 1
                error("hahah")
            end)
            expect(v1).to.be.ok()
            expect(u0).to.equal(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(tostring(v1._values[1]):find("hahah")).to.be.ok()
            expect(tostring(v1._values[1]):find("init.spec")).to.be.ok()
            expect(tostring(v1._values[1]):find("runExecutor")).to.be.ok()
        end)
        it("should work with C functions", function() -- Line: 142 -- upvalues: Parent (upval)
            expect(function() -- Line: 143 -- upvalues: Parent (upval)
                Parent.new(tick):andThen(tick)
            end).to.never.throw()
        end)
        it("should have a nice tostring", function() -- Line: 148 -- upvalues: Parent (upval)
            expect(tostring(Parent.resolve()):gmatch("Promise(Resolved)")).to.be.ok()
        end)
        it("should allow yielding", function() -- Line: 152 -- upvalues: Parent (upval)
            local BindableEvent = Instance.new("BindableEvent")
            local v1 = Parent.new(function(p1) -- Line: 154 -- upvalues: BindableEvent (val)
                BindableEvent.Event:Wait()
                p1(5)
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            BindableEvent:Fire()
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal(5)
        end)
        it("should preserve stack traces of resolve-chained promises", function() -- Line: 165 -- upvalues: Parent (upval)
            local function nestedCall(p1) -- Line: 166
                error(p1)
            end
            local v1 = Parent.new(function(p1) -- Line: 170 -- upvalues: Parent (upval)
                p1(Parent.new(function() -- Line: 171
                    error("sample text")
                end))
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            local v2 = tostring(v1._values[1])
            expect(v2:find("sample text")).to.be.ok()
            expect(v2:find("nestedCall")).to.be.ok()
            expect(v2:find("runExecutor")).to.be.ok()
            expect(v2:find("runPlanNode")).to.be.ok()
            expect(v2:find("...Rejected because it was chained to the following Promise, which encountered an error:")).to.be.ok()
        end)
        it("should report errors from Promises with _error (< v2)", function() -- Line: 188 -- upvalues: Parent (upval)
            local v1 = Parent.reject()
            v1._error = "Sample error"
            local v2 = Parent.resolve():andThenReturn(v1)
            expect(v2:getStatus()).to.equal(Parent.Status.Rejected)
            local v3 = tostring(v2._values[1])
            expect(v3:find("Sample error")).to.be.ok()
            expect(v3:find("...Rejected because it was chained to the following Promise, which encountered an error:")).to.be.ok()
            expect(v3:find("%[No stack trace available")).to.be.ok()
        end)
        it("should allow callable tables", function() -- Line: 204 -- upvalues: Parent (upval)
            local u8
            local v1 = {}
            local v2 = {
                __call = function(p1, p2) -- Line: 206
                    p2(1)
                end,
            }
            local v3 = Parent.new((setmetatable(v1, v2)))
            local v4 = {}
            local v5 = {
                __call = function(p1, p2) -- Line: 213 -- upvalues: u8 (ref)
                    expect(p2).to.equal(1)
                    u8 = true
                end,
            }
            v3:andThen((setmetatable(v4, v5)))
            expect(false).to.equal(true)
        end)
        itSKIP("should close the thread after resolve", function() -- Line: 222 -- upvalues: Parent (upval)
            local u0 = 0
            Parent.new(function(p1) -- Line: 224 -- upvalues: u0 (ref), Parent (upval)
                u0 = u0 + 1
                p1()
                Parent.delay(1):await()
                u0 = u0 + 1
            end)
            task.wait(1)
            expect(u0).to.equal(1)
        end)
    end)
    describe("Promise.defer", function() -- Line: 237 -- upvalues: Parent (val), advanceTime (ref)
        it("should execute after the time event", function() -- Line: 238 -- upvalues: Parent (upval), advanceTime (upval)
            local u0 = 0
            local v1 = Parent.defer(function(p1, p2, p3, p4) -- Line: 240 -- upvalues: u0 (ref)
                expect((type(p1))).to.equal("function")
                expect((type(p2))).to.equal("function")
                expect((type(p3))).to.equal("function")
                expect((type(p4))).to.equal("nil")
                u0 = u0 + 1
                p1("foo")
            end)
            expect(u0).to.equal(0)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            advanceTime()
            expect(u0).to.equal(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            advanceTime()
            expect(u0).to.equal(1)
        end)
    end)
    describe("Promise.delay", function() -- Line: 263 -- upvalues: Parent (val), advanceTime (ref)
        it("should schedule promise resolution", function() -- Line: 264 -- upvalues: Parent (upval), advanceTime (upval)
            local v1 = Parent.delay(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            advanceTime()
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            advanceTime(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
        end)
        it("should allow for delays to be cancelled", function() -- Line: 276 -- upvalues: Parent (upval), advanceTime (upval)
            local u3 = Parent.delay(2)
            Parent.delay(1):andThen(function() -- Line: 279 -- upvalues: u3 (val)
                u3:cancel()
            end)
            expect(u3:getStatus()).to.equal(Parent.Status.Started)
            advanceTime()
            expect(u3:getStatus()).to.equal(Parent.Status.Started)
            advanceTime(1)
            expect(u3:getStatus()).to.equal(Parent.Status.Cancelled)
            advanceTime(1)
        end)
    end)
    describe("Promise.resolve", function() -- Line: 292 -- upvalues: Parent (val)
        it("should immediately resolve with a value", function() -- Line: 293 -- upvalues: Parent (upval)
            local v1 = Parent.resolve(5, 6)
            expect(v1).to.be.ok()
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal(5)
            expect(v1._values[2]).to.equal(6)
        end)
        it("should chain onto passed promises", function() -- Line: 302 -- upvalues: Parent (upval)
            local v1 = Parent.resolve(Parent.new(function(p1, p2) -- Line: 303
                p2(7)
            end))
            expect(v1).to.be.ok()
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1._values[1]).to.equal(7)
        end)
    end)
    describe("Promise.reject", function() -- Line: 313 -- upvalues: Parent (val)
        it("should immediately reject with a value", function() -- Line: 314 -- upvalues: Parent (upval)
            local v1 = Parent.reject(6, 7)
            expect(v1).to.be.ok()
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1._values[1]).to.equal(6)
            expect(v1._values[2]).to.equal(7)
        end)
        it("should pass a promise as-is as an error", function() -- Line: 323 -- upvalues: Parent (upval)
            local v1 = Parent.new(function(p1) -- Line: 324
                p1(6)
            end)
            local v2 = Parent.reject(v1)
            expect(v2).to.be.ok()
            expect(v2:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v2._values[1]).to.equal(v1)
        end)
    end)
    describe("Promise:andThen", function() -- Line: 336 -- upvalues: Parent (val), pack (val)
        it("should allow yielding", function() -- Line: 337 -- upvalues: Parent (upval)
            local BindableEvent = Instance.new("BindableEvent")
            local v1 = Parent.resolve():andThen(function() -- Line: 339 -- upvalues: BindableEvent (val)
                BindableEvent.Event:Wait()
                return 5
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            BindableEvent:Fire()
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal(5)
        end)
        it("should run andThens on a new thread", function() -- Line: 350 -- upvalues: Parent (upval)
            local u3
            local BindableEvent = Instance.new("BindableEvent")
            local v1 = Parent.new(function(p1) -- Line: 354 -- upvalues: u3 (ref)
                u3 = p1
            end)
            local v2 = v1:andThen(function() -- Line: 358 -- upvalues: BindableEvent (val)
                BindableEvent.Event:Wait()
                return 5
            end)
            local v3 = v1:andThen(function() -- Line: 363
                return "foo"
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)()
            expect(v3:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v3._values[1]).to.equal("foo")
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
        end)
        it("should chain onto resolved promises", function() -- Line: 374 -- upvalues: Parent (upval), pack (upval)
            local u0, u1
            local u2 = 0
            local u3 = 0
            local v1 = Parent.resolve(5)
            local v2 = v1:andThen(function(...) -- Line: 382 -- upvalues: u1 (ref), u0 (ref), pack (upval), u2 (ref)
                local v1, v2
                v1, v2 = pack(...)
                u1 = v1
                u0 = v2
                u2 = u2 + 1
            end, function() -- Line: 385 -- upvalues: u3 (ref)
                u3 = u3 + 1
            end)
            expect(u3).to.equal(0)
            expect(u2).to.equal(1)
            expect(nil).to.equal(1)
            expect((nil)[1]).to.equal(5)
            expect(v1).to.be.ok()
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal(5)
            expect(v2).to.be.ok()
            expect(v2).never.to.equal(v1)
            expect(v2:getStatus()).to.equal(Parent.Status.Resolved)
            expect(#v2._values).to.equal(0)
        end)
        it("should chain onto rejected promises", function() -- Line: 405 -- upvalues: Parent (upval), pack (upval)
            local u0, u1
            local u2 = 0
            local u3 = 0
            local v1 = Parent.reject(5)
            local v2 = v1:andThen(function(...) -- Line: 413 -- upvalues: u3 (ref)
                u3 = u3 + 1
            end, function(...) -- Line: 415 -- upvalues: u1 (ref), u0 (ref), pack (upval), u2 (ref)
                local v1, v2
                v1, v2 = pack(...)
                u1 = v1
                u0 = v2
                u2 = u2 + 1
            end)
            expect(u3).to.equal(0)
            expect(u2).to.equal(1)
            expect(nil).to.equal(1)
            expect((nil)[1]).to.equal(5)
            expect(v1).to.be.ok()
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1._values[1]).to.equal(5)
            expect(v2).to.be.ok()
            expect(v2).never.to.equal(v1)
            expect(v2:getStatus()).to.equal(Parent.Status.Resolved)
            expect(#v2._values).to.equal(0)
        end)
        it("should reject on error in callback", function() -- Line: 436 -- upvalues: Parent (upval)
            local u0 = 0
            local v1 = Parent.resolve(1):andThen(function() -- Line: 439 -- upvalues: u0 (ref)
                u0 = u0 + 1
                error("hahah")
            end)
            expect(v1).to.be.ok()
            expect(u0).to.equal(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(tostring(v1._values[1]):find("hahah")).to.be.ok()
            expect(tostring(v1._values[1]):find("init.spec")).to.be.ok()
            expect(tostring(v1._values[1]):find("runExecutor")).to.be.ok()
        end)
        it("should chain onto asynchronously resolved promises", function() -- Line: 454 -- upvalues: Parent (upval)
            local u0, u1, u4
            local u2 = 0
            local u3 = 0
            local v1 = Parent.new(function(p1) -- Line: 461 -- upvalues: u4 (ref)
                u4 = p1
            end)
            local v2 = v1:andThen(function(...) -- Line: 465 -- upvalues: u0 (ref), u1 (ref), u2 (ref)
                u0 = {...}
                u1 = select("#", ...)
                u2 = u2 + 1
            end, function() -- Line: 469 -- upvalues: u3 (ref)
                u3 = u3 + 1
            end)
            expect(u2).to.equal(0)
            expect(u3).to.equal(0)
            ;(nil)(6)
            expect(u3).to.equal(0)
            expect(u2).to.equal(1)
            expect(nil).to.equal(1)
            expect((nil)[1]).to.equal(6)
            expect(v1).to.be.ok()
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal(6)
            expect(v2).to.be.ok()
            expect(v2).never.to.equal(v1)
            expect(v2:getStatus()).to.equal(Parent.Status.Resolved)
            expect(#v2._values).to.equal(0)
        end)
        it("should chain onto asynchronously rejected promises", function() -- Line: 494 -- upvalues: Parent (upval)
            local u0, u1, u4
            local u2 = 0
            local u3 = 0
            local v1 = Parent.new(function(p1, p2) -- Line: 501 -- upvalues: u4 (ref)
                u4 = p2
            end)
            local v2 = v1:andThen(function() -- Line: 505 -- upvalues: u3 (ref)
                u3 = u3 + 1
            end, function(...) -- Line: 507 -- upvalues: u0 (ref), u1 (ref), u2 (ref)
                u0 = {...}
                u1 = select("#", ...)
                u2 = u2 + 1
            end)
            expect(u2).to.equal(0)
            expect(u3).to.equal(0)
            ;(nil)(6)
            expect(u3).to.equal(0)
            expect(u2).to.equal(1)
            expect(nil).to.equal(1)
            expect((nil)[1]).to.equal(6)
            expect(v1).to.be.ok()
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1._values[1]).to.equal(6)
            expect(v2).to.be.ok()
            expect(v2).never.to.equal(v1)
            expect(v2:getStatus()).to.equal(Parent.Status.Resolved)
            expect(#v2._values).to.equal(0)
        end)
        it("should propagate errors through multiple levels", function() -- Line: 534 -- upvalues: Parent (upval)
            local u0, u1, u2
            local v1 = Parent.new(function(p1, p2) -- Line: 536
                p2(1, 2, 3)
            end):andThen(function() end)
            v1:catch(function(p1, p2, p3) -- Line: 538 -- upvalues: u0 (ref), u1 (ref), u2 (ref)
                u0 = p1
                u1 = p2
                u2 = p3
            end)
            expect(nil).to.equal(1)
            expect(nil).to.equal(2)
            expect(nil).to.equal(3)
        end)
        it("should not call queued callbacks from a cancelled sub-promise", function() -- Line: 547 -- upvalues: Parent (upval)
            local u0
            local u1 = 0
            local v1 = Parent.new(function(p1) -- Line: 551 -- upvalues: u0 (ref)
                u0 = p1
            end)
            v1:andThen(function() -- Line: 555 -- upvalues: u1 (ref)
                u1 = u1 + 1
            end)
            v1:andThen(function() -- Line: 560 -- upvalues: u1 (ref)
                u1 = u1 + 1
            end):cancel()
            ;(nil)("foo")
            expect(u1).to.equal(1)
        end)
    end)
    describe("Promise:cancel", function() -- Line: 571 -- upvalues: Parent (val), advanceTime (ref)
        it("should mark promises as cancelled and not resolve or reject them", function() -- Line: 572 -- upvalues: Parent (upval)
            local u0 = 0
            local u1 = 0
            local v1 = Parent.new(function() end):andThen(function() -- Line: 576 -- upvalues: u0 (ref)
                u0 = u0 + 1
            end)
            v1 = v1:finally(function() -- Line: 579 -- upvalues: u1 (ref)
                u1 = u1 + 1
            end)
            v1:cancel()
            v1:cancel()
            expect(u0).to.equal(0)
            expect(u1).to.equal(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
        it("should call the cancellation hook once", function() -- Line: 591 -- upvalues: Parent (upval)
            local u0 = 0
            local v1 = Parent.new(function(p1, p2, p3) -- Line: 594 -- upvalues: u0 (ref)
                p3(function() -- Line: 595 -- upvalues: u0 (upval)
                    u0 = u0 + 1
                end)
            end)
            v1:cancel()
            v1:cancel()
            expect(u0).to.equal(1)
        end)
        it("should propagate cancellations", function() -- Line: 606 -- upvalues: Parent (upval)
            local v1 = Parent.new(function() end)
            local v2 = v1:andThen()
            local v3 = v1:andThen()
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
            expect(v3:getStatus()).to.equal(Parent.Status.Started)
            v2:cancel()
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            expect(v2:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v3:getStatus()).to.equal(Parent.Status.Started)
            v3:cancel()
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v2:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v3:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
        it("should affect downstream promises", function() -- Line: 629 -- upvalues: Parent (upval)
            local v1 = Parent.new(function() end)
            local v2 = v1:andThen()
            v1:cancel()
            expect(v2:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
        it("should track consumers", function() -- Line: 638 -- upvalues: Parent (upval)
            local u3 = Parent.new(function() end)
            local v1 = Parent.resolve()
            local u10 = v1:andThen(function() -- Line: 641 -- upvalues: u3 (val)
                return u3
            end)
            local v2 = Parent.new(function(p1) -- Line: 644 -- upvalues: u10 (val)
                p1(u10)
            end)
            local v3 = v2:andThen(function() end)
            expect(u10._parent).to.never.equal(v1)
            expect(v2._parent).to.never.equal(u10)
            expect(v2._consumers[v3]).to.be.ok()
            expect(v3._parent).to.equal(v2)
        end)
        it("should cancel resolved pending promises", function() -- Line: 655 -- upvalues: Parent (upval)
            local u3 = Parent.new(function() end)
            local v1 = Parent.new(function(p1) -- Line: 658 -- upvalues: u3 (val)
                p1(u3)
            end):finally(function() end)
            v1:cancel()
            expect(u3._status).to.equal(Parent.Status.Cancelled)
            expect(v1._status).to.equal(Parent.Status.Cancelled)
        end)
        it("should close the promise thread", function() -- Line: 668 -- upvalues: Parent (upval), advanceTime (upval)
            local u0 = 0
            Parent.new(function() -- Line: 670 -- upvalues: u0 (ref), Parent (upval)
                u0 = u0 + 1
                Parent.delay(1):await()
                u0 = u0 + 1
            end):cancel()
            advanceTime(2)
            expect(u0).to.equal(1)
        end)
    end)
    describe("Promise:finally", function() -- Line: 683 -- upvalues: Parent (val)
        it("should be called upon resolve, reject, or cancel", function() -- Line: 684 -- upvalues: Parent (upval)
            local u0 = 0
            local function finally() -- Line: 687 -- upvalues: u0 (ref)
                u0 = u0 + 1
            end
            Parent.new(function(p1, p2) -- Line: 692
                p1()
            end):finally(finally)
            local v1 = Parent.resolve():andThen(function() end)
            v1 = v1:finally(finally)
            v1:finally(finally)
            Parent.reject():finally(finally)
            Parent.new(function() end):finally(finally):cancel()
            expect(u0).to.equal(5)
        end)
        it("should not forward return values", function() -- Line: 708 -- upvalues: Parent (upval)
            local u0
            local v1 = Parent.resolve(2):finally(function() -- Line: 712
                return 1
            end)
            v1:andThen(function(p1) -- Line: 715 -- upvalues: u0 (ref)
                u0 = p1
            end)
            expect(nil).to.equal(2)
        end)
        it("should not consume rejections", function() -- Line: 722 -- upvalues: Parent (upval)
            local u0, u1
            local v1 = Parent.reject(5):finally(function() -- Line: 726
                return 42
            end)
            v1 = v1:andThen(function() -- Line: 729 -- upvalues: u1 (ref)
                u1 = true
            end)
            v1:catch(function(p1) -- Line: 732 -- upvalues: u0 (ref)
                u0 = true
                expect(p1).to.equal(5)
            end)
            expect(false).to.equal(true)
            expect(false).to.equal(false)
        end)
        it("should wait for returned promises", function() -- Line: 741 -- upvalues: Parent (upval)
            local u0, v1
            local v2 = Parent.reject("foo"):finally(function() -- Line: 743 -- upvalues: Parent (upval), u0 (ref)
                return Parent.new(function(p1) -- Line: 744 -- upvalues: u0 (upval)
                    u0 = p1
                end)
            end)
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)()
            expect(v2:getStatus()).to.equal(Parent.Status.Rejected)
            _, v1 = v2:_unwrap()
            expect(v1).to.equal("foo")
        end)
        it("should reject with a returned rejected promise's value", function() -- Line: 758 -- upvalues: Parent (upval)
            local u0, v1
            local v2 = Parent.reject("foo"):finally(function() -- Line: 760 -- upvalues: Parent (upval), u0 (ref)
                return Parent.new(function(p1, p2) -- Line: 761 -- upvalues: u0 (upval)
                    u0 = p2
                end)
            end)
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)("bar")
            expect(v2:getStatus()).to.equal(Parent.Status.Rejected)
            _, v1 = v2:_unwrap()
            expect(v1).to.equal("bar")
        end)
        it("should reject when handler errors", function() -- Line: 775 -- upvalues: Parent (upval)
            local v1, v2
            local u0 = {}
            v1, v2 = Parent.reject("bar"):finally(function() -- Line: 777 -- upvalues: u0 (val)
                error(u0)
            end):_unwrap()
            expect(v1).to.equal(false)
            expect(v2).to.equal(u0)
        end)
        it("should not prevent cancellation", function() -- Line: 787 -- upvalues: Parent (upval)
            local u4
            local v1 = Parent.new(function() end)
            v1:finally(function() -- Line: 791 -- upvalues: u4 (ref)
                u4 = true
            end)
            v1:andThen(function() end):cancel()
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(false).to.equal(true)
        end)
        it("should propagate cancellation downwards", function() -- Line: 803 -- upvalues: Parent (upval)
            local u0
            local v1 = Parent.new(function() end)
            local v2 = v1:finally(function() -- Line: 808 -- upvalues: u0 (ref)
                u0 = true
            end)
            v1:cancel()
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v2:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(false).to.equal(true)
            expect(false).to.equal(false)
        end)
        it("should propagate cancellation upwards", function() -- Line: 821 -- upvalues: Parent (upval)
            local u0
            local v1 = Parent.new(function() end)
            local v2 = v1:finally(function() -- Line: 826 -- upvalues: u0 (ref)
                u0 = true
            end)
            v2:cancel()
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v2:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(false).to.equal(true)
            expect(false).to.equal(false)
        end)
        it("should cancel returned promise if cancelled", function() -- Line: 839 -- upvalues: Parent (upval)
            local u3 = Parent.new(function() end)
            Parent.resolve():finally(function() -- Line: 842 -- upvalues: u3 (val)
                return u3
            end):cancel()
            expect(u3:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
    end)
    describe("Promise.all", function() -- Line: 852 -- upvalues: Parent (val), pack (val)
        it("should error if given something other than a table", function() -- Line: 853 -- upvalues: Parent (upval)
            expect(function() -- Line: 854 -- upvalues: Parent (upval)
                Parent.all(1)
            end).to.throw()
        end)
        it("should resolve instantly with an empty table if given no promises", function() -- Line: 859 -- upvalues: Parent (upval)
            local v1, v2
            local v3 = Parent.all({})
            v1, v2 = v3:_unwrap()
            expect(v1).to.equal(true)
            expect(v3:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v2).to.be.a("table")
            expect(next(v2)).to.equal(nil)
        end)
        it("should error if given non-promise values", function() -- Line: 869 -- upvalues: Parent (upval)
            expect(function() -- Line: 870 -- upvalues: Parent (upval)
                Parent.all({{}, {}, {}})
            end).to.throw()
        end)
        it("should wait for all promises to be resolved and return their values", function() -- Line: 875 -- upvalues: pack (upval), Parent (upval)
            local u7, v1, v2, v3, v4
            local u0 = {}
            v1, u7 = pack(1, "A string", nil, false)
            local v5 = {}
            local v6 = v1
            local v7 = 1
            for i = 1, v6, v7 do
                v5[i] = Parent.new(function(p1) -- Line: 883 -- upvalues: u0 (val), i (val), u7 (val)
                    u0[i] = {p1, u7[i]}
                end)
            end
            v6 = Parent.all(v5)
            for i2, v in ipairs(u0) do
                expect(v6:getStatus()).to.equal(Parent.Status.Started)
                v[1](v[2])
            end
            v7, v2 = pack(v6:_unwrap())
            v3, v4 = unpack(v2, 1, v7)
            expect(v7).to.equal(2)
            expect(v3).to.equal(true)
            expect(v4).to.be.a("table")
            expect(#v4).to.equal(#v5)
            local v8 = v1
            local v9 = 1
            for j = 1, v8, v9 do
                expect(v4[j]).to.equal(u7[j])
            end
        end)
        it("should reject if any individual promise rejected", function() -- Line: 908 -- upvalues: Parent (upval), pack (upval)
            local u0, u1, v1, v2, v3, v4, v5
            local v6 = Parent.new(function(p1, p2) -- Line: 912 -- upvalues: u0 (ref)
                u0 = p2
            end)
            local v7 = Parent.new(function(p1) -- Line: 916 -- upvalues: u1 (ref)
                u1 = p1
            end)
            local v8 = Parent.all({v6, v7})
            expect(v8:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)("baz", "qux")
            ;(nil)("foo", "bar")
            v1, v2 = pack(v8:_unwrap())
            v3, v4, v5 = unpack(v2, 1, v1)
            expect(v1).to.equal(3)
            expect(v3).to.equal(false)
            expect(v4).to.equal("baz")
            expect(v5).to.equal("qux")
            expect(v7:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
        it("should not resolve if resolved after rejecting", function() -- Line: 937 -- upvalues: Parent (upval), pack (upval)
            local u0, u1, v1, v2, v3, v4, v5
            local v6 = Parent.new(function(p1, p2) -- Line: 941 -- upvalues: u0 (ref)
                u0 = p2
            end)
            local v7 = Parent.new(function(p1) -- Line: 945 -- upvalues: u1 (ref)
                u1 = p1
            end)
            local v8 = Parent.all({v6, v7})
            expect(v8:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)("baz", "qux")
            ;(nil)("foo", "bar")
            v1, v2 = pack(v8:_unwrap())
            v3, v4, v5 = unpack(v2, 1, v1)
            expect(v1).to.equal(3)
            expect(v3).to.equal(false)
            expect(v4).to.equal("baz")
            expect(v5).to.equal("qux")
        end)
        it("should only reject once", function() -- Line: 965 -- upvalues: Parent (upval), pack (upval)
            local u0, u1, v1, v2, v3, v4, v5
            local v6 = Parent.new(function(p1, p2) -- Line: 969 -- upvalues: u0 (ref)
                u0 = p2
            end)
            local v7 = Parent.new(function(p1, p2) -- Line: 973 -- upvalues: u1 (ref)
                u1 = p2
            end)
            local v8 = Parent.all({v6, v7})
            expect(v8:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)("foo", "bar")
            expect(v8:getStatus()).to.equal(Parent.Status.Rejected)
            ;(nil)("baz", "qux")
            v1, v2 = pack(v8:_unwrap())
            v3, v4, v5 = unpack(v2, 1, v1)
            expect(v1).to.equal(3)
            expect(v3).to.equal(false)
            expect(v4).to.equal("foo")
            expect(v5).to.equal("bar")
        end)
        it("should error if a non-array table is passed in", function() -- Line: 996 -- upvalues: Parent (upval)
            local v1, v2
            v1, v2 = pcall(function() -- Line: 997 -- upvalues: Parent (upval)
                Parent.all(Parent.new(function() end))
            end)
            expect(v1).to.be.ok()
            expect(v2:find("Non%-promise")).to.be.ok()
        end)
        it("should cancel pending promises if one rejects", function() -- Line: 1005 -- upvalues: Parent (upval)
            local v1 = Parent.new(function() end)
            expect(Parent.all({Parent.resolve(), Parent.reject(), v1}):getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
        it("should cancel promises if it is cancelled", function() -- Line: 1015 -- upvalues: Parent (upval)
            local v1 = Parent.new(function() end)
            v1:andThen(function() end)
            local v2 = {}
            local v3 = Parent.new(function() end)
            local v4 = Parent.new(function() end)
            v2[1] = v3
            v2[2] = v4
            v2[3] = v1
            Parent.all(v2):cancel()
            expect(v2[1]:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v2[2]:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v2[3]:getStatus()).to.equal(Parent.Status.Started)
        end)
    end)
    describe("Promise.fold", function() -- Line: 1033 -- upvalues: Parent (val), advanceTime (ref)
        it("should return the initial value in a promise when the list is empty", function() -- Line: 1034 -- upvalues: Parent (upval)
            local v1 = {}
            local v2 = Parent.fold({}, function() -- Line: 1036
                error("should not be called")
            end, v1)
            expect(Parent.is(v2)).to.equal(true)
            expect(v2:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v2:expect()).to.equal(v1)
        end)
        it("should accept promises in the list", function() -- Line: 1045 -- upvalues: Parent (upval)
            local u0
            local v1 = {}
            local v2 = Parent.new(function(p1) -- Line: 1048 -- upvalues: u0 (ref)
                u0 = p1
            end)
            v1[1] = v2
            v1[2] = 2
            v1[3] = 3
            local v3 = Parent.fold(v1, function(p1, p2) -- Line: 1050
                return p1 + p2
            end, 0)
            ;(nil)(1)
            expect(Parent.is(v3)).to.equal(true)
            expect(v3:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v3:expect()).to.equal(6)
        end)
        it("should always return a promise even if the list or reducer don't use them", function() -- Line: 1061 -- upvalues: Parent (upval), advanceTime (upval)
            local v1 = Parent.fold({1, 2, 3}, function(p1, p2, p3) -- Line: 1062 -- upvalues: Parent (upval)
                if p3 == 2 then
                    return Parent.delay(1):andThenReturn(p1 + p2)
                end
                return p1 + p2
            end, 0)
            expect(Parent.is(v1)).to.equal(true)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            advanceTime(2)
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1:expect()).to.equal(6)
        end)
        it("should return the first rejected promise", function() -- Line: 1076 -- upvalues: Parent (upval)
            local v1, v2
            local v3 = Parent.fold({1, 2, 3}, function(p1, p2, p3) -- Line: 1078 -- upvalues: Parent (upval)
                if p3 == 2 then
                    return Parent.reject("foo")
                end
                return p1 + p2
            end, 0)
            expect(Parent.is(v3)).to.equal(true)
            v1, v2 = v3:awaitStatus()
            expect(v1).to.equal(Parent.Status.Rejected)
            expect(v2).to.equal("foo")
        end)
        it("should return the first canceled promise", function() -- Line: 1091 -- upvalues: Parent (upval)
            local u0 = nil
            local v1 = Parent.fold({1, 2, 3}, function(p1, p2, p3) -- Line: 1093 -- upvalues: u0 (ref), Parent (upval)
                if p3 == 1 then
                    return p1 + p2
                end
                if p3 == 2 then
                    u0 = Parent.delay(1):andThenReturn(p1 + p2)
                    return u0
                end
                error("this should not run if the promise is cancelled")
            end, 0)
            expect(Parent.is(v1)).to.equal(true)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            u0:cancel()
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
    end)
    describe("Promise.race", function() -- Line: 1110 -- upvalues: Parent (val)
        it("should resolve with the first settled value", function() -- Line: 1111 -- upvalues: Parent (upval)
            local v1 = {}
            local v2 = Parent.resolve(1)
            v1[1] = v2
            v1[2] = Parent.resolve(2)
            local v3 = Parent.race(v1):andThen(function(p1) -- Line: 1115
                expect(p1).to.equal(1)
            end)
            expect(v3:getStatus()).to.equal(Parent.Status.Resolved)
        end)
        it("should cancel other promises", function() -- Line: 1122 -- upvalues: Parent (upval)
            local v1 = Parent.new(function() end)
            v1:andThen(function() end)
            local v2 = {}
            local v3 = Parent.new(function() end)
            v2[1] = v1
            v2[2] = v3
            v2[3] = Parent.new(function(p1) -- Line: 1128
                p1(2)
            end)
            local v4 = Parent.race(v2)
            expect(v4:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v4._values[1]).to.equal(2)
            expect(v2[1]:getStatus()).to.equal(Parent.Status.Started)
            expect(v2[2]:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v2[3]:getStatus()).to.equal(Parent.Status.Resolved)
            v3 = Parent.new(function() end)
            expect(Parent.race({Parent.reject(), Parent.resolve(), v3}):getStatus()).to.equal(Parent.Status.Rejected)
            expect(v3:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
        it("should error if a non-array table is passed in", function() -- Line: 1150 -- upvalues: Parent (upval)
            local v1, v2
            v1, v2 = pcall(function() -- Line: 1151 -- upvalues: Parent (upval)
                Parent.race(Parent.new(function() end))
            end)
            expect(v1).to.be.ok()
            expect(v2:find("Non%-promise")).to.be.ok()
        end)
        it("should cancel promises if it is cancelled", function() -- Line: 1159 -- upvalues: Parent (upval)
            local v1 = Parent.new(function() end)
            v1:andThen(function() end)
            local v2 = {}
            local v3 = Parent.new(function() end)
            local v4 = Parent.new(function() end)
            v2[1] = v3
            v2[2] = v4
            v2[3] = v1
            Parent.race(v2):cancel()
            expect(v2[1]:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v2[2]:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v2[3]:getStatus()).to.equal(Parent.Status.Started)
        end)
    end)
    describe("Promise.promisify", function() -- Line: 1177 -- upvalues: Parent (val)
        it("should wrap functions", function() -- Line: 1178 -- upvalues: Parent (upval)
            local v1, v2
            local v3 = Parent.promisify(function(p1) -- Line: 1179
                return p1 + 1
            end)(1)
            v1, v2 = v3:_unwrap()
            expect(v1).to.equal(true)
            expect(v3:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v2).to.equal(2)
        end)
        it("should catch errors after a yield", function() -- Line: 1192 -- upvalues: Parent (upval)
            local BindableEvent = Instance.new("BindableEvent")
            local v1 = Parent.promisify(function() -- Line: 1194 -- upvalues: BindableEvent (val)
                BindableEvent.Event:Wait()
                error("errortext")
            end)()
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            BindableEvent:Fire()
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(tostring(v1._values[1]):find("errortext")).to.be.ok()
        end)
    end)
    describe("Promise.tap", function() -- Line: 1208 -- upvalues: Parent (val)
        it("should thread through values", function() -- Line: 1209 -- upvalues: Parent (upval)
            local u0, u1
            local v1 = Parent.resolve(1):andThen(function(p1) -- Line: 1213
                return p1 + 1
            end)
            v1 = v1:tap(function(p1) -- Line: 1216 -- upvalues: u0 (ref)
                u0 = p1
                return p1 + 1
            end)
            v1:andThen(function(p1) -- Line: 1220 -- upvalues: u1 (ref)
                u1 = p1
            end)
            expect(nil).to.equal(2)
            expect(nil).to.equal(2)
        end)
        it("should chain onto promises", function() -- Line: 1228 -- upvalues: Parent (upval)
            local u0
            local u1 = nil
            local v1 = Parent.resolve(1):tap(function() -- Line: 1232 -- upvalues: Parent (upval), u0 (ref)
                return Parent.new(function(p1) -- Line: 1233 -- upvalues: u0 (upval)
                    u0 = p1
                end)
            end)
            v1 = v1:andThen(function(p1) -- Line: 1237 -- upvalues: u1 (ref)
                u1 = p1
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            expect(u1).to.never.be.ok()
            ;(nil)(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(u1).to.equal(1)
        end)
    end)
    describe("Promise.try", function() -- Line: 1251 -- upvalues: Parent (val)
        it("should catch synchronous errors", function() -- Line: 1252 -- upvalues: Parent (upval)
            local u0
            Parent.try(function() -- Line: 1254
                error("errortext")
            end):catch(function(p1) -- Line: 1256 -- upvalues: u0 (ref)
                u0 = tostring(p1)
            end)
            expect((nil):find("errortext")).to.be.ok()
        end)
        it("should reject with error objects", function() -- Line: 1263 -- upvalues: Parent (upval)
            local v1, v2
            local u0 = {}
            v1, v2 = Parent.try(function() -- Line: 1265 -- upvalues: u0 (val)
                error(u0)
            end):_unwrap()
            expect(v1).to.equal(false)
            expect(v2).to.equal(u0)
        end)
        it("should catch asynchronous errors", function() -- Line: 1273 -- upvalues: Parent (upval)
            local BindableEvent = Instance.new("BindableEvent")
            local v1 = Parent.try(function() -- Line: 1275 -- upvalues: BindableEvent (val)
                BindableEvent.Event:Wait()
                error("errortext")
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            BindableEvent:Fire()
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(tostring(v1._values[1]):find("errortext")).to.be.ok()
        end)
    end)
    describe("Promise:andThenReturn", function() -- Line: 1287 -- upvalues: Parent (val)
        it("should return the given values", function() -- Line: 1288 -- upvalues: Parent (upval)
            local u0, u1
            local v1 = Parent.resolve():andThenReturn(1, 2)
            v1:andThen(function(p1, p2) -- Line: 1291 -- upvalues: u0 (ref), u1 (ref)
                u0 = p1
                u1 = p2
            end)
            expect(nil).to.equal(1)
            expect(nil).to.equal(2)
        end)
    end)
    describe("Promise:andThenCall", function() -- Line: 1301 -- upvalues: Parent (val)
        it("should call the given function with arguments", function() -- Line: 1302 -- upvalues: Parent (upval)
            local u0, u1
            Parent.resolve():andThenCall(function(p1, p2) -- Line: 1304 -- upvalues: u0 (ref), u1 (ref)
                u0 = p1
                u1 = p2
            end, 3, 4)
            expect(nil).to.equal(3)
            expect(nil).to.equal(4)
        end)
    end)
    describe("Promise.some", function() -- Line: 1314 -- upvalues: Parent (val)
        it("should resolve once the goal is reached", function() -- Line: 1315 -- upvalues: Parent (upval)
            local v1 = {}
            local v2 = Parent.resolve(1)
            v1[1] = v2
            v1[2] = Parent.reject()
            v1[3] = Parent.resolve(2)
            local v3 = Parent.some(v1, 2)
            expect(v3:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v3._values[1][1]).to.equal(1)
            expect(v3._values[1][2]).to.equal(2)
        end)
        it("should error if the goal can't be reached", function() -- Line: 1326 -- upvalues: Parent (upval)
            local u22
            expect(Parent.some({Parent.resolve(), Parent.reject()}, 2):getStatus()).to.equal(Parent.Status.Rejected)
            local v1 = Parent.some({Parent.resolve(), Parent.new(function(p1, p2) -- Line: 1335 -- upvalues: u22 (ref)
                u22 = p2
            end)}, 2)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)("foo")
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1._values[1]).to.equal("foo")
        end)
        it("should cancel pending Promises once the goal is reached", function() -- Line: 1346 -- upvalues: Parent (upval)
            local u0
            local v1 = Parent.new(function() end)
            local v2 = Parent.new(function(p1) -- Line: 1349 -- upvalues: u0 (ref)
                u0 = p1
            end)
            local v3 = Parent.some({v1, v2, Parent.resolve()}, 2)
            expect(v3:getStatus()).to.equal(Parent.Status.Started)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)()
            expect(v3:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v2:getStatus()).to.equal(Parent.Status.Resolved)
        end)
        it("should error if passed a non-number", function() -- Line: 1370 -- upvalues: Parent (upval)
            expect(function() -- Line: 1371 -- upvalues: Parent (upval)
                Parent.some({}, "non-number")
            end).to.throw()
        end)
        it("should return an empty array if amount is 0", function() -- Line: 1376 -- upvalues: Parent (upval)
            local v1 = Parent.some({Parent.resolve(2)}, 0)
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(#v1._values[1]).to.equal(0)
        end)
        it("should not return extra values", function() -- Line: 1385 -- upvalues: Parent (upval)
            local v1 = {}
            local v2 = Parent.resolve(1)
            local v3 = Parent.resolve(2)
            local v4 = Parent.resolve(3)
            v1[1] = v2
            v1[2] = v3
            v1[3] = v4
            v1[4] = Parent.resolve(4)
            local v5 = Parent.some(v1, 2)
            expect(v5:getStatus()).to.equal(Parent.Status.Resolved)
            expect(#v5._values[1]).to.equal(2)
            expect(v5._values[1][1]).to.equal(1)
            expect(v5._values[1][2]).to.equal(2)
        end)
        it("should cancel promises if it is cancelled", function() -- Line: 1399 -- upvalues: Parent (upval)
            local v1 = Parent.new(function() end)
            v1:andThen(function() end)
            local v2 = {}
            local v3 = Parent.new(function() end)
            local v4 = Parent.new(function() end)
            v2[1] = v3
            v2[2] = v4
            v2[3] = v1
            Parent.some(v2, 3):cancel()
            expect(v2[1]:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v2[2]:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v2[3]:getStatus()).to.equal(Parent.Status.Started)
        end)
        describe("Promise.any", function() -- Line: 1416 -- upvalues: Parent (upval)
            it("should return the value directly", function() -- Line: 1417 -- upvalues: Parent (upval)
                local v1 = Parent.any({Parent.reject(), Parent.reject(), Parent.resolve(1)})
                expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
                expect(v1._values[1]).to.equal(1)
            end)
            it("should error if all are rejected", function() -- Line: 1428 -- upvalues: Parent (upval)
                expect(Parent.any({Parent.reject(), Parent.reject(), Parent.reject()}):getStatus()).to.equal(Parent.Status.Rejected)
            end)
        end)
    end)
    describe("Promise.allSettled", function() -- Line: 1438 -- upvalues: Parent (val)
        it("should resolve with an array of PromiseStatuses", function() -- Line: 1439 -- upvalues: Parent (upval)
            local u0
            local v1 = Parent.allSettled({Parent.resolve(), Parent.reject(), Parent.resolve(), Parent.new(function(p1, p2) -- Line: 1445 -- upvalues: u0 (ref)
                u0 = p2
            end)})
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)()
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1][1]).to.equal(Parent.Status.Resolved)
            expect(v1._values[1][2]).to.equal(Parent.Status.Rejected)
            expect(v1._values[1][3]).to.equal(Parent.Status.Resolved)
            expect(v1._values[1][4]).to.equal(Parent.Status.Rejected)
        end)
        it("should cancel promises if it is cancelled", function() -- Line: 1459 -- upvalues: Parent (upval)
            local v1 = Parent.new(function() end)
            v1:andThen(function() end)
            local v2 = {}
            local v3 = Parent.new(function() end)
            local v4 = Parent.new(function() end)
            v2[1] = v3
            v2[2] = v4
            v2[3] = v1
            Parent.allSettled(v2):cancel()
            expect(v2[1]:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v2[2]:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v2[3]:getStatus()).to.equal(Parent.Status.Started)
        end)
    end)
    describe("Promise:await", function() -- Line: 1477 -- upvalues: Parent (val), advanceTime (ref)
        it("should return the correct values", function() -- Line: 1478 -- upvalues: Parent (upval)
            local v1, v2, v3, v4, v5
            v1, v2, v3, v4, v5 = Parent.resolve(5, 6, nil, 7):await()
            expect(v1).to.equal(true)
            expect(v2).to.equal(5)
            expect(v3).to.equal(6)
            expect(v4).to.equal(nil)
            expect(v5).to.equal(7)
        end)
        it("should work if yielding is needed", function() -- Line: 1490 -- upvalues: Parent (upval), advanceTime (upval)
            local u0
            task.spawn(function() -- Line: 1492 -- upvalues: Parent (upval), u0 (ref)
                local v1
                _, v1 = Parent.delay(1):await()
                expect((type(v1))).to.equal("number")
                u0 = true
            end)
            advanceTime(2)
            expect(false).to.equal(true)
        end)
    end)
    describe("Promise:expect", function() -- Line: 1503 -- upvalues: Parent (val)
        it("should throw the correct values", function() -- Line: 1504 -- upvalues: Parent (upval)
            local v1, v2
            local v3 = {}
            local u4 = Parent.reject(v3)
            v1, v2 = pcall(function() -- Line: 1508 -- upvalues: u4 (val)
                u4:expect()
            end)
            expect(v1).to.equal(false)
            expect(v2).to.equal(v3)
        end)
    end)
    describe("Promise:now", function() -- Line: 1517 -- upvalues: Parent (val)
        it("should resolve if the Promise is resolved", function() -- Line: 1518 -- upvalues: Parent (upval)
            local v1, v2
            v1, v2 = Parent.resolve("foo"):now():_unwrap()
            expect(v1).to.equal(true)
            expect(v2).to.equal("foo")
        end)
        it("should reject if the Promise is not resolved", function() -- Line: 1525 -- upvalues: Parent (upval)
            local v1, v2
            v1, v2 = Parent.new(function() end):now():_unwrap()
            expect(v1).to.equal(false)
            expect(Parent.Error.isKind(v2, "NotResolvedInTime")).to.equal(true)
        end)
        it("should reject with a custom rejection value", function() -- Line: 1532 -- upvalues: Parent (upval)
            local v1, v2
            v1, v2 = Parent.new(function() end):now("foo"):_unwrap()
            expect(v1).to.equal(false)
            expect(v2).to.equal("foo")
        end)
    end)
    describe("Promise.each", function() -- Line: 1540 -- upvalues: Parent (val)
        it("should iterate", function() -- Line: 1541 -- upvalues: Parent (upval)
            local v1, v2
            v1, v2 = Parent.each({"foo", "bar", "baz", "qux"}, function(...) -- Line: 1547
                return {...}
            end):_unwrap()
            expect(v1).to.equal(true)
            expect(v2[1][1]).to.equal("foo")
            expect(v2[1][2]).to.equal(1)
            expect(v2[2][1]).to.equal("bar")
            expect(v2[2][2]).to.equal(2)
            expect(v2[3][1]).to.equal("baz")
            expect(v2[3][2]).to.equal(3)
            expect(v2[4][1]).to.equal("qux")
            expect(v2[4][2]).to.equal(4)
        end)
        it("should iterate serially", function() -- Line: 1562 -- upvalues: Parent (upval)
            local u0 = {}
            local u1 = {}
            local v1 = Parent.each({"foo", "bar", "baz"}, function(p1, p2) -- Line: 1570 -- upvalues: u1 (val), Parent (upval), u0 (val)
                u1[p2] = (u1[p2] or 0) + 1
                return Parent.new(function(a1) -- Line: 1573 -- upvalues: u0 (upval), p1 (val)
                    table.insert(u0, function() -- Line: 1574 -- upvalues: a1 (val), p1 (upval)
                        a1(p1:upper())
                    end)
                end)
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            expect(#u0).to.equal(1)
            expect(u1[1]).to.equal(1)
            expect(u1[2]).to.never.be.ok()
            table.remove(u0, 1)()
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            expect(#u0).to.equal(1)
            expect(u1[1]).to.equal(1)
            expect(u1[2]).to.equal(1)
            expect(u1[3]).to.never.be.ok()
            table.remove(u0, 1)()
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            expect(u1[1]).to.equal(1)
            expect(u1[2]).to.equal(1)
            expect(u1[3]).to.equal(1)
            table.remove(u0, 1)()
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect((type(v1._values[1]))).to.equal("table")
            expect((type(v1._values[2]))).to.equal("nil")
            local v2 = v1._values[1]
            expect(v2[1]).to.equal("FOO")
            expect(v2[2]).to.equal("BAR")
            expect(v2[3]).to.equal("BAZ")
        end)
        it("should reject with the value if the predicate promise rejects", function() -- Line: 1613 -- upvalues: Parent (upval)
            local v1 = Parent.each({1, 2, 3}, function() -- Line: 1614 -- upvalues: Parent (upval)
                return Parent.reject("foobar")
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1._values[1]).to.equal("foobar")
        end)
        it("should allow Promises to be in the list and wait when it gets to them", function() -- Line: 1622 -- upvalues: Parent (upval)
            local u0
            local v1 = Parent.new(function(p1) -- Line: 1624 -- upvalues: u0 (ref)
                u0 = p1
            end)
            local v2 = Parent.each({v1}, function(p1) -- Line: 1630
                return p1 * 2
            end)
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)(2)
            expect(v2:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v2._values[1][1]).to.equal(4)
        end)
        it("should reject with the value if a Promise from the list rejects", function() -- Line: 1642 -- upvalues: Parent (upval)
            local u0
            local v1 = Parent.each({1, 2, Parent.reject("foobar")}, function(p1) -- Line: 1644 -- upvalues: u0 (ref)
                u0 = true
                return "never"
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1._values[1]).to.equal("foobar")
            expect(false).to.equal(false)
        end)
        it("should reject immediately if there's a cancelled Promise in the list initially", function() -- Line: 1654 -- upvalues: Parent (upval)
            local u7
            local v1 = Parent.new(function() end)
            v1:cancel()
            local v2 = Parent.each({1, 2, v1}, function() -- Line: 1659 -- upvalues: u7 (ref)
                u7 = true
            end)
            expect(v2:getStatus()).to.equal(Parent.Status.Rejected)
            expect(false).to.equal(false)
            expect(v2._values[1].kind).to.equal(Parent.Error.Kind.AlreadyCancelled)
        end)
        it("should stop iteration if Promise.each is cancelled", function() -- Line: 1668 -- upvalues: Parent (upval)
            local u0 = {}
            local v1 = Parent.each({"foo", "bar", "baz"}, function(p1, p2) -- Line: 1675 -- upvalues: u0 (val), Parent (upval)
                u0[p2] = (u0[p2] or 0) + 1
                return Parent.new(function() end)
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            expect(u0[1]).to.equal(1)
            expect(u0[2]).to.never.be.ok()
            v1:cancel()
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(u0[1]).to.equal(1)
            expect(u0[2]).to.never.be.ok()
        end)
        it("should cancel the Promise returned from the predicate if Promise.each is cancelled", function() -- Line: 1692 -- upvalues: Parent (upval)
            local u0 = nil
            Parent.each({"foo", "bar", "baz"}, function(p1, p2) -- Line: 1699 -- upvalues: u0 (ref), Parent (upval)
                u0 = Parent.new(function() end)
                return u0
            end):cancel()
            expect(u0:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
        it("should cancel Promises in the list if Promise.each is cancelled", function() -- Line: 1709 -- upvalues: Parent (upval)
            local v1 = Parent.new(function() end)
            Parent.each({v1}, function() end):cancel()
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
    end)
    describe("Promise.retry", function() -- Line: 1720 -- upvalues: Parent (val)
        it("should retry N times", function() -- Line: 1721 -- upvalues: Parent (upval)
            local u0 = 0
            local v1 = Parent.retry(function(p1) -- Line: 1724 -- upvalues: u0 (ref), Parent (upval)
                expect(p1).to.equal("foo")
                u0 = u0 + 1
                if u0 == 5 then
                    return Parent.resolve("ok")
                end
                return Parent.reject("fail")
            end, 5, "foo")
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal("ok")
        end)
        it("should reject if threshold is exceeded", function() -- Line: 1740 -- upvalues: Parent (upval)
            local v1 = Parent.retry(function() -- Line: 1741 -- upvalues: Parent (upval)
                return Parent.reject("fail")
            end, 5)
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1._values[1]).to.equal("fail")
        end)
    end)
    describe("Promise.retryWithDelay", function() -- Line: 1750 -- upvalues: Parent (val), advanceTime (ref)
        it("should retry after a delay", function() -- Line: 1751 -- upvalues: Parent (upval), advanceTime (upval)
            local u0 = 0
            local v1 = Parent.retryWithDelay(function(p1) -- Line: 1754 -- upvalues: u0 (ref), Parent (upval)
                expect(p1).to.equal("foo")
                u0 = u0 + 1
                if u0 == 3 then
                    return Parent.resolve("ok")
                end
                return Parent.reject("fail")
            end, 3, 10, "foo")
            expect(u0).to.equal(1)
            advanceTime(11)
            expect(u0).to.equal(2)
            advanceTime(11)
            expect(u0).to.equal(3)
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal("ok")
        end)
    end)
    describe("Promise.fromEvent", function() -- Line: 1781 -- upvalues: Parent (val)
        it("should convert a Promise into an event", function() -- Line: 1782 -- upvalues: Parent (upval)
            local BindableEvent = Instance.new("BindableEvent")
            local v1 = Parent.fromEvent(BindableEvent.Event)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            BindableEvent:Fire("foo")
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal("foo")
        end)
        it("should convert a Promise into an event with the predicate", function() -- Line: 1795 -- upvalues: Parent (upval)
            local v1
            local BindableEvent = Instance.new("BindableEvent")
            v1 = Parent.fromEvent(BindableEvent.Event, function(p1) -- Line: 1798
                local v1 = p1 == "foo"
                return v1
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            BindableEvent:Fire("bar")
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            BindableEvent:Fire("foo")
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal("foo")
        end)
    end)
    describe("Promise.is", function() -- Line: 1815 -- upvalues: Parent (val)
        it("should work with current version", function() -- Line: 1816 -- upvalues: Parent (upval)
            local v1 = Parent.resolve(1)
            expect(Parent.is(v1)).to.equal(true)
        end)
        it("should work with any object with an andThen", function() -- Line: 1822 -- upvalues: Parent (upval)
            expect(Parent.is({
                andThen = function() -- Line: 1824
                    return 1
                end,
            })).to.equal(true)
        end)
        it("should work with older promises", function() -- Line: 1832 -- upvalues: Parent (upval)
            local v1 = {prototype = {}}
            v1.__index = v1.prototype
            function v1.prototype.andThen(p1) end
            local v2 = setmetatable({}, v1)
            expect(Parent.is(v2)).to.equal(true)
        end)
    end)
end