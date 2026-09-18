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
--   File: ReplicatedStorage.Packages._Index.jsdotlua_promise@3.5.2.promise.init.spec
--                               Dumped in 0.0132 seconds
--                         Bytecode version 9  |  362 functions

return function() -- Line: 1
    local Parent = require(script.Parent)
    Parent.TEST = true
    local BindableEvent = Instance.new("BindableEvent")
    Parent._timeEvent = BindableEvent.Event
    local function waitForEvents() -- Line: 8
        task.defer(coroutine.running())
        coroutine.yield()
    end
    local pack = 0
    function Parent._getTime() -- Line: 16 -- upvalues: pack (ref)
        return pack
    end
    local function advanceTime(p1) -- Line: 20 -- upvalues: pack (ref), BindableEvent (val)
        local v1 = p1 or 0.016666666666666666
        pack = pack + v1
        BindableEvent:Fire(v1)
        task.defer(coroutine.running())
        coroutine.yield()
    end
    function pack(...) -- Line: 29
        return select("#", ...), {...}
    end
    describe("Promise.Status", function() -- Line: 35 -- upvalues: Parent (val)
        it("should error if indexing nil value", function() -- Line: 36 -- upvalues: Parent (upval)
            expect(function() end).to.throw()
        end)
    end)
    describe("Unhandled rejection signal", function() -- Line: 43 -- upvalues: Parent (val), advanceTime (ref)
        it("should call unhandled rejection callbacks", function() -- Line: 44 -- upvalues: Parent (upval), advanceTime (upval)
            local u3 = Parent.new(function(p1, p2) -- Line: 45
                p2(1, 2)
            end)
            local u4 = 0
            local v1 = Parent.onUnhandledRejection(function(p1, p2, p3) -- Line: 51 -- upvalues: u4 (ref), u3 (val)
                u4 = u4 + 1
                expect(p1).to.equal(u3)
                expect(p2).to.equal(1)
                expect(p3).to.equal(2)
            end)
            advanceTime()
            expect(u4).to.equal(1)
            v1()
            Parent.new(function(p1, p2) -- Line: 67
                p2(3, 4)
            end)
            advanceTime()
            expect(u4).to.equal(1)
        end)
    end)
    describe("Promise.new", function() -- Line: 77 -- upvalues: Parent (val)
        it("should instantiate with a callback", function() -- Line: 78 -- upvalues: Parent (upval)
            local v1 = Parent.new(function() end)
            expect(v1).to.be.ok()
        end)
        it("should invoke the given callback with resolve and reject", function() -- Line: 84 -- upvalues: Parent (upval)
            local u1, u2
            local u0 = 0
            local v1 = Parent.new(function(p1, p2) -- Line: 89 -- upvalues: u0 (ref), u1 (ref), u2 (ref)
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
        it("should resolve promises on resolve()", function() -- Line: 103 -- upvalues: Parent (upval)
            local u0 = 0
            local v1 = Parent.new(function(p1) -- Line: 106 -- upvalues: u0 (ref)
                u0 = u0 + 1
                p1()
            end)
            expect(v1).to.be.ok()
            expect(u0).to.equal(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
        end)
        it("should reject promises on reject()", function() -- Line: 116 -- upvalues: Parent (upval)
            local u0 = 0
            local v1 = Parent.new(function(p1, p2) -- Line: 119 -- upvalues: u0 (ref)
                u0 = u0 + 1
                p2()
            end)
            expect(v1).to.be.ok()
            expect(u0).to.equal(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
        end)
        it("should reject on error in callback", function() -- Line: 129 -- upvalues: Parent (upval)
            local u0 = 0
            local v1 = Parent.new(function() -- Line: 132 -- upvalues: u0 (ref)
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
        it("should work with C functions", function() -- Line: 147 -- upvalues: Parent (upval)
            expect(function() -- Line: 148 -- upvalues: Parent (upval)
                Parent.new(tick):andThen(tick)
            end).to.never.throw()
        end)
        it("should have a nice tostring", function() -- Line: 153 -- upvalues: Parent (upval)
            expect(tostring(Parent.resolve()):gmatch("Promise(Resolved)")).to.be.ok()
        end)
        it("should allow yielding", function() -- Line: 157 -- upvalues: Parent (upval)
            local BindableEvent = Instance.new("BindableEvent")
            local v1 = Parent.new(function(p1) -- Line: 159 -- upvalues: BindableEvent (val)
                BindableEvent.Event:Wait()
                p1(5)
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            BindableEvent:Fire()
            task.defer(coroutine.running())
            coroutine.yield()
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal(5)
        end)
        it("should preserve stack traces of resolve-chained promises", function() -- Line: 173 -- upvalues: Parent (upval)
            local function nestedCall(p1) -- Line: 174
                error(p1)
            end
            local v1 = Parent.new(function(p1) -- Line: 178 -- upvalues: Parent (upval)
                p1(Parent.new(function() -- Line: 179
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
        it("should report errors from Promises with _error (< v2)", function() -- Line: 196 -- upvalues: Parent (upval)
            local v1 = Parent.reject()
            v1._error = "Sample error"
            local v2 = Parent.resolve():andThenReturn(v1)
            expect(v2:getStatus()).to.equal(Parent.Status.Rejected)
            local v3 = tostring(v2._values[1])
            expect(v3:find("Sample error")).to.be.ok()
            expect(v3:find("...Rejected because it was chained to the following Promise, which encountered an error:")).to.be.ok()
            expect(v3:find("%[No stack trace available")).to.be.ok()
        end)
        it("should allow callable tables", function() -- Line: 212 -- upvalues: Parent (upval)
            local u8
            local v1 = {}
            local v2 = {
                __call = function(p1, p2) -- Line: 214
                    p2(1)
                end,
            }
            local v3 = Parent.new((setmetatable(v1, v2)))
            local v4 = {}
            local v5 = {
                __call = function(p1, p2) -- Line: 221 -- upvalues: u8 (ref)
                    expect(p2).to.equal(1)
                    u8 = true
                end,
            }
            v3:andThen((setmetatable(v4, v5)))
            expect(false).to.equal(true)
        end)
        it("should close the thread after resolve", function() -- Line: 230 -- upvalues: Parent (upval)
            local u0 = 0
            Parent.new(function(p1) -- Line: 232 -- upvalues: u0 (ref), Parent (upval)
                u0 = u0 + 1
                p1()
                Parent.delay(1):await()
                u0 = u0 + 1
            end)
            task.wait(1)
            expect(u0).to.equal(1)
        end)
    end)
    describe("Promise.defer", function() -- Line: 245 -- upvalues: Parent (val), advanceTime (ref)
        it("should execute after the time event", function() -- Line: 246 -- upvalues: Parent (upval), advanceTime (upval)
            local u0 = 0
            local v1 = Parent.defer(function(p1, p2, p3, p4) -- Line: 248 -- upvalues: u0 (ref)
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
    describe("Promise.delay", function() -- Line: 271 -- upvalues: Parent (val), advanceTime (ref)
        it("should schedule promise resolution", function() -- Line: 272 -- upvalues: Parent (upval), advanceTime (upval)
            local v1 = Parent.delay(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            advanceTime()
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            advanceTime(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
        end)
        it("should allow for delays to be cancelled", function() -- Line: 284 -- upvalues: Parent (upval), advanceTime (upval)
            local u3 = Parent.delay(2)
            Parent.delay(1):andThen(function() -- Line: 287 -- upvalues: u3 (val)
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
    describe("Promise.resolve", function() -- Line: 300 -- upvalues: Parent (val)
        it("should immediately resolve with a value", function() -- Line: 301 -- upvalues: Parent (upval)
            local v1 = Parent.resolve(5, 6)
            expect(v1).to.be.ok()
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal(5)
            expect(v1._values[2]).to.equal(6)
        end)
        it("should chain onto passed promises", function() -- Line: 310 -- upvalues: Parent (upval)
            local v1 = Parent.resolve(Parent.new(function(p1, p2) -- Line: 311
                p2(7)
            end))
            expect(v1).to.be.ok()
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1._values[1]).to.equal(7)
        end)
    end)
    describe("Promise.reject", function() -- Line: 321 -- upvalues: Parent (val)
        it("should immediately reject with a value", function() -- Line: 322 -- upvalues: Parent (upval)
            local v1 = Parent.reject(6, 7)
            expect(v1).to.be.ok()
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1._values[1]).to.equal(6)
            expect(v1._values[2]).to.equal(7)
        end)
        it("should pass a promise as-is as an error", function() -- Line: 331 -- upvalues: Parent (upval)
            local v1 = Parent.new(function(p1) -- Line: 332
                p1(6)
            end)
            local v2 = Parent.reject(v1)
            expect(v2).to.be.ok()
            expect(v2:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v2._values[1]).to.equal(v1)
        end)
    end)
    describe("Promise:andThen", function() -- Line: 344 -- upvalues: Parent (val), pack (val)
        it("should allow yielding", function() -- Line: 345 -- upvalues: Parent (upval)
            local BindableEvent = Instance.new("BindableEvent")
            local v1 = Parent.resolve():andThen(function() -- Line: 347 -- upvalues: BindableEvent (val)
                BindableEvent.Event:Wait()
                return 5
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            BindableEvent:Fire()
            task.defer(coroutine.running())
            coroutine.yield()
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal(5)
        end)
        it("should run andThens on a new thread", function() -- Line: 359 -- upvalues: Parent (upval)
            local u3
            local BindableEvent = Instance.new("BindableEvent")
            local v1 = Parent.new(function(p1) -- Line: 363 -- upvalues: u3 (ref)
                u3 = p1
            end)
            local v2 = v1:andThen(function() -- Line: 367 -- upvalues: BindableEvent (val)
                BindableEvent.Event:Wait()
                return 5
            end)
            local v3 = v1:andThen(function() -- Line: 372
                return "foo"
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)()
            expect(v3:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v3._values[1]).to.equal("foo")
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
        end)
        it("should chain onto resolved promises", function() -- Line: 383 -- upvalues: Parent (upval), pack (upval)
            local u0, u1
            local u2 = 0
            local u3 = 0
            local v1 = Parent.resolve(5)
            local v2 = v1:andThen(function(...) -- Line: 391 -- upvalues: u1 (ref), u0 (ref), pack (upval), u2 (ref)
                local v1, v2
                v1, v2 = pack(...)
                u1 = v1
                u0 = v2
                u2 = u2 + 1
            end, function() -- Line: 394 -- upvalues: u3 (ref)
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
        it("should chain onto rejected promises", function() -- Line: 414 -- upvalues: Parent (upval), pack (upval)
            local u0, u1
            local u2 = 0
            local u3 = 0
            local v1 = Parent.reject(5)
            local v2 = v1:andThen(function(...) -- Line: 422 -- upvalues: u3 (ref)
                u3 = u3 + 1
            end, function(...) -- Line: 424 -- upvalues: u1 (ref), u0 (ref), pack (upval), u2 (ref)
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
        it("should reject on error in callback", function() -- Line: 445 -- upvalues: Parent (upval)
            local u0 = 0
            local v1 = Parent.resolve(1):andThen(function() -- Line: 448 -- upvalues: u0 (ref)
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
        it("should chain onto asynchronously resolved promises", function() -- Line: 463 -- upvalues: Parent (upval)
            local u0, u1, u4
            local u2 = 0
            local u3 = 0
            local v1 = Parent.new(function(p1) -- Line: 470 -- upvalues: u4 (ref)
                u4 = p1
            end)
            local v2 = v1:andThen(function(...) -- Line: 474 -- upvalues: u0 (ref), u1 (ref), u2 (ref)
                u0 = {...}
                u1 = select("#", ...)
                u2 = u2 + 1
            end, function() -- Line: 478 -- upvalues: u3 (ref)
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
        it("should chain onto asynchronously rejected promises", function() -- Line: 503 -- upvalues: Parent (upval)
            local u0, u1, u4
            local u2 = 0
            local u3 = 0
            local v1 = Parent.new(function(p1, p2) -- Line: 510 -- upvalues: u4 (ref)
                u4 = p2
            end)
            local v2 = v1:andThen(function() -- Line: 514 -- upvalues: u3 (ref)
                u3 = u3 + 1
            end, function(...) -- Line: 516 -- upvalues: u0 (ref), u1 (ref), u2 (ref)
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
        it("should propagate errors through multiple levels", function() -- Line: 543 -- upvalues: Parent (upval)
            local u0, u1, u2
            local v1 = Parent.new(function(p1, p2) -- Line: 545
                p2(1, 2, 3)
            end):andThen(function() end)
            v1:catch(function(p1, p2, p3) -- Line: 547 -- upvalues: u0 (ref), u1 (ref), u2 (ref)
                u0 = p1
                u1 = p2
                u2 = p3
            end)
            expect(nil).to.equal(1)
            expect(nil).to.equal(2)
            expect(nil).to.equal(3)
        end)
        itSKIP("should not call queued callbacks from a cancelled sub-promise", function() -- Line: 557 -- upvalues: Parent (upval)
            local u0
            local u1 = 0
            local v1 = Parent.new(function(p1) -- Line: 561 -- upvalues: u0 (ref)
                u0 = p1
            end)
            v1:andThen(function() -- Line: 565 -- upvalues: u1 (ref)
                u1 = u1 + 1
            end)
            v1:andThen(function() -- Line: 570 -- upvalues: u1 (ref)
                u1 = u1 + 1
            end):cancel()
            ;(nil)("foo")
            expect(u1).to.equal(1)
        end)
    end)
    describe("Promise:cancel", function() -- Line: 581 -- upvalues: Parent (val), advanceTime (ref)
        it("should mark promises as cancelled and not resolve or reject them", function() -- Line: 582 -- upvalues: Parent (upval)
            local u0 = 0
            local u1 = 0
            local v1 = Parent.new(function() end):andThen(function() -- Line: 586 -- upvalues: u0 (ref)
                u0 = u0 + 1
            end)
            v1 = v1:finally(function() -- Line: 589 -- upvalues: u1 (ref)
                u1 = u1 + 1
            end)
            v1:cancel()
            v1:cancel()
            expect(u0).to.equal(0)
            expect(u1).to.equal(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
        it("should call the cancellation hook once", function() -- Line: 601 -- upvalues: Parent (upval)
            local u0 = 0
            local v1 = Parent.new(function(p1, p2, p3) -- Line: 604 -- upvalues: u0 (ref)
                p3(function() -- Line: 605 -- upvalues: u0 (upval)
                    u0 = u0 + 1
                end)
            end)
            v1:cancel()
            v1:cancel()
            expect(u0).to.equal(1)
        end)
        it("should propagate cancellations", function() -- Line: 616 -- upvalues: Parent (upval)
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
        it("should affect downstream promises", function() -- Line: 639 -- upvalues: Parent (upval)
            local v1 = Parent.new(function() end)
            local v2 = v1:andThen()
            v1:cancel()
            expect(v2:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
        it("should track consumers", function() -- Line: 648 -- upvalues: Parent (upval)
            local u3 = Parent.new(function() end)
            local v1 = Parent.resolve()
            local u10 = v1:andThen(function() -- Line: 651 -- upvalues: u3 (val)
                return u3
            end)
            local v2 = Parent.new(function(p1) -- Line: 654 -- upvalues: u10 (val)
                p1(u10)
            end)
            local v3 = v2:andThen(function() end)
            expect(u10._parent).to.never.equal(v1)
            expect(v2._parent).to.never.equal(u10)
            expect(v2._consumers[v3]).to.be.ok()
            expect(v3._parent).to.equal(v2)
        end)
        it("should cancel resolved pending promises", function() -- Line: 665 -- upvalues: Parent (upval)
            local u3 = Parent.new(function() end)
            local v1 = Parent.new(function(p1) -- Line: 668 -- upvalues: u3 (val)
                p1(u3)
            end):finally(function() end)
            v1:cancel()
            expect(u3._status).to.equal(Parent.Status.Cancelled)
            expect(v1._status).to.equal(Parent.Status.Cancelled)
        end)
        it("should close the promise thread", function() -- Line: 678 -- upvalues: Parent (upval), advanceTime (upval)
            local u0 = 0
            Parent.new(function() -- Line: 680 -- upvalues: u0 (ref), Parent (upval)
                u0 = u0 + 1
                Parent.delay(1):await()
                u0 = u0 + 1
            end):cancel()
            advanceTime(2)
            expect(u0).to.equal(1)
        end)
    end)
    describe("Promise:finally", function() -- Line: 693 -- upvalues: Parent (val)
        it("should be called upon resolve, reject, or cancel", function() -- Line: 694 -- upvalues: Parent (upval)
            local u0 = 0
            local function finally() -- Line: 697 -- upvalues: u0 (ref)
                u0 = u0 + 1
            end
            Parent.new(function(p1, p2) -- Line: 702
                p1()
            end):finally(finally)
            local v1 = Parent.resolve():andThen(function() end)
            v1 = v1:finally(finally)
            v1:finally(finally)
            Parent.reject():finally(finally)
            Parent.new(function() end):finally(finally):cancel()
            expect(u0).to.equal(5)
        end)
        itSKIP("should not forward return values", function() -- Line: 719 -- upvalues: Parent (upval)
            local u0
            local v1 = Parent.resolve(2):finally(function() -- Line: 723
                return 1
            end)
            v1:andThen(function(p1) -- Line: 726 -- upvalues: u0 (ref)
                u0 = p1
            end)
            expect(nil).to.equal(2)
        end)
        itSKIP("should not consume rejections", function() -- Line: 734 -- upvalues: Parent (upval)
            local u0, u1
            local v1 = Parent.reject(5):finally(function() -- Line: 738
                return 42
            end)
            v1 = v1:andThen(function() -- Line: 741 -- upvalues: u1 (ref)
                u1 = true
            end)
            v1:catch(function(p1) -- Line: 744 -- upvalues: u0 (ref)
                u0 = true
                expect(p1).to.equal(5)
            end)
            expect(false).to.equal(true)
            expect(false).to.equal(false)
        end)
        itSKIP("should wait for returned promises", function() -- Line: 754 -- upvalues: Parent (upval)
            local u0, v1
            local v2 = Parent.reject("foo"):finally(function() -- Line: 756 -- upvalues: Parent (upval), u0 (ref)
                return Parent.new(function(p1) -- Line: 757 -- upvalues: u0 (upval)
                    u0 = p1
                end)
            end)
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)()
            expect(v2:getStatus()).to.equal(Parent.Status.Rejected)
            _, v1 = v2:_unwrap()
            expect(v1).to.equal("foo")
        end)
        it("should reject with a returned rejected promise's value", function() -- Line: 771 -- upvalues: Parent (upval)
            local u0, v1
            local v2 = Parent.reject("foo"):finally(function() -- Line: 773 -- upvalues: Parent (upval), u0 (ref)
                return Parent.new(function(p1, p2) -- Line: 774 -- upvalues: u0 (upval)
                    u0 = p2
                end)
            end)
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)("bar")
            expect(v2:getStatus()).to.equal(Parent.Status.Rejected)
            _, v1 = v2:_unwrap()
            expect(v1).to.equal("bar")
        end)
        it("should reject when handler errors", function() -- Line: 788 -- upvalues: Parent (upval)
            local v1, v2
            local u0 = {}
            v1, v2 = Parent.reject("bar"):finally(function() -- Line: 790 -- upvalues: u0 (val)
                error(u0)
            end):_unwrap()
            expect(v1).to.equal(false)
            expect(v2).to.equal(u0)
        end)
        itSKIP("should not prevent cancellation", function() -- Line: 801 -- upvalues: Parent (upval)
            local u4
            local v1 = Parent.new(function() end)
            v1:finally(function() -- Line: 805 -- upvalues: u4 (ref)
                u4 = true
            end)
            v1:andThen(function() end):cancel()
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(false).to.equal(true)
        end)
        it("should propagate cancellation downwards", function() -- Line: 817 -- upvalues: Parent (upval)
            local u0
            local v1 = Parent.new(function() end)
            local v2 = v1:finally(function() -- Line: 822 -- upvalues: u0 (ref)
                u0 = true
            end)
            v1:cancel()
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v2:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(false).to.equal(true)
            expect(false).to.equal(false)
        end)
        it("should propagate cancellation upwards", function() -- Line: 835 -- upvalues: Parent (upval)
            local u0
            local v1 = Parent.new(function() end)
            local v2 = v1:finally(function() -- Line: 840 -- upvalues: u0 (ref)
                u0 = true
            end)
            v2:cancel()
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(v2:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(false).to.equal(true)
            expect(false).to.equal(false)
        end)
        it("should cancel returned promise if cancelled", function() -- Line: 853 -- upvalues: Parent (upval)
            local u3 = Parent.new(function() end)
            Parent.resolve():finally(function() -- Line: 856 -- upvalues: u3 (val)
                return u3
            end):cancel()
            expect(u3:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
    end)
    describe("Promise.all", function() -- Line: 866 -- upvalues: Parent (val), pack (val)
        it("should error if given something other than a table", function() -- Line: 867 -- upvalues: Parent (upval)
            expect(function() -- Line: 868 -- upvalues: Parent (upval)
                Parent.all(1)
            end).to.throw()
        end)
        it("should resolve instantly with an empty table if given no promises", function() -- Line: 873 -- upvalues: Parent (upval)
            local v1, v2
            local v3 = Parent.all({})
            v1, v2 = v3:_unwrap()
            expect(v1).to.equal(true)
            expect(v3:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v2).to.be.a("table")
            expect(next(v2)).to.equal(nil)
        end)
        it("should error if given non-promise values", function() -- Line: 883 -- upvalues: Parent (upval)
            expect(function() -- Line: 884 -- upvalues: Parent (upval)
                Parent.all({{}, {}, {}})
            end).to.throw()
        end)
        it("should wait for all promises to be resolved and return their values", function() -- Line: 889 -- upvalues: pack (upval), Parent (upval)
            local u7, v1, v2, v3, v4
            local u0 = {}
            v1, u7 = pack(1, "A string", nil, false)
            local v5 = {}
            local v6 = v1
            local v7 = 1
            for i = 1, v6, v7 do
                v5[i] = Parent.new(function(p1) -- Line: 897 -- upvalues: u0 (val), i (val), u7 (val)
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
        it("should reject if any individual promise rejected", function() -- Line: 922 -- upvalues: Parent (upval), pack (upval)
            local u0, u1, v1, v2, v3, v4, v5
            local v6 = Parent.new(function(p1, p2) -- Line: 926 -- upvalues: u0 (ref)
                u0 = p2
            end)
            local v7 = Parent.new(function(p1) -- Line: 930 -- upvalues: u1 (ref)
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
        it("should not resolve if resolved after rejecting", function() -- Line: 951 -- upvalues: Parent (upval), pack (upval)
            local u0, u1, v1, v2, v3, v4, v5
            local v6 = Parent.new(function(p1, p2) -- Line: 955 -- upvalues: u0 (ref)
                u0 = p2
            end)
            local v7 = Parent.new(function(p1) -- Line: 959 -- upvalues: u1 (ref)
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
        it("should only reject once", function() -- Line: 979 -- upvalues: Parent (upval), pack (upval)
            local u0, u1, v1, v2, v3, v4, v5
            local v6 = Parent.new(function(p1, p2) -- Line: 983 -- upvalues: u0 (ref)
                u0 = p2
            end)
            local v7 = Parent.new(function(p1, p2) -- Line: 987 -- upvalues: u1 (ref)
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
        itSKIP("should error if a non-array table is passed in", function() -- Line: 1011 -- upvalues: Parent (upval)
            local v1, v2
            v1, v2 = pcall(function() -- Line: 1012 -- upvalues: Parent (upval)
                Parent.all(Parent.new(function() end))
            end)
            expect(v1).to.be.ok()
            expect(v2:find("Non%-promise")).to.be.ok()
        end)
        it("should cancel pending promises if one rejects", function() -- Line: 1020 -- upvalues: Parent (upval)
            local v1 = Parent.new(function() end)
            expect(Parent.all({Parent.resolve(), Parent.reject(), v1}):getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
        it("should cancel promises if it is cancelled", function() -- Line: 1030 -- upvalues: Parent (upval)
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
    describe("Promise.fold", function() -- Line: 1048 -- upvalues: Parent (val), advanceTime (ref)
        it("should return the initial value in a promise when the list is empty", function() -- Line: 1049 -- upvalues: Parent (upval)
            local v1 = {}
            local v2 = Parent.fold({}, function() -- Line: 1051
                error("should not be called")
            end, v1)
            expect(Parent.is(v2)).to.equal(true)
            expect(v2:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v2:expect()).to.equal(v1)
        end)
        it("should accept promises in the list", function() -- Line: 1060 -- upvalues: Parent (upval)
            local u0
            local v1 = {}
            local v2 = Parent.new(function(p1) -- Line: 1063 -- upvalues: u0 (ref)
                u0 = p1
            end)
            v1[1] = v2
            v1[2] = 2
            v1[3] = 3
            local v3 = Parent.fold(v1, function(p1, p2) -- Line: 1065
                return p1 + p2
            end, 0)
            ;(nil)(1)
            expect(Parent.is(v3)).to.equal(true)
            expect(v3:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v3:expect()).to.equal(6)
        end)
        it("should always return a promise even if the list or reducer don't use them", function() -- Line: 1076 -- upvalues: Parent (upval), advanceTime (upval)
            local v1 = Parent.fold({1, 2, 3}, function(p1, p2, p3) -- Line: 1077 -- upvalues: Parent (upval)
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
        it("should return the first rejected promise", function() -- Line: 1091 -- upvalues: Parent (upval)
            local v1, v2
            local v3 = Parent.fold({1, 2, 3}, function(p1, p2, p3) -- Line: 1093 -- upvalues: Parent (upval)
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
        it("should return the first canceled promise", function() -- Line: 1106 -- upvalues: Parent (upval)
            local u0 = nil
            local v1 = Parent.fold({1, 2, 3}, function(p1, p2, p3) -- Line: 1108 -- upvalues: u0 (ref), Parent (upval)
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
    describe("Promise.race", function() -- Line: 1125 -- upvalues: Parent (val)
        it("should resolve with the first settled value", function() -- Line: 1126 -- upvalues: Parent (upval)
            local v1 = {}
            local v2 = Parent.resolve(1)
            v1[1] = v2
            v1[2] = Parent.resolve(2)
            local v3 = Parent.race(v1):andThen(function(p1) -- Line: 1130
                expect(p1).to.equal(1)
            end)
            expect(v3:getStatus()).to.equal(Parent.Status.Resolved)
        end)
        it("should cancel other promises", function() -- Line: 1137 -- upvalues: Parent (upval)
            local v1 = Parent.new(function() end)
            v1:andThen(function() end)
            local v2 = {}
            local v3 = Parent.new(function() end)
            v2[1] = v1
            v2[2] = v3
            v2[3] = Parent.new(function(p1) -- Line: 1143
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
        it("should error if a non-array table is passed in", function() -- Line: 1165 -- upvalues: Parent (upval)
            local v1, v2
            v1, v2 = pcall(function() -- Line: 1166 -- upvalues: Parent (upval)
                Parent.race(Parent.new(function() end))
            end)
            expect(v1).to.be.ok()
            expect(v2:find("Non%-promise")).to.be.ok()
        end)
        it("should cancel promises if it is cancelled", function() -- Line: 1174 -- upvalues: Parent (upval)
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
    describe("Promise.promisify", function() -- Line: 1192 -- upvalues: Parent (val)
        it("should wrap functions", function() -- Line: 1193 -- upvalues: Parent (upval)
            local v1, v2
            local v3 = Parent.promisify(function(p1) -- Line: 1194
                return p1 + 1
            end)(1)
            v1, v2 = v3:_unwrap()
            expect(v1).to.equal(true)
            expect(v3:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v2).to.equal(2)
        end)
        it("should catch errors after a yield", function() -- Line: 1207 -- upvalues: Parent (upval)
            local BindableEvent = Instance.new("BindableEvent")
            local v1 = Parent.promisify(function() -- Line: 1209 -- upvalues: BindableEvent (val)
                BindableEvent.Event:Wait()
                error("errortext")
            end)()
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            BindableEvent:Fire()
            task.defer(coroutine.running())
            coroutine.yield()
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(tostring(v1._values[1]):find("errortext")).to.be.ok()
        end)
    end)
    describe("Promise.tap", function() -- Line: 1224 -- upvalues: Parent (val)
        it("should thread through values", function() -- Line: 1225 -- upvalues: Parent (upval)
            local u0, u1
            local v1 = Parent.resolve(1):andThen(function(p1) -- Line: 1229
                return p1 + 1
            end)
            v1 = v1:tap(function(p1) -- Line: 1232 -- upvalues: u0 (ref)
                u0 = p1
                return p1 + 1
            end)
            v1:andThen(function(p1) -- Line: 1236 -- upvalues: u1 (ref)
                u1 = p1
            end)
            expect(nil).to.equal(2)
            expect(nil).to.equal(2)
        end)
        it("should chain onto promises", function() -- Line: 1244 -- upvalues: Parent (upval)
            local u0
            local u1 = nil
            local v1 = Parent.resolve(1):tap(function() -- Line: 1248 -- upvalues: Parent (upval), u0 (ref)
                return Parent.new(function(p1) -- Line: 1249 -- upvalues: u0 (upval)
                    u0 = p1
                end)
            end)
            v1 = v1:andThen(function(p1) -- Line: 1253 -- upvalues: u1 (ref)
                u1 = p1
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            expect(u1).to.never.be.ok()
            ;(nil)(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(u1).to.equal(1)
        end)
    end)
    describe("Promise.try", function() -- Line: 1267 -- upvalues: Parent (val)
        it("should catch synchronous errors", function() -- Line: 1268 -- upvalues: Parent (upval)
            local u0
            Parent.try(function() -- Line: 1270
                error("errortext")
            end):catch(function(p1) -- Line: 1272 -- upvalues: u0 (ref)
                u0 = tostring(p1)
            end)
            expect((nil):find("errortext")).to.be.ok()
        end)
        it("should reject with error objects", function() -- Line: 1279 -- upvalues: Parent (upval)
            local v1, v2
            local u0 = {}
            v1, v2 = Parent.try(function() -- Line: 1281 -- upvalues: u0 (val)
                error(u0)
            end):_unwrap()
            expect(v1).to.equal(false)
            expect(v2).to.equal(u0)
        end)
        it("should catch asynchronous errors", function() -- Line: 1289 -- upvalues: Parent (upval)
            local BindableEvent = Instance.new("BindableEvent")
            local v1 = Parent.try(function() -- Line: 1291 -- upvalues: BindableEvent (val)
                BindableEvent.Event:Wait()
                error("errortext")
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            BindableEvent:Fire()
            task.defer(coroutine.running())
            coroutine.yield()
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(tostring(v1._values[1]):find("errortext")).to.be.ok()
        end)
    end)
    describe("Promise:andThenReturn", function() -- Line: 1304 -- upvalues: Parent (val)
        it("should return the given values", function() -- Line: 1305 -- upvalues: Parent (upval)
            local u0, u1
            local v1 = Parent.resolve():andThenReturn(1, 2)
            v1:andThen(function(p1, p2) -- Line: 1308 -- upvalues: u0 (ref), u1 (ref)
                u0 = p1
                u1 = p2
            end)
            expect(nil).to.equal(1)
            expect(nil).to.equal(2)
        end)
    end)
    describe("Promise:doneReturn", function() -- Line: 1318 -- upvalues: Parent (val)
        it("should return the given values", function() -- Line: 1319 -- upvalues: Parent (upval)
            local u0, u1
            local v1 = Parent.resolve():doneReturn(1, 2)
            v1:andThen(function(p1, p2) -- Line: 1322 -- upvalues: u0 (ref), u1 (ref)
                u0 = p1
                u1 = p2
            end)
            expect(nil).to.equal(1)
            expect(nil).to.equal(2)
        end)
    end)
    describe("Promise:andThenCall", function() -- Line: 1332 -- upvalues: Parent (val)
        it("should call the given function with arguments", function() -- Line: 1333 -- upvalues: Parent (upval)
            local u0, u1
            Parent.resolve():andThenCall(function(p1, p2) -- Line: 1335 -- upvalues: u0 (ref), u1 (ref)
                u0 = p1
                u1 = p2
            end, 3, 4)
            expect(nil).to.equal(3)
            expect(nil).to.equal(4)
        end)
    end)
    describe("Promise:andThenAsync", function() -- Line: 1345 -- upvalues: Parent (val), advanceTime (ref), pack (val)
        it("should allow yielding", function() -- Line: 1346 -- upvalues: Parent (upval), advanceTime (upval)
            local BindableEvent = Instance.new("BindableEvent")
            local v1 = Parent.fromEvent(BindableEvent.Event):andThenAsync(function() -- Line: 1348
                return 5
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            BindableEvent:Fire()
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            advanceTime()
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal(5)
        end)
        it("should run andThenAsync on a new thread", function() -- Line: 1362 -- upvalues: Parent (upval), advanceTime (upval)
            local u3
            local BindableEvent = Instance.new("BindableEvent")
            local v1 = Parent.new(function(p1) -- Line: 1366 -- upvalues: u3 (ref)
                u3 = p1
            end)
            local v2 = v1:andThenAsync(function() -- Line: 1370 -- upvalues: BindableEvent (val)
                BindableEvent.Event:Wait()
                return 5
            end)
            local v3 = v1:andThenAsync(function() -- Line: 1375
                return "foo"
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)()
            expect(v3:getStatus()).to.equal(Parent.Status.Started)
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
            advanceTime()
            expect(v3:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v3._values[1]).to.equal("foo")
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
        end)
        it("should chain onto resolved promises", function() -- Line: 1392 -- upvalues: Parent (upval), pack (upval), advanceTime (upval)
            local u0, u1
            local u2 = 0
            local u3 = 0
            local v1 = Parent.resolve(5)
            local v2 = v1:andThenAsync(function(...) -- Line: 1400 -- upvalues: u1 (ref), u0 (ref), pack (upval), u2 (ref)
                local v1, v2
                v1, v2 = pack(...)
                u1 = v1
                u0 = v2
                u2 = u2 + 1
            end, function() -- Line: 1403 -- upvalues: u3 (ref)
                u3 = u3 + 1
            end)
            expect(u3).to.equal(0)
            expect(u2).to.equal(0)
            expect(v2).to.be.ok()
            expect(v2).never.to.equal(v1)
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
            expect(v1).to.be.ok()
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal(5)
            advanceTime()
            expect(u2).to.equal(1)
            expect(nil).to.equal(1)
            expect((nil)[1]).to.equal(5)
            expect(v2:getStatus()).to.equal(Parent.Status.Resolved)
            expect(#v2._values).to.equal(0)
        end)
        it("should chain onto rejected promises", function() -- Line: 1428 -- upvalues: Parent (upval), pack (upval), advanceTime (upval)
            local u0, u1
            local u2 = 0
            local u3 = 0
            local v1 = Parent.reject(5)
            local v2 = v1:andThenAsync(function(...) -- Line: 1436 -- upvalues: u3 (ref)
                u3 = u3 + 1
            end, function(...) -- Line: 1438 -- upvalues: u1 (ref), u0 (ref), pack (upval), u2 (ref)
                local v1, v2
                v1, v2 = pack(...)
                u1 = v1
                u0 = v2
                u2 = u2 + 1
            end)
            expect(u3).to.equal(0)
            expect(u2).to.equal(0)
            expect(v1).to.be.ok()
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1._values[1]).to.equal(5)
            expect(v2).to.be.ok()
            expect(v2).never.to.equal(v1)
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
            advanceTime()
            expect(u2).to.equal(1)
            expect(nil).to.equal(1)
            expect((nil)[1]).to.equal(5)
            expect(v2:getStatus()).to.equal(Parent.Status.Resolved)
            expect(#v2._values).to.equal(0)
        end)
        it("should reject on error in callback", function() -- Line: 1465 -- upvalues: Parent (upval), advanceTime (upval)
            local u0 = 0
            local v1 = Parent.resolve(1):andThenAsync(function() -- Line: 1468 -- upvalues: u0 (ref)
                u0 = u0 + 1
                error("hahah")
            end)
            expect(v1).to.be.ok()
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            expect(u0).to.equal(0)
            advanceTime()
            expect(u0).to.equal(1)
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(tostring(v1._values[1]):find("hahah")).to.be.ok()
            expect(tostring(v1._values[1]):find("init.spec")).to.be.ok()
            expect(tostring(v1._values[1]):find("runExecutor")).to.be.ok()
        end)
        it("should chain onto asynchronously resolved promises", function() -- Line: 1488 -- upvalues: Parent (upval), advanceTime (upval)
            local u0, u1, u4
            local u2 = 0
            local u3 = 0
            local v1 = Parent.new(function(p1) -- Line: 1495 -- upvalues: u4 (ref)
                u4 = p1
            end)
            local v2 = v1:andThenAsync(function(...) -- Line: 1499 -- upvalues: u0 (ref), u1 (ref), u2 (ref)
                u0 = {...}
                u1 = select("#", ...)
                u2 = u2 + 1
            end, function() -- Line: 1503 -- upvalues: u3 (ref)
                u3 = u3 + 1
            end)
            expect(u2).to.equal(0)
            expect(u3).to.equal(0)
            ;(nil)(6)
            expect(u2).to.equal(0)
            expect(u3).to.equal(0)
            expect(v1).to.be.ok()
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v2).to.be.ok()
            expect(v2).never.to.equal(v1)
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
            advanceTime()
            expect(u3).to.equal(0)
            expect(u2).to.equal(1)
            expect(nil).to.equal(1)
            expect((nil)[1]).to.equal(6)
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal(6)
            expect(v2:getStatus()).to.equal(Parent.Status.Resolved)
            expect(#v2._values).to.equal(0)
        end)
        it("should chain onto asynchronously rejected promises", function() -- Line: 1537 -- upvalues: Parent (upval), advanceTime (upval)
            local u0, u1, u4
            local u2 = 0
            local u3 = 0
            local v1 = Parent.new(function(p1, p2) -- Line: 1544 -- upvalues: u4 (ref)
                u4 = p2
            end)
            local v2 = v1:andThenAsync(function() -- Line: 1548 -- upvalues: u3 (ref)
                u3 = u3 + 1
            end, function(...) -- Line: 1550 -- upvalues: u0 (ref), u1 (ref), u2 (ref)
                u0 = {...}
                u1 = select("#", ...)
                u2 = u2 + 1
            end)
            expect(u2).to.equal(0)
            expect(u3).to.equal(0)
            ;(nil)(6)
            expect(u2).to.equal(0)
            expect(u3).to.equal(0)
            expect(v1).to.be.ok()
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v2).to.be.ok()
            expect(v2).never.to.equal(v1)
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
            advanceTime()
            expect(u3).to.equal(0)
            expect(u2).to.equal(1)
            expect(nil).to.equal(1)
            expect((nil)[1]).to.equal(6)
            expect(v2:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal(6)
            expect(#v2._values).to.equal(0)
        end)
        it("should propagate errors through multiple levels", function() -- Line: 1584 -- upvalues: Parent (upval), advanceTime (upval)
            local u0 = nil
            local u1 = nil
            local u2 = nil
            local v1 = Parent.new(function(p1, p2) -- Line: 1586
                p2(1, 2, 3)
            end):andThenAsync(function() end)
            v1:catch(function(p1, p2, p3) -- Line: 1588 -- upvalues: u0 (ref), u1 (ref), u2 (ref)
                u0 = p1
                u1 = p2
                u2 = p3
            end)
            expect(u0).to.equal(nil)
            expect(u1).to.equal(nil)
            expect(u2).to.equal(nil)
            advanceTime()
            expect(u0).to.equal(1)
            expect(u1).to.equal(2)
            expect(u2).to.equal(3)
        end)
        it("should propagate errors asynchronously through multiple levels", function() -- Line: 1603 -- upvalues: Parent (upval), advanceTime (upval)
            local u0 = nil
            local u1 = nil
            local u2 = nil
            local function handleErrors(p1, p2, p3) -- Line: 1606 -- upvalues: u0 (ref), u1 (ref), u2 (ref), Parent (upval)
                u0 = p1
                u1 = p2
                u2 = p3
                return Parent.reject(p1 * 10, p2 * 10, p3 * 10)
            end
            local v1 = Parent.new(function(p1, p2) -- Line: 1610
                p2(1, 2, 3)
            end):andThenAsync(function() end, handleErrors)
            v1 = v1:andThenAsync(function() end, handleErrors)
            v1 = v1:andThenAsync(function() end, handleErrors)
            v1:catch(function(p1, p2, p3) -- Line: 1616 -- upvalues: u0 (ref), u1 (ref), u2 (ref)
                local v1 = "caught " .. tostring(p1)
                local v2 = "caught " .. tostring(p2)
                u0 = v1
                u1 = v2
                u2 = "caught " .. tostring(p3)
            end)
            expect(u0).to.equal(nil)
            expect(u1).to.equal(nil)
            expect(u2).to.equal(nil)
            advanceTime()
            expect(u0).to.equal(1)
            expect(u1).to.equal(2)
            expect(u2).to.equal(3)
            advanceTime()
            expect(u0).to.equal(10)
            expect(u1).to.equal(20)
            expect(u2).to.equal(30)
            advanceTime()
            expect(u0).to.equal("caught 1000")
            expect(u1).to.equal("caught 2000")
            expect(u2).to.equal("caught 3000")
        end)
        it("should NOT propagate errors if error handler is provided", function() -- Line: 1644 -- upvalues: Parent (upval), advanceTime (upval)
            local u0 = nil
            local u1 = nil
            local u2 = nil
            local v1 = Parent.new(function(p1, p2) -- Line: 1646
                p2(1, 2, 3)
            end):andThenAsync(function() end, function() end)
            v1:catch(function(p1, p2, p3) -- Line: 1648 -- upvalues: u0 (ref), u1 (ref), u2 (ref)
                u0 = p1
                u1 = p2
                u2 = p3
            end)
            expect(u0).to.equal(nil)
            expect(u1).to.equal(nil)
            expect(u2).to.equal(nil)
            advanceTime()
            expect(u0).to.equal(nil)
            expect(u1).to.equal(nil)
            expect(u2).to.equal(nil)
        end)
    end)
    describe("Promise:doneCall", function() -- Line: 1664 -- upvalues: Parent (val)
        it("should call the given function with arguments", function() -- Line: 1665 -- upvalues: Parent (upval)
            local u0, u1
            Parent.resolve():doneCall(function(p1, p2) -- Line: 1667 -- upvalues: u0 (ref), u1 (ref)
                u0 = p1
                u1 = p2
            end, 3, 4)
            expect(nil).to.equal(3)
            expect(nil).to.equal(4)
        end)
    end)
    describe("Promise:done", function() -- Line: 1677 -- upvalues: Parent (val)
        it("should trigger on resolve or cancel", function() -- Line: 1678 -- upvalues: Parent (upval)
            local u38, u39
            local v1 = Parent.new(function() end)
            local u4 = nil
            local v2 = v1:done(function() -- Line: 1682 -- upvalues: u4 (ref)
                u4 = true
            end)
            expect(u4).to.never.be.ok()
            v1:cancel()
            expect(v2:getStatus()).to.equal(Parent.Status.Cancelled)
            expect(u4).to.equal(true)
            local v3 = Parent.reject():done(function() -- Line: 1692 -- upvalues: u38 (ref)
                u38 = true
            end)
            v3:finally(function() -- Line: 1694 -- upvalues: u39 (ref)
                u39 = true
            end)
            expect(nil).to.never.be.ok()
            expect(nil).to.be.ok()
        end)
    end)
    describe("Promise.some", function() -- Line: 1703 -- upvalues: Parent (val)
        it("should resolve once the goal is reached", function() -- Line: 1704 -- upvalues: Parent (upval)
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
        it("should error if the goal can't be reached", function() -- Line: 1715 -- upvalues: Parent (upval)
            local u22
            expect(Parent.some({Parent.resolve(), Parent.reject()}, 2):getStatus()).to.equal(Parent.Status.Rejected)
            local v1 = Parent.some({Parent.resolve(), Parent.new(function(p1, p2) -- Line: 1724 -- upvalues: u22 (ref)
                u22 = p2
            end)}, 2)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)("foo")
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1._values[1]).to.equal("foo")
        end)
        it("should cancel pending Promises once the goal is reached", function() -- Line: 1735 -- upvalues: Parent (upval)
            local u0
            local v1 = Parent.new(function() end)
            local v2 = Parent.new(function(p1) -- Line: 1738 -- upvalues: u0 (ref)
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
        it("should error if passed a non-number", function() -- Line: 1759 -- upvalues: Parent (upval)
            expect(function() -- Line: 1760 -- upvalues: Parent (upval)
                Parent.some({}, "non-number")
            end).to.throw()
        end)
        it("should return an empty array if amount is 0", function() -- Line: 1765 -- upvalues: Parent (upval)
            local v1 = Parent.some({Parent.resolve(2)}, 0)
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(#v1._values[1]).to.equal(0)
        end)
        it("should not return extra values", function() -- Line: 1774 -- upvalues: Parent (upval)
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
        it("should cancel promises if it is cancelled", function() -- Line: 1788 -- upvalues: Parent (upval)
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
        describe("Promise.any", function() -- Line: 1805 -- upvalues: Parent (upval)
            it("should return the value directly", function() -- Line: 1806 -- upvalues: Parent (upval)
                local v1 = Parent.any({Parent.reject(), Parent.reject(), Parent.resolve(1)})
                expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
                expect(v1._values[1]).to.equal(1)
            end)
            it("should error if all are rejected", function() -- Line: 1817 -- upvalues: Parent (upval)
                expect(Parent.any({Parent.reject(), Parent.reject(), Parent.reject()}):getStatus()).to.equal(Parent.Status.Rejected)
            end)
        end)
    end)
    describe("Promise.allSettled", function() -- Line: 1827 -- upvalues: Parent (val)
        it("should resolve with an array of PromiseStatuses", function() -- Line: 1828 -- upvalues: Parent (upval)
            local u0
            local v1 = Parent.allSettled({Parent.resolve(), Parent.reject(), Parent.resolve(), Parent.new(function(p1, p2) -- Line: 1834 -- upvalues: u0 (ref)
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
        it("should cancel promises if it is cancelled", function() -- Line: 1848 -- upvalues: Parent (upval)
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
    describe("Promise:await", function() -- Line: 1866 -- upvalues: Parent (val), advanceTime (ref)
        it("should return the correct values", function() -- Line: 1867 -- upvalues: Parent (upval)
            local v1, v2, v3, v4, v5
            v1, v2, v3, v4, v5 = Parent.resolve(5, 6, nil, 7):await()
            expect(v1).to.equal(true)
            expect(v2).to.equal(5)
            expect(v3).to.equal(6)
            expect(v4).to.equal(nil)
            expect(v5).to.equal(7)
        end)
        it("should work if yielding is needed", function() -- Line: 1879 -- upvalues: Parent (upval), advanceTime (upval)
            local u0
            task.spawn(function() -- Line: 1881 -- upvalues: Parent (upval), u0 (ref)
                local v1
                _, v1 = Parent.delay(1):await()
                expect((type(v1))).to.equal("number")
                u0 = true
            end)
            advanceTime(2)
            expect(false).to.equal(true)
        end)
    end)
    describe("Promise:expect", function() -- Line: 1892 -- upvalues: Parent (val)
        it("should throw the correct values", function() -- Line: 1893 -- upvalues: Parent (upval)
            local v1, v2
            local v3 = {}
            local u4 = Parent.reject(v3)
            v1, v2 = pcall(function() -- Line: 1897 -- upvalues: u4 (val)
                u4:expect()
            end)
            expect(v1).to.equal(false)
            expect(v2).to.equal(v3)
        end)
    end)
    describe("Promise:now", function() -- Line: 1906 -- upvalues: Parent (val)
        it("should resolve if the Promise is resolved", function() -- Line: 1907 -- upvalues: Parent (upval)
            local v1, v2
            v1, v2 = Parent.resolve("foo"):now():_unwrap()
            expect(v1).to.equal(true)
            expect(v2).to.equal("foo")
        end)
        it("should reject if the Promise is not resolved", function() -- Line: 1914 -- upvalues: Parent (upval)
            local v1, v2
            v1, v2 = Parent.new(function() end):now():_unwrap()
            expect(v1).to.equal(false)
            expect(Parent.Error.isKind(v2, "NotResolvedInTime")).to.equal(true)
        end)
        it("should reject with a custom rejection value", function() -- Line: 1921 -- upvalues: Parent (upval)
            local v1, v2
            v1, v2 = Parent.new(function() end):now("foo"):_unwrap()
            expect(v1).to.equal(false)
            expect(v2).to.equal("foo")
        end)
    end)
    describe("Promise.each", function() -- Line: 1929 -- upvalues: Parent (val)
        it("should iterate", function() -- Line: 1930 -- upvalues: Parent (upval)
            local v1, v2
            v1, v2 = Parent.each({"foo", "bar", "baz", "qux"}, function(...) -- Line: 1936
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
        it("should iterate serially", function() -- Line: 1951 -- upvalues: Parent (upval)
            local u0 = {}
            local u1 = {}
            local v1 = Parent.each({"foo", "bar", "baz"}, function(p1, p2) -- Line: 1959 -- upvalues: u1 (val), Parent (upval), u0 (val)
                u1[p2] = (u1[p2] or 0) + 1
                return Parent.new(function(a1) -- Line: 1962 -- upvalues: u0 (upval), p1 (val)
                    table.insert(u0, function() -- Line: 1963 -- upvalues: a1 (val), p1 (upval)
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
        it("should reject with the value if the predicate promise rejects", function() -- Line: 2002 -- upvalues: Parent (upval)
            local v1 = Parent.each({1, 2, 3}, function() -- Line: 2003 -- upvalues: Parent (upval)
                return Parent.reject("foobar")
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1._values[1]).to.equal("foobar")
        end)
        it("should allow Promises to be in the list and wait when it gets to them", function() -- Line: 2011 -- upvalues: Parent (upval)
            local u0
            local v1 = Parent.new(function(p1) -- Line: 2013 -- upvalues: u0 (ref)
                u0 = p1
            end)
            local v2 = Parent.each({v1}, function(p1) -- Line: 2019
                return p1 * 2
            end)
            expect(v2:getStatus()).to.equal(Parent.Status.Started)
            ;(nil)(2)
            expect(v2:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v2._values[1][1]).to.equal(4)
        end)
        it("should reject with the value if a Promise from the list rejects", function() -- Line: 2031 -- upvalues: Parent (upval)
            local u0
            local v1 = Parent.each({1, 2, Parent.reject("foobar")}, function(p1) -- Line: 2033 -- upvalues: u0 (ref)
                u0 = true
                return "never"
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1._values[1]).to.equal("foobar")
            expect(false).to.equal(false)
        end)
        it("should reject immediately if there's a cancelled Promise in the list initially", function() -- Line: 2043 -- upvalues: Parent (upval)
            local u7
            local v1 = Parent.new(function() end)
            v1:cancel()
            local v2 = Parent.each({1, 2, v1}, function() -- Line: 2048 -- upvalues: u7 (ref)
                u7 = true
            end)
            expect(v2:getStatus()).to.equal(Parent.Status.Rejected)
            expect(false).to.equal(false)
            expect(v2._values[1].kind).to.equal(Parent.Error.Kind.AlreadyCancelled)
        end)
        it("should stop iteration if Promise.each is cancelled", function() -- Line: 2057 -- upvalues: Parent (upval)
            local u0 = {}
            local v1 = Parent.each({"foo", "bar", "baz"}, function(p1, p2) -- Line: 2064 -- upvalues: u0 (val), Parent (upval)
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
        it("should cancel the Promise returned from the predicate if Promise.each is cancelled", function() -- Line: 2081 -- upvalues: Parent (upval)
            local u0 = nil
            Parent.each({"foo", "bar", "baz"}, function(p1, p2) -- Line: 2088 -- upvalues: u0 (ref), Parent (upval)
                u0 = Parent.new(function() end)
                return u0
            end):cancel()
            expect(u0:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
        it("should cancel Promises in the list if Promise.each is cancelled", function() -- Line: 2098 -- upvalues: Parent (upval)
            local v1 = Parent.new(function() end)
            Parent.each({v1}, function() end):cancel()
            expect(v1:getStatus()).to.equal(Parent.Status.Cancelled)
        end)
    end)
    describe("Promise.retry", function() -- Line: 2109 -- upvalues: Parent (val)
        it("should retry N times", function() -- Line: 2110 -- upvalues: Parent (upval)
            local u0 = 0
            local v1 = Parent.retry(function(p1) -- Line: 2113 -- upvalues: u0 (ref), Parent (upval)
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
        it("should reject if threshold is exceeded", function() -- Line: 2129 -- upvalues: Parent (upval)
            local v1 = Parent.retry(function() -- Line: 2130 -- upvalues: Parent (upval)
                return Parent.reject("fail")
            end, 5)
            expect(v1:getStatus()).to.equal(Parent.Status.Rejected)
            expect(v1._values[1]).to.equal("fail")
        end)
    end)
    describe("Promise.retryWithDelay", function() -- Line: 2139 -- upvalues: Parent (val), advanceTime (ref)
        it("should retry after a delay", function() -- Line: 2140 -- upvalues: Parent (upval), advanceTime (upval)
            local u0 = 0
            local v1 = Parent.retryWithDelay(function(p1) -- Line: 2143 -- upvalues: u0 (ref), Parent (upval)
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
    describe("Promise.fromEvent", function() -- Line: 2170 -- upvalues: Parent (val)
        it("should convert a Promise into an event", function() -- Line: 2171 -- upvalues: Parent (upval)
            local BindableEvent = Instance.new("BindableEvent")
            local v1 = Parent.fromEvent(BindableEvent.Event)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            BindableEvent:Fire("foo")
            task.defer(coroutine.running())
            coroutine.yield()
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal("foo")
        end)
        it("should convert a Promise into an event with the predicate", function() -- Line: 2185 -- upvalues: Parent (upval)
            local v1
            local BindableEvent = Instance.new("BindableEvent")
            v1 = Parent.fromEvent(BindableEvent.Event, function(p1) -- Line: 2188
                local v1 = p1 == "foo"
                return v1
            end)
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            BindableEvent:Fire("bar")
            task.defer(coroutine.running())
            coroutine.yield()
            expect(v1:getStatus()).to.equal(Parent.Status.Started)
            BindableEvent:Fire("foo")
            task.defer(coroutine.running())
            coroutine.yield()
            expect(v1:getStatus()).to.equal(Parent.Status.Resolved)
            expect(v1._values[1]).to.equal("foo")
        end)
    end)
    describe("Promise.is", function() -- Line: 2207 -- upvalues: Parent (val)
        it("should work with current version", function() -- Line: 2208 -- upvalues: Parent (upval)
            local v1 = Parent.resolve(1)
            expect(Parent.is(v1)).to.equal(true)
        end)
        it("should work with any object with an andThen", function() -- Line: 2214 -- upvalues: Parent (upval)
            expect(Parent.is({
                andThen = function() -- Line: 2216
                    return 1
                end,
            })).to.equal(true)
        end)
        it("should work with older promises", function() -- Line: 2224 -- upvalues: Parent (upval)
            local v1 = {prototype = {}}
            v1.__index = v1.prototype
            function v1.prototype.andThen(p1) end
            local v2 = setmetatable({}, v1)
            expect(Parent.is(v2)).to.equal(true)
        end)
    end)
end