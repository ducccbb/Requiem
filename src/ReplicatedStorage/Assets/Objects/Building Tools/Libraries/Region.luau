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
--        File: ReplicatedStorage.Assets.Objects.Building Tools.Libraries.Region
--                               Dumped in 0.0686 seconds
--                          Bytecode version 9  |  15 functions

script = nil
local v1 = getfenv(0)
v1.script = nil
_G.script = nil
v1 = getfenv(0)
v1.getfenv = nil
v1 = {}
local pointToObjectSpace = CFrame.new().pointToObjectSpace
local function BoxPointCollision(p1, p2, p3) -- Line: 78 -- upvalues: pointToObjectSpace (val)
    local v1 = pointToObjectSpace(p1, p3)
    local v2 = p2.x / 2
    local v3 = p2.y / 2
    local v4 = p2.z / 2
    local x = v1.x
    local y = v1.y
    local z = v1.z
    local v5 = if x * x < v2 * v2 then if y * y < v3 * v3 then z * z < v4 * v4 else false else false
    return v5
end
local pointToObjectSpace_2 = CFrame.new().pointToObjectSpace
local function BoxSphereCollision(p1, p2, p3, p4) -- Line: 90 -- upvalues: pointToObjectSpace_2 (val)
    local v1, v2, v3
    local v4 = pointToObjectSpace_2(p1, p3)
    local v5 = p2.x / 2
    local v6 = p2.y / 2
    local v7 = p2.z / 2
    local x = v4.x
    local y = v4.y
    local z = v4.z
    if v5 < x then
        v1 = x - v5
    elseif x >= -v5 then
        v1 = 0
    else
        v1 = x + v5
    end
    if v6 < y then
        v2 = y - v6
    elseif y >= -v6 then
        v2 = 0
    else
        v2 = y + v6
    end
    if v7 < z then
        v3 = z - v7
    elseif z >= -v7 then
        v3 = 0
    else
        v3 = z + v7
        if not v3 then
            v3 = 0
        end
    end
    local v8 = v1 * v1 + v2 * v2 + v3 * v3
    local v9 = v8 < p4 * p4
    return v9
end
local components = CFrame.new().components
local function BoxCollision(p1, p2, p3, p4, p5) -- Line: 116 -- upvalues: components (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30
    v25, v27, v28, v29, v30, v1, v2, v3, v4, v5, v6, v7 = components(p1)
    v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19 = components(p3)
    local v31 = p2.x / 2
    local v32 = p2.y / 2
    local v33 = p2.z / 2
    local v34 = p4.x / 2
    local v35 = p4.y / 2
    local v36 = p4.z / 2
    local v37 = v8 - v25
    local v38 = v9 - v27
    local v39 = v10 - v28
    local v40 = v29 * v37 + v2 * v38 + v5 * v39
    local v41 = v30 * v37 + v3 * v38 + v6 * v39
    local v42 = v1 * v37 + v4 * v38 + v7 * v39
    local v43 = v11 * v37 + v14 * v38 + v17 * v39
    local v44 = v12 * v37 + v15 * v38 + v18 * v39
    local v45 = v13 * v37 + v16 * v38
    local v46 = v45 + v19 * v39
    if v34 < v43 then
        v45 = v43 - v34
    elseif v43 >= -v34 then
        v45 = 0
    else
        v45 = v43 + v34
    end
    if v35 < v44 then
        v20 = v44 - v35
    elseif v44 >= -v35 then
        v20 = 0
    else
        v20 = v44 + v35
    end
    if v36 < v46 then
        v21 = v46 - v36
    elseif v46 >= -v36 then
        v21 = 0
    else
        v21 = v46 + v36
    end
    if v31 < v40 then
        v22 = v40 - v31
    elseif v40 >= -v31 then
        v22 = 0
    else
        v22 = v40 + v31
    end
    if v32 < v41 then
        v23 = v41 - v32
    elseif v41 >= -v32 then
        v23 = 0
    else
        v23 = v41 + v32
    end
    if v33 < v42 then
        v24 = v42 - v33
    elseif v42 >= -v33 then
        v24 = 0
    else
        v24 = v42 + v33
    end
    local v47 = v45 * v45 + v20 * v20 + v21 * v21
    local v48 = v22 * v22 + v23 * v23
    local v49 = v48 + v24 * v24
    if v31 >= v32 then
        if v32 >= v33 then
            v48 = v33
        else
            v48 = v32
        end
    elseif v31 >= v33 then
        v48 = v33
    else
        v48 = v31
    end
    if v34 >= v35 then
        if v35 >= v36 then
            v26 = v36
        else
            v26 = v35
        end
    elseif v34 >= v36 then
        v26 = v36
    else
        v26 = v34
    end
    if v47 < v48 * v48 then
        return true
    else
        if v49 < v26 * v26 then
            return true
        end
        local v50 = v31 * v31 + v32 * v32
        if v50 + v33 * v33 < v47 then
            return false
        else
            v50 = v34 * v34 + v35 * v35
            if v50 + v36 * v36 < v49 then
                return false
            end
            if p5 ~= nil then
                return p5
            else
                local v51, v52
                local v53 = v29 * v11 + v2 * v14 + v5 * v17
                v50 = v29 * v12 + v2 * v15 + v5 * v18
                local v54 = v29 * v13 + v2 * v16 + v5 * v19
                local v55 = v30 * v11 + v3 * v14 + v6 * v17
                local v56 = v30 * v12 + v3 * v15 + v6 * v18
                local v57 = v30 * v13 + v3 * v16 + v6 * v19
                local v58 = v1 * v11 + v4 * v14 + v7 * v17
                local v59 = v1 * v12 + v4 * v15 + v7 * v18
                local v60 = v1 * v13 + v4 * v16 + v7 * v19
                local v61 = v36 * v36
                local v62 = v34 * v34
                local v63 = v35 * v35
                local v64 = v31 * v53
                local v65 = v32 * v55
                local v66 = v33 * v58
                local v67 = v31 * v50
                local v68 = v32 * v56
                local v69 = v33 * v59
                local v70 = v31 * v54
                local v71 = v32 * v57
                local v72 = v33 * v60
                local v73 = v64 + v65 + v66 - v43
                if v73 * v73 >= v62 then
                    local v74
                    v51 = -v64 + v65 + v66 - v43
                    if v51 * v51 >= v62 then
                        local v75
                        v52 = v64 - v65 + v66 - v43
                        if v52 * v52 >= v62 then
                            local v76
                            v74 = -v64 - v65 + v66 - v43
                            if v74 * v74 >= v62 then
                                local v77
                                v75 = v64 + v65 - v66 - v43
                                if v75 * v75 >= v62 then
                                    local v78
                                    v76 = -v64 + v65 - v66 - v43
                                    if v76 * v76 >= v62 then
                                        local v79
                                        v77 = v64 - v65 - v66 - v43
                                        if v77 * v77 >= v62 then
                                            local v80
                                            v78 = -v64 - v65 - v66 - v43
                                            if v78 * v78 >= v62 then
                                                local v81, v82
                                                v79 = v31 * v31
                                                v80 = v32 * v32
                                                local v83 = v33 * v33
                                                local v84 = v34 * v58
                                                local v85 = v35 * v59
                                                local v86 = v34 * v53
                                                local v87 = v35 * v50
                                                local v88 = v34 * v55
                                                local v89 = v35 * v56
                                                local v90 = v36 * v60
                                                local v91 = v36 * v54
                                                local v92 = v36 * v57
                                                local v93 = (v42 - v33 + v84 + v85) / v60
                                                if v93 * v93 >= v61 then
                                                    local v94
                                                    v81 = (v42 + v33 + v84 + v85) / v60
                                                    if v81 * v81 >= v61 then
                                                        local v95
                                                        v82 = (v42 - v33 - v84 + v85) / v60
                                                        if v82 * v82 >= v61 then
                                                            local v96
                                                            v94 = (v42 + v33 - v84 + v85) / v60
                                                            if v94 * v94 >= v61 then
                                                                local v97
                                                                v95 = (v42 - v33 + v84 - v85) / v60
                                                                if v95 * v95 >= v61 then
                                                                    local v98
                                                                    v96 = (v42 + v33 + v84 - v85) / v60
                                                                    if v96 * v96 >= v61 then
                                                                        local v99
                                                                        v97 = (v42 - v33 - v84 - v85) / v60
                                                                        if v97 * v97 >= v61 then
                                                                            local v100
                                                                            v98 = (v42 + v33 - v84 - v85) / v60
                                                                            if v98 * v98 >= v61 then
                                                                                local v101
                                                                                v99 = (v40 - v31 + v86 + v87) / v54
                                                                                if v99 * v99 >= v61 then
                                                                                    local v102
                                                                                    v100 = (v40 + v31 + v86 + v87) / v54
                                                                                    if v100 * v100 >= v61 then
                                                                                        local v103
                                                                                        v101 = (v40 - v31 - v86 + v87) / v54
                                                                                        if v101 * v101 >= v61 then
                                                                                            local v104
                                                                                            v102 = (v40 + v31 - v86 + v87) / v54
                                                                                            if v102 * v102 >= v61 then
                                                                                                local v105
                                                                                                v103 = (v40 - v31 + v86 - v87) / v54
                                                                                                if v103 * v103 >= v61 then
                                                                                                    local v106
                                                                                                    v104 = (v40 + v31 + v86 - v87) / v54
                                                                                                    if v104 * v104 >= v61 then
                                                                                                        local v107
                                                                                                        v105 = (v40 - v31 - v86 - v87) / v54
                                                                                                        if v105 * v105 >= v61 then
                                                                                                            local v108
                                                                                                            v106 = (v40 + v31 - v86 - v87) / v54
                                                                                                            if v106 * v106 >= v61 then
                                                                                                                local v109
                                                                                                                v107 = (v41 - v32 + v88 + v89) / v57
                                                                                                                if v107 * v107 >= v61 then
                                                                                                                    local v110
                                                                                                                    v108 = (v41 + v32 + v88 + v89) / v57
                                                                                                                    if v108 * v108 >= v61 then
                                                                                                                        local v111
                                                                                                                        v109 = (v41 - v32 - v88 + v89) / v57
                                                                                                                        if v109 * v109 >= v61 then
                                                                                                                            local v112
                                                                                                                            v110 = (v41 + v32 - v88 + v89) / v57
                                                                                                                            if v110 * v110 >= v61 then
                                                                                                                                local v113
                                                                                                                                v111 = (v41 - v32 + v88 - v89) / v57
                                                                                                                                if v111 * v111 >= v61 then
                                                                                                                                    local v114
                                                                                                                                    v112 = (v41 + v32 + v88 - v89) / v57
                                                                                                                                    if v112 * v112 >= v61 then
                                                                                                                                        local v115
                                                                                                                                        v113 = (v41 - v32 - v88 - v89) / v57
                                                                                                                                        if v113 * v113 >= v61 then
                                                                                                                                            local v116
                                                                                                                                            v114 = (v41 + v32 - v88 - v89) / v57
                                                                                                                                            if v114 * v114 >= v61 then
                                                                                                                                                local v117
                                                                                                                                                v115 = (v42 - v33 + v85 + v90) / v58
                                                                                                                                                if v115 * v115 >= v62 then
                                                                                                                                                    local v118
                                                                                                                                                    v116 = (v42 + v33 + v85 + v90) / v58
                                                                                                                                                    if v116 * v116 >= v62 then
                                                                                                                                                        local v119
                                                                                                                                                        v117 = (v42 - v33 - v85 + v90) / v58
                                                                                                                                                        if v117 * v117 >= v62 then
                                                                                                                                                            local v120
                                                                                                                                                            v118 = (v42 + v33 - v85 + v90) / v58
                                                                                                                                                            if v118 * v118 >= v62 then
                                                                                                                                                                local v121
                                                                                                                                                                v119 = (v42 - v33 + v85 - v90) / v58
                                                                                                                                                                if v119 * v119 >= v62 then
                                                                                                                                                                    local v122
                                                                                                                                                                    v120 = (v42 + v33 + v85 - v90) / v58
                                                                                                                                                                    if v120 * v120 >= v62 then
                                                                                                                                                                        local v123
                                                                                                                                                                        v121 = (v42 - v33 - v85 - v90) / v58
                                                                                                                                                                        if v121 * v121 >= v62 then
                                                                                                                                                                            local v124
                                                                                                                                                                            v122 = (v42 + v33 - v85 - v90) / v58
                                                                                                                                                                            if v122 * v122 >= v62 then
                                                                                                                                                                                local v125
                                                                                                                                                                                v123 = (v40 - v31 + v87 + v91) / v53
                                                                                                                                                                                if v123 * v123 >= v62 then
                                                                                                                                                                                    local v126
                                                                                                                                                                                    v124 = (v40 + v31 + v87 + v91) / v53
                                                                                                                                                                                    if v124 * v124 >= v62 then
                                                                                                                                                                                        local v127
                                                                                                                                                                                        v125 = (v40 - v31 - v87 + v91) / v53
                                                                                                                                                                                        if v125 * v125 >= v62 then
                                                                                                                                                                                            local v128
                                                                                                                                                                                            v126 = (v40 + v31 - v87 + v91) / v53
                                                                                                                                                                                            if v126 * v126 >= v62 then
                                                                                                                                                                                                local v129
                                                                                                                                                                                                v127 = (v40 - v31 + v87 - v91) / v53
                                                                                                                                                                                                if v127 * v127 >= v62 then
                                                                                                                                                                                                    local v130
                                                                                                                                                                                                    v128 = (v40 + v31 + v87 - v91) / v53
                                                                                                                                                                                                    if v128 * v128 >= v62 then
                                                                                                                                                                                                        local v131
                                                                                                                                                                                                        v129 = (v40 - v31 - v87 - v91) / v53
                                                                                                                                                                                                        if v129 * v129 >= v62 then
                                                                                                                                                                                                            local v132
                                                                                                                                                                                                            v130 = (v40 + v31 - v87 - v91) / v53
                                                                                                                                                                                                            if v130 * v130 >= v62 then
                                                                                                                                                                                                                local v133
                                                                                                                                                                                                                v131 = (v41 - v32 + v89 + v92) / v55
                                                                                                                                                                                                                if v131 * v131 >= v62 then
                                                                                                                                                                                                                    local v134
                                                                                                                                                                                                                    v132 = (v41 + v32 + v89 + v92) / v55
                                                                                                                                                                                                                    if v132 * v132 >= v62 then
                                                                                                                                                                                                                        local v135
                                                                                                                                                                                                                        v133 = (v41 - v32 - v89 + v92) / v55
                                                                                                                                                                                                                        if v133 * v133 >= v62 then
                                                                                                                                                                                                                            local v136
                                                                                                                                                                                                                            v134 = (v41 + v32 - v89 + v92) / v55
                                                                                                                                                                                                                            if v134 * v134 >= v62 then
                                                                                                                                                                                                                                local v137
                                                                                                                                                                                                                                v135 = (v41 - v32 + v89 - v92) / v55
                                                                                                                                                                                                                                if v135 * v135 >= v62 then
                                                                                                                                                                                                                                    local v138
                                                                                                                                                                                                                                    v136 = (v41 + v32 + v89 - v92) / v55
                                                                                                                                                                                                                                    if v136 * v136 >= v62 then
                                                                                                                                                                                                                                        local v139
                                                                                                                                                                                                                                        v137 = (v41 - v32 - v89 - v92) / v55
                                                                                                                                                                                                                                        if v137 * v137 >= v62 then
                                                                                                                                                                                                                                            local v140
                                                                                                                                                                                                                                            v138 = (v41 + v32 - v89 - v92) / v55
                                                                                                                                                                                                                                            if v138 * v138 >= v62 then
                                                                                                                                                                                                                                                local v141
                                                                                                                                                                                                                                                v139 = (v42 - v33 + v90 + v84) / v59
                                                                                                                                                                                                                                                if v139 * v139 >= v63 then
                                                                                                                                                                                                                                                    local v142
                                                                                                                                                                                                                                                    v140 = (v42 + v33 + v90 + v84) / v59
                                                                                                                                                                                                                                                    if v140 * v140 >= v63 then
                                                                                                                                                                                                                                                        local v143
                                                                                                                                                                                                                                                        v141 = (v42 - v33 - v90 + v84) / v59
                                                                                                                                                                                                                                                        if v141 * v141 >= v63 then
                                                                                                                                                                                                                                                            local v144
                                                                                                                                                                                                                                                            v142 = (v42 + v33 - v90 + v84) / v59
                                                                                                                                                                                                                                                            if v142 * v142 >= v63 then
                                                                                                                                                                                                                                                                local v145
                                                                                                                                                                                                                                                                v143 = (v42 - v33 + v90 - v84) / v59
                                                                                                                                                                                                                                                                if v143 * v143 >= v63 then
                                                                                                                                                                                                                                                                    local v146
                                                                                                                                                                                                                                                                    v144 = (v42 + v33 + v90 - v84) / v59
                                                                                                                                                                                                                                                                    if v144 * v144 >= v63 then
                                                                                                                                                                                                                                                                        local v147
                                                                                                                                                                                                                                                                        v145 = (v42 - v33 - v90 - v84) / v59
                                                                                                                                                                                                                                                                        if v145 * v145 >= v63 then
                                                                                                                                                                                                                                                                            local v148
                                                                                                                                                                                                                                                                            v146 = (v42 + v33 - v90 - v84) / v59
                                                                                                                                                                                                                                                                            if v146 * v146 >= v63 then
                                                                                                                                                                                                                                                                                local v149
                                                                                                                                                                                                                                                                                v147 = (v40 - v31 + v91 + v86) / v50
                                                                                                                                                                                                                                                                                if v147 * v147 >= v63 then
                                                                                                                                                                                                                                                                                    local v150
                                                                                                                                                                                                                                                                                    v148 = (v40 + v31 + v91 + v86) / v50
                                                                                                                                                                                                                                                                                    if v148 * v148 >= v63 then
                                                                                                                                                                                                                                                                                        local v151
                                                                                                                                                                                                                                                                                        v149 = (v40 - v31 - v91 + v86) / v50
                                                                                                                                                                                                                                                                                        if v149 * v149 >= v63 then
                                                                                                                                                                                                                                                                                            local v152
                                                                                                                                                                                                                                                                                            v150 = (v40 + v31 - v91 + v86) / v50
                                                                                                                                                                                                                                                                                            if v150 * v150 >= v63 then
                                                                                                                                                                                                                                                                                                local v153
                                                                                                                                                                                                                                                                                                v151 = (v40 - v31 + v91 - v86) / v50
                                                                                                                                                                                                                                                                                                if v151 * v151 >= v63 then
                                                                                                                                                                                                                                                                                                    local v154
                                                                                                                                                                                                                                                                                                    v152 = (v40 + v31 + v91 - v86) / v50
                                                                                                                                                                                                                                                                                                    if v152 * v152 >= v63 then
                                                                                                                                                                                                                                                                                                        local v155
                                                                                                                                                                                                                                                                                                        v153 = (v40 - v31 - v91 - v86) / v50
                                                                                                                                                                                                                                                                                                        if v153 * v153 >= v63 then
                                                                                                                                                                                                                                                                                                            local v156
                                                                                                                                                                                                                                                                                                            v154 = (v40 + v31 - v91 - v86) / v50
                                                                                                                                                                                                                                                                                                            if v154 * v154 >= v63 then
                                                                                                                                                                                                                                                                                                                local v157
                                                                                                                                                                                                                                                                                                                v155 = (v41 - v32 + v92 + v88) / v56
                                                                                                                                                                                                                                                                                                                if v155 * v155 >= v63 then
                                                                                                                                                                                                                                                                                                                    local v158
                                                                                                                                                                                                                                                                                                                    v156 = (v41 + v32 + v92 + v88) / v56
                                                                                                                                                                                                                                                                                                                    if v156 * v156 >= v63 then
                                                                                                                                                                                                                                                                                                                        local v159
                                                                                                                                                                                                                                                                                                                        v157 = (v41 - v32 - v92 + v88) / v56
                                                                                                                                                                                                                                                                                                                        if v157 * v157 >= v63 then
                                                                                                                                                                                                                                                                                                                            local v160
                                                                                                                                                                                                                                                                                                                            v158 = (v41 + v32 - v92 + v88) / v56
                                                                                                                                                                                                                                                                                                                            if v158 * v158 >= v63 then
                                                                                                                                                                                                                                                                                                                                local v161
                                                                                                                                                                                                                                                                                                                                v159 = (v41 - v32 + v92 - v88) / v56
                                                                                                                                                                                                                                                                                                                                if v159 * v159 >= v63 then
                                                                                                                                                                                                                                                                                                                                    local v162
                                                                                                                                                                                                                                                                                                                                    v160 = (v41 + v32 + v92 - v88) / v56
                                                                                                                                                                                                                                                                                                                                    if v160 * v160 >= v63 then
                                                                                                                                                                                                                                                                                                                                        local v163, v164
                                                                                                                                                                                                                                                                                                                                        v161 = (v41 - v32 - v92 - v88) / v56
                                                                                                                                                                                                                                                                                                                                        if v161 * v161 >= v63 then
                                                                                                                                                                                                                                                                                                                                            v162 = (v41 + v32 - v92 - v88) / v56
                                                                                                                                                                                                                                                                                                                                            if v162 * v162 < v63 then
                                                                                                                                                                                                                                                                                                                                                v164 = v42 - v90 - v84
                                                                                                                                                                                                                                                                                                                                                v163 = v164 - v162 * v59
                                                                                                                                                                                                                                                                                                                                                if v163 * v163 >= v83 then
                                                                                                                                                                                                                                                                                                                                                    return false
                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                v164 = v40 - v91 - v86 - v162 * v50
                                                                                                                                                                                                                                                                                                                                                if v164 * v164 < v79 then
                                                                                                                                                                                                                                                                                                                                                    return true
                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                return false
                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                            return false
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                        v163 = v42 - v90 - v84
                                                                                                                                                                                                                                                                                                                                        v162 = v163 - v161 * v59
                                                                                                                                                                                                                                                                                                                                        if v162 * v162 >= v83 then
                                                                                                                                                                                                                                                                                                                                            v162 = (v41 + v32 - v92 - v88) / v56
                                                                                                                                                                                                                                                                                                                                            if v162 * v162 < v63 then
                                                                                                                                                                                                                                                                                                                                                v164 = v42 - v90 - v84
                                                                                                                                                                                                                                                                                                                                                v163 = v164 - v162 * v59
                                                                                                                                                                                                                                                                                                                                                if v163 * v163 >= v83 then
                                                                                                                                                                                                                                                                                                                                                    return false
                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                v164 = v40 - v91 - v86 - v162 * v50
                                                                                                                                                                                                                                                                                                                                                if v164 * v164 < v79 then
                                                                                                                                                                                                                                                                                                                                                    return true
                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                return false
                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                            return false
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                        v164 = v40 - v91 - v86
                                                                                                                                                                                                                                                                                                                                        v163 = v164 - v161 * v50
                                                                                                                                                                                                                                                                                                                                        if v163 * v163 < v79 then
                                                                                                                                                                                                                                                                                                                                            return true
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                        v162 = (v41 + v32 - v92 - v88) / v56
                                                                                                                                                                                                                                                                                                                                        if v162 * v162 >= v63 then
                                                                                                                                                                                                                                                                                                                                            return false
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                        v164 = v42 - v90 - v84
                                                                                                                                                                                                                                                                                                                                        v163 = v164 - v162 * v59
                                                                                                                                                                                                                                                                                                                                        if v163 * v163 >= v83 then
                                                                                                                                                                                                                                                                                                                                            return false
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                        v164 = v40 - v91 - v86 - v162 * v50
                                                                                                                                                                                                                                                                                                                                        if v164 * v164 < v79 then
                                                                                                                                                                                                                                                                                                                                            return true
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                        return false
                                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                                        v162 = v42 + v90 - v84
                                                                                                                                                                                                                                                                                                                                        v161 = v162 - v160 * v59
                                                                                                                                                                                                                                                                                                                                        if v161 * v161 < v83 then
                                                                                                                                                                                                                                                                                                                                            v162 = v40 + v91 - v86 - v160 * v50
                                                                                                                                                                                                                                                                                                                                            if v162 * v162 < v79 then
                                                                                                                                                                                                                                                                                                                                                return true
                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                                    v161 = v42 + v90 - v84
                                                                                                                                                                                                                                                                                                                                    v160 = v161 - v159 * v59
                                                                                                                                                                                                                                                                                                                                    if v160 * v160 < v83 then
                                                                                                                                                                                                                                                                                                                                        v161 = v40 + v91 - v86 - v159 * v50
                                                                                                                                                                                                                                                                                                                                        if v161 * v161 < v79 then
                                                                                                                                                                                                                                                                                                                                            return true
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                                v160 = v42 - v90 + v84
                                                                                                                                                                                                                                                                                                                                v159 = v160 - v158 * v59
                                                                                                                                                                                                                                                                                                                                if v159 * v159 < v83 then
                                                                                                                                                                                                                                                                                                                                    v160 = v40 - v91 + v86 - v158 * v50
                                                                                                                                                                                                                                                                                                                                    if v160 * v160 < v79 then
                                                                                                                                                                                                                                                                                                                                        return true
                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                                            v159 = v42 - v90 + v84
                                                                                                                                                                                                                                                                                                                            v158 = v159 - v157 * v59
                                                                                                                                                                                                                                                                                                                            if v158 * v158 < v83 then
                                                                                                                                                                                                                                                                                                                                v159 = v40 - v91 + v86 - v157 * v50
                                                                                                                                                                                                                                                                                                                                if v159 * v159 < v79 then
                                                                                                                                                                                                                                                                                                                                    return true
                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                                        v158 = v42 + v90 + v84
                                                                                                                                                                                                                                                                                                                        v157 = v158 - v156 * v59
                                                                                                                                                                                                                                                                                                                        if v157 * v157 < v83 then
                                                                                                                                                                                                                                                                                                                            v158 = v40 + v91 + v86 - v156 * v50
                                                                                                                                                                                                                                                                                                                            if v158 * v158 < v79 then
                                                                                                                                                                                                                                                                                                                                return true
                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                                    v157 = v42 + v90 + v84
                                                                                                                                                                                                                                                                                                                    v156 = v157 - v155 * v59
                                                                                                                                                                                                                                                                                                                    if v156 * v156 < v83 then
                                                                                                                                                                                                                                                                                                                        v157 = v40 + v91 + v86 - v155 * v50
                                                                                                                                                                                                                                                                                                                        if v157 * v157 < v79 then
                                                                                                                                                                                                                                                                                                                            return true
                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                                v156 = v41 - v92 - v88
                                                                                                                                                                                                                                                                                                                v155 = v156 - v154 * v56
                                                                                                                                                                                                                                                                                                                if v155 * v155 < v80 then
                                                                                                                                                                                                                                                                                                                    v156 = v42 - v90 - v84 - v154 * v59
                                                                                                                                                                                                                                                                                                                    if v156 * v156 < v83 then
                                                                                                                                                                                                                                                                                                                        return true
                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                                            v155 = v41 - v92 - v88
                                                                                                                                                                                                                                                                                                            v154 = v155 - v153 * v56
                                                                                                                                                                                                                                                                                                            if v154 * v154 < v80 then
                                                                                                                                                                                                                                                                                                                v155 = v42 - v90 - v84 - v153 * v59
                                                                                                                                                                                                                                                                                                                if v155 * v155 < v83 then
                                                                                                                                                                                                                                                                                                                    return true
                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                                        v154 = v41 + v92 - v88
                                                                                                                                                                                                                                                                                                        v153 = v154 - v152 * v56
                                                                                                                                                                                                                                                                                                        if v153 * v153 < v80 then
                                                                                                                                                                                                                                                                                                            v154 = v42 + v90 - v84 - v152 * v59
                                                                                                                                                                                                                                                                                                            if v154 * v154 < v83 then
                                                                                                                                                                                                                                                                                                                return true
                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                                    v153 = v41 + v92 - v88
                                                                                                                                                                                                                                                                                                    v152 = v153 - v151 * v56
                                                                                                                                                                                                                                                                                                    if v152 * v152 < v80 then
                                                                                                                                                                                                                                                                                                        v153 = v42 + v90 - v84 - v151 * v59
                                                                                                                                                                                                                                                                                                        if v153 * v153 < v83 then
                                                                                                                                                                                                                                                                                                            return true
                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                                v152 = v41 - v92 + v88
                                                                                                                                                                                                                                                                                                v151 = v152 - v150 * v56
                                                                                                                                                                                                                                                                                                if v151 * v151 < v80 then
                                                                                                                                                                                                                                                                                                    v152 = v42 - v90 + v84 - v150 * v59
                                                                                                                                                                                                                                                                                                    if v152 * v152 < v83 then
                                                                                                                                                                                                                                                                                                        return true
                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                                            v151 = v41 - v92 + v88
                                                                                                                                                                                                                                                                                            v150 = v151 - v149 * v56
                                                                                                                                                                                                                                                                                            if v150 * v150 < v80 then
                                                                                                                                                                                                                                                                                                v151 = v42 - v90 + v84 - v149 * v59
                                                                                                                                                                                                                                                                                                if v151 * v151 < v83 then
                                                                                                                                                                                                                                                                                                    return true
                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                                        v150 = v41 + v92 + v88
                                                                                                                                                                                                                                                                                        v149 = v150 - v148 * v56
                                                                                                                                                                                                                                                                                        if v149 * v149 < v80 then
                                                                                                                                                                                                                                                                                            v150 = v42 + v90 + v84 - v148 * v59
                                                                                                                                                                                                                                                                                            if v150 * v150 < v83 then
                                                                                                                                                                                                                                                                                                return true
                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                                    v149 = v41 + v92 + v88
                                                                                                                                                                                                                                                                                    v148 = v149 - v147 * v56
                                                                                                                                                                                                                                                                                    if v148 * v148 < v80 then
                                                                                                                                                                                                                                                                                        v149 = v42 + v90 + v84 - v147 * v59
                                                                                                                                                                                                                                                                                        if v149 * v149 < v83 then
                                                                                                                                                                                                                                                                                            return true
                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                                v148 = v40 - v91 - v86
                                                                                                                                                                                                                                                                                v147 = v148 - v146 * v50
                                                                                                                                                                                                                                                                                if v147 * v147 < v79 then
                                                                                                                                                                                                                                                                                    v148 = v41 - v92 - v88 - v146 * v56
                                                                                                                                                                                                                                                                                    if v148 * v148 < v80 then
                                                                                                                                                                                                                                                                                        return true
                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                                            v147 = v40 - v91 - v86
                                                                                                                                                                                                                                                                            v146 = v147 - v145 * v50
                                                                                                                                                                                                                                                                            if v146 * v146 < v79 then
                                                                                                                                                                                                                                                                                v147 = v41 - v92 - v88 - v145 * v56
                                                                                                                                                                                                                                                                                if v147 * v147 < v80 then
                                                                                                                                                                                                                                                                                    return true
                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                                        v146 = v40 + v91 - v86
                                                                                                                                                                                                                                                                        v145 = v146 - v144 * v50
                                                                                                                                                                                                                                                                        if v145 * v145 < v79 then
                                                                                                                                                                                                                                                                            v146 = v41 + v92 - v88 - v144 * v56
                                                                                                                                                                                                                                                                            if v146 * v146 < v80 then
                                                                                                                                                                                                                                                                                return true
                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                                    v145 = v40 + v91 - v86
                                                                                                                                                                                                                                                                    v144 = v145 - v143 * v50
                                                                                                                                                                                                                                                                    if v144 * v144 < v79 then
                                                                                                                                                                                                                                                                        v145 = v41 + v92 - v88 - v143 * v56
                                                                                                                                                                                                                                                                        if v145 * v145 < v80 then
                                                                                                                                                                                                                                                                            return true
                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                                v144 = v40 - v91 + v86
                                                                                                                                                                                                                                                                v143 = v144 - v142 * v50
                                                                                                                                                                                                                                                                if v143 * v143 < v79 then
                                                                                                                                                                                                                                                                    v144 = v41 - v92 + v88 - v142 * v56
                                                                                                                                                                                                                                                                    if v144 * v144 < v80 then
                                                                                                                                                                                                                                                                        return true
                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                                            v143 = v40 - v91 + v86
                                                                                                                                                                                                                                                            v142 = v143 - v141 * v50
                                                                                                                                                                                                                                                            if v142 * v142 < v79 then
                                                                                                                                                                                                                                                                v143 = v41 - v92 + v88 - v141 * v56
                                                                                                                                                                                                                                                                if v143 * v143 < v80 then
                                                                                                                                                                                                                                                                    return true
                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                                        v142 = v40 + v91 + v86
                                                                                                                                                                                                                                                        v141 = v142 - v140 * v50
                                                                                                                                                                                                                                                        if v141 * v141 < v79 then
                                                                                                                                                                                                                                                            v142 = v41 + v92 + v88 - v140 * v56
                                                                                                                                                                                                                                                            if v142 * v142 < v80 then
                                                                                                                                                                                                                                                                return true
                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                                    v141 = v40 + v91 + v86
                                                                                                                                                                                                                                                    v140 = v141 - v139 * v50
                                                                                                                                                                                                                                                    if v140 * v140 < v79 then
                                                                                                                                                                                                                                                        v141 = v41 + v92 + v88 - v139 * v56
                                                                                                                                                                                                                                                        if v141 * v141 < v80 then
                                                                                                                                                                                                                                                            return true
                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                                v140 = v42 - v85 - v90
                                                                                                                                                                                                                                                v139 = v140 - v138 * v58
                                                                                                                                                                                                                                                if v139 * v139 < v83 then
                                                                                                                                                                                                                                                    v140 = v40 - v87 - v91 - v138 * v53
                                                                                                                                                                                                                                                    if v140 * v140 < v79 then
                                                                                                                                                                                                                                                        return true
                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                        else
                                                                                                                                                                                                                                            v139 = v42 - v85 - v90
                                                                                                                                                                                                                                            v138 = v139 - v137 * v58
                                                                                                                                                                                                                                            if v138 * v138 < v83 then
                                                                                                                                                                                                                                                v139 = v40 - v87 - v91 - v137 * v53
                                                                                                                                                                                                                                                if v139 * v139 < v79 then
                                                                                                                                                                                                                                                    return true
                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                    else
                                                                                                                                                                                                                                        v138 = v42 + v85 - v90
                                                                                                                                                                                                                                        v137 = v138 - v136 * v58
                                                                                                                                                                                                                                        if v137 * v137 < v83 then
                                                                                                                                                                                                                                            v138 = v40 + v87 - v91 - v136 * v53
                                                                                                                                                                                                                                            if v138 * v138 < v79 then
                                                                                                                                                                                                                                                return true
                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                else
                                                                                                                                                                                                                                    v137 = v42 + v85 - v90
                                                                                                                                                                                                                                    v136 = v137 - v135 * v58
                                                                                                                                                                                                                                    if v136 * v136 < v83 then
                                                                                                                                                                                                                                        v137 = v40 + v87 - v91 - v135 * v53
                                                                                                                                                                                                                                        if v137 * v137 < v79 then
                                                                                                                                                                                                                                            return true
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                end
                                                                                                                                                                                                                            else
                                                                                                                                                                                                                                v136 = v42 - v85 + v90
                                                                                                                                                                                                                                v135 = v136 - v134 * v58
                                                                                                                                                                                                                                if v135 * v135 < v83 then
                                                                                                                                                                                                                                    v136 = v40 - v87 + v91 - v134 * v53
                                                                                                                                                                                                                                    if v136 * v136 < v79 then
                                                                                                                                                                                                                                        return true
                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                end
                                                                                                                                                                                                                            end
                                                                                                                                                                                                                        else
                                                                                                                                                                                                                            v135 = v42 - v85 + v90
                                                                                                                                                                                                                            v134 = v135 - v133 * v58
                                                                                                                                                                                                                            if v134 * v134 < v83 then
                                                                                                                                                                                                                                v135 = v40 - v87 + v91 - v133 * v53
                                                                                                                                                                                                                                if v135 * v135 < v79 then
                                                                                                                                                                                                                                    return true
                                                                                                                                                                                                                                end
                                                                                                                                                                                                                            end
                                                                                                                                                                                                                        end
                                                                                                                                                                                                                    else
                                                                                                                                                                                                                        v134 = v42 + v85 + v90
                                                                                                                                                                                                                        v133 = v134 - v132 * v58
                                                                                                                                                                                                                        if v133 * v133 < v83 then
                                                                                                                                                                                                                            v134 = v40 + v87 + v91 - v132 * v53
                                                                                                                                                                                                                            if v134 * v134 < v79 then
                                                                                                                                                                                                                                return true
                                                                                                                                                                                                                            end
                                                                                                                                                                                                                        end
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                else
                                                                                                                                                                                                                    v133 = v42 + v85 + v90
                                                                                                                                                                                                                    v132 = v133 - v131 * v58
                                                                                                                                                                                                                    if v132 * v132 < v83 then
                                                                                                                                                                                                                        v133 = v40 + v87 + v91 - v131 * v53
                                                                                                                                                                                                                        if v133 * v133 < v79 then
                                                                                                                                                                                                                            return true
                                                                                                                                                                                                                        end
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                end
                                                                                                                                                                                                            else
                                                                                                                                                                                                                v132 = v41 - v89 - v92
                                                                                                                                                                                                                v131 = v132 - v130 * v55
                                                                                                                                                                                                                if v131 * v131 < v80 then
                                                                                                                                                                                                                    v132 = v42 - v85 - v90 - v130 * v58
                                                                                                                                                                                                                    if v132 * v132 < v83 then
                                                                                                                                                                                                                        return true
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                end
                                                                                                                                                                                                            end
                                                                                                                                                                                                        else
                                                                                                                                                                                                            v131 = v41 - v89 - v92
                                                                                                                                                                                                            v130 = v131 - v129 * v55
                                                                                                                                                                                                            if v130 * v130 < v80 then
                                                                                                                                                                                                                v131 = v42 - v85 - v90 - v129 * v58
                                                                                                                                                                                                                if v131 * v131 < v83 then
                                                                                                                                                                                                                    return true
                                                                                                                                                                                                                end
                                                                                                                                                                                                            end
                                                                                                                                                                                                        end
                                                                                                                                                                                                    else
                                                                                                                                                                                                        v130 = v41 + v89 - v92
                                                                                                                                                                                                        v129 = v130 - v128 * v55
                                                                                                                                                                                                        if v129 * v129 < v80 then
                                                                                                                                                                                                            v130 = v42 + v85 - v90 - v128 * v58
                                                                                                                                                                                                            if v130 * v130 < v83 then
                                                                                                                                                                                                                return true
                                                                                                                                                                                                            end
                                                                                                                                                                                                        end
                                                                                                                                                                                                    end
                                                                                                                                                                                                else
                                                                                                                                                                                                    v129 = v41 + v89 - v92
                                                                                                                                                                                                    v128 = v129 - v127 * v55
                                                                                                                                                                                                    if v128 * v128 < v80 then
                                                                                                                                                                                                        v129 = v42 + v85 - v90 - v127 * v58
                                                                                                                                                                                                        if v129 * v129 < v83 then
                                                                                                                                                                                                            return true
                                                                                                                                                                                                        end
                                                                                                                                                                                                    end
                                                                                                                                                                                                end
                                                                                                                                                                                            else
                                                                                                                                                                                                v128 = v41 - v89 + v92
                                                                                                                                                                                                v127 = v128 - v126 * v55
                                                                                                                                                                                                if v127 * v127 < v80 then
                                                                                                                                                                                                    v128 = v42 - v85 + v90 - v126 * v58
                                                                                                                                                                                                    if v128 * v128 < v83 then
                                                                                                                                                                                                        return true
                                                                                                                                                                                                    end
                                                                                                                                                                                                end
                                                                                                                                                                                            end
                                                                                                                                                                                        else
                                                                                                                                                                                            v127 = v41 - v89 + v92
                                                                                                                                                                                            v126 = v127 - v125 * v55
                                                                                                                                                                                            if v126 * v126 < v80 then
                                                                                                                                                                                                v127 = v42 - v85 + v90 - v125 * v58
                                                                                                                                                                                                if v127 * v127 < v83 then
                                                                                                                                                                                                    return true
                                                                                                                                                                                                end
                                                                                                                                                                                            end
                                                                                                                                                                                        end
                                                                                                                                                                                    else
                                                                                                                                                                                        v126 = v41 + v89 + v92
                                                                                                                                                                                        v125 = v126 - v124 * v55
                                                                                                                                                                                        if v125 * v125 < v80 then
                                                                                                                                                                                            v126 = v42 + v85 + v90 - v124 * v58
                                                                                                                                                                                            if v126 * v126 < v83 then
                                                                                                                                                                                                return true
                                                                                                                                                                                            end
                                                                                                                                                                                        end
                                                                                                                                                                                    end
                                                                                                                                                                                else
                                                                                                                                                                                    v125 = v41 + v89 + v92
                                                                                                                                                                                    v124 = v125 - v123 * v55
                                                                                                                                                                                    if v124 * v124 < v80 then
                                                                                                                                                                                        v125 = v42 + v85 + v90 - v123 * v58
                                                                                                                                                                                        if v125 * v125 < v83 then
                                                                                                                                                                                            return true
                                                                                                                                                                                        end
                                                                                                                                                                                    end
                                                                                                                                                                                end
                                                                                                                                                                            else
                                                                                                                                                                                v124 = v40 - v87 - v91
                                                                                                                                                                                v123 = v124 - v122 * v53
                                                                                                                                                                                if v123 * v123 < v79 then
                                                                                                                                                                                    v124 = v41 - v89 - v92 - v122 * v55
                                                                                                                                                                                    if v124 * v124 < v80 then
                                                                                                                                                                                        return true
                                                                                                                                                                                    end
                                                                                                                                                                                end
                                                                                                                                                                            end
                                                                                                                                                                        else
                                                                                                                                                                            v123 = v40 - v87 - v91
                                                                                                                                                                            v122 = v123 - v121 * v53
                                                                                                                                                                            if v122 * v122 < v79 then
                                                                                                                                                                                v123 = v41 - v89 - v92 - v121 * v55
                                                                                                                                                                                if v123 * v123 < v80 then
                                                                                                                                                                                    return true
                                                                                                                                                                                end
                                                                                                                                                                            end
                                                                                                                                                                        end
                                                                                                                                                                    else
                                                                                                                                                                        v122 = v40 + v87 - v91
                                                                                                                                                                        v121 = v122 - v120 * v53
                                                                                                                                                                        if v121 * v121 < v79 then
                                                                                                                                                                            v122 = v41 + v89 - v92 - v120 * v55
                                                                                                                                                                            if v122 * v122 < v80 then
                                                                                                                                                                                return true
                                                                                                                                                                            end
                                                                                                                                                                        end
                                                                                                                                                                    end
                                                                                                                                                                else
                                                                                                                                                                    v121 = v40 + v87 - v91
                                                                                                                                                                    v120 = v121 - v119 * v53
                                                                                                                                                                    if v120 * v120 < v79 then
                                                                                                                                                                        v121 = v41 + v89 - v92 - v119 * v55
                                                                                                                                                                        if v121 * v121 < v80 then
                                                                                                                                                                            return true
                                                                                                                                                                        end
                                                                                                                                                                    end
                                                                                                                                                                end
                                                                                                                                                            else
                                                                                                                                                                v120 = v40 - v87 + v91
                                                                                                                                                                v119 = v120 - v118 * v53
                                                                                                                                                                if v119 * v119 < v79 then
                                                                                                                                                                    v120 = v41 - v89 + v92 - v118 * v55
                                                                                                                                                                    if v120 * v120 < v80 then
                                                                                                                                                                        return true
                                                                                                                                                                    end
                                                                                                                                                                end
                                                                                                                                                            end
                                                                                                                                                        else
                                                                                                                                                            v119 = v40 - v87 + v91
                                                                                                                                                            v118 = v119 - v117 * v53
                                                                                                                                                            if v118 * v118 < v79 then
                                                                                                                                                                v119 = v41 - v89 + v92 - v117 * v55
                                                                                                                                                                if v119 * v119 < v80 then
                                                                                                                                                                    return true
                                                                                                                                                                end
                                                                                                                                                            end
                                                                                                                                                        end
                                                                                                                                                    else
                                                                                                                                                        v118 = v40 + v87 + v91
                                                                                                                                                        v117 = v118 - v116 * v53
                                                                                                                                                        if v117 * v117 < v79 then
                                                                                                                                                            v118 = v41 + v89 + v92 - v116 * v55
                                                                                                                                                            if v118 * v118 < v80 then
                                                                                                                                                                return true
                                                                                                                                                            end
                                                                                                                                                        end
                                                                                                                                                    end
                                                                                                                                                else
                                                                                                                                                    v117 = v40 + v87 + v91
                                                                                                                                                    v116 = v117 - v115 * v53
                                                                                                                                                    if v116 * v116 < v79 then
                                                                                                                                                        v117 = v41 + v89 + v92 - v115 * v55
                                                                                                                                                        if v117 * v117 < v80 then
                                                                                                                                                            return true
                                                                                                                                                        end
                                                                                                                                                    end
                                                                                                                                                end
                                                                                                                                            else
                                                                                                                                                v116 = v42 - v84 - v85
                                                                                                                                                v115 = v116 - v114 * v60
                                                                                                                                                if v115 * v115 < v83 then
                                                                                                                                                    v116 = v40 - v86 - v87 - v114 * v54
                                                                                                                                                    if v116 * v116 < v79 then
                                                                                                                                                        return true
                                                                                                                                                    end
                                                                                                                                                end
                                                                                                                                            end
                                                                                                                                        else
                                                                                                                                            v115 = v42 - v84 - v85
                                                                                                                                            v114 = v115 - v113 * v60
                                                                                                                                            if v114 * v114 < v83 then
                                                                                                                                                v115 = v40 - v86 - v87 - v113 * v54
                                                                                                                                                if v115 * v115 < v79 then
                                                                                                                                                    return true
                                                                                                                                                end
                                                                                                                                            end
                                                                                                                                        end
                                                                                                                                    else
                                                                                                                                        v114 = v42 + v84 - v85
                                                                                                                                        v113 = v114 - v112 * v60
                                                                                                                                        if v113 * v113 < v83 then
                                                                                                                                            v114 = v40 + v86 - v87 - v112 * v54
                                                                                                                                            if v114 * v114 < v79 then
                                                                                                                                                return true
                                                                                                                                            end
                                                                                                                                        end
                                                                                                                                    end
                                                                                                                                else
                                                                                                                                    v113 = v42 + v84 - v85
                                                                                                                                    v112 = v113 - v111 * v60
                                                                                                                                    if v112 * v112 < v83 then
                                                                                                                                        v113 = v40 + v86 - v87 - v111 * v54
                                                                                                                                        if v113 * v113 < v79 then
                                                                                                                                            return true
                                                                                                                                        end
                                                                                                                                    end
                                                                                                                                end
                                                                                                                            else
                                                                                                                                v112 = v42 - v84 + v85
                                                                                                                                v111 = v112 - v110 * v60
                                                                                                                                if v111 * v111 < v83 then
                                                                                                                                    v112 = v40 - v86 + v87 - v110 * v54
                                                                                                                                    if v112 * v112 < v79 then
                                                                                                                                        return true
                                                                                                                                    end
                                                                                                                                end
                                                                                                                            end
                                                                                                                        else
                                                                                                                            v111 = v42 - v84 + v85
                                                                                                                            v110 = v111 - v109 * v60
                                                                                                                            if v110 * v110 < v83 then
                                                                                                                                v111 = v40 - v86 + v87 - v109 * v54
                                                                                                                                if v111 * v111 < v79 then
                                                                                                                                    return true
                                                                                                                                end
                                                                                                                            end
                                                                                                                        end
                                                                                                                    else
                                                                                                                        v110 = v42 + v84 + v85
                                                                                                                        v109 = v110 - v108 * v60
                                                                                                                        if v109 * v109 < v83 then
                                                                                                                            v110 = v40 + v86 + v87 - v108 * v54
                                                                                                                            if v110 * v110 < v79 then
                                                                                                                                return true
                                                                                                                            end
                                                                                                                        end
                                                                                                                    end
                                                                                                                else
                                                                                                                    v109 = v42 + v84 + v85
                                                                                                                    v108 = v109 - v107 * v60
                                                                                                                    if v108 * v108 < v83 then
                                                                                                                        v109 = v40 + v86 + v87 - v107 * v54
                                                                                                                        if v109 * v109 < v79 then
                                                                                                                            return true
                                                                                                                        end
                                                                                                                    end
                                                                                                                end
                                                                                                            else
                                                                                                                v108 = v41 - v88 - v89
                                                                                                                v107 = v108 - v106 * v57
                                                                                                                if v107 * v107 < v80 then
                                                                                                                    v108 = v42 - v84 - v85 - v106 * v60
                                                                                                                    if v108 * v108 < v83 then
                                                                                                                        return true
                                                                                                                    end
                                                                                                                end
                                                                                                            end
                                                                                                        else
                                                                                                            v107 = v41 - v88 - v89
                                                                                                            v106 = v107 - v105 * v57
                                                                                                            if v106 * v106 < v80 then
                                                                                                                v107 = v42 - v84 - v85 - v105 * v60
                                                                                                                if v107 * v107 < v83 then
                                                                                                                    return true
                                                                                                                end
                                                                                                            end
                                                                                                        end
                                                                                                    else
                                                                                                        v106 = v41 + v88 - v89
                                                                                                        v105 = v106 - v104 * v57
                                                                                                        if v105 * v105 < v80 then
                                                                                                            v106 = v42 + v84 - v85 - v104 * v60
                                                                                                            if v106 * v106 < v83 then
                                                                                                                return true
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                else
                                                                                                    v105 = v41 + v88 - v89
                                                                                                    v104 = v105 - v103 * v57
                                                                                                    if v104 * v104 < v80 then
                                                                                                        v105 = v42 + v84 - v85 - v103 * v60
                                                                                                        if v105 * v105 < v83 then
                                                                                                            return true
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            else
                                                                                                v104 = v41 - v88 + v89
                                                                                                v103 = v104 - v102 * v57
                                                                                                if v103 * v103 < v80 then
                                                                                                    v104 = v42 - v84 + v85 - v102 * v60
                                                                                                    if v104 * v104 < v83 then
                                                                                                        return true
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        else
                                                                                            v103 = v41 - v88 + v89
                                                                                            v102 = v103 - v101 * v57
                                                                                            if v102 * v102 < v80 then
                                                                                                v103 = v42 - v84 + v85 - v101 * v60
                                                                                                if v103 * v103 < v83 then
                                                                                                    return true
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    else
                                                                                        v102 = v41 + v88 + v89
                                                                                        v101 = v102 - v100 * v57
                                                                                        if v101 * v101 < v80 then
                                                                                            v102 = v42 + v84 + v85 - v100 * v60
                                                                                            if v102 * v102 < v83 then
                                                                                                return true
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                else
                                                                                    v101 = v41 + v88 + v89
                                                                                    v100 = v101 - v99 * v57
                                                                                    if v100 * v100 < v80 then
                                                                                        v101 = v42 + v84 + v85 - v99 * v60
                                                                                        if v101 * v101 < v83 then
                                                                                            return true
                                                                                        end
                                                                                    end
                                                                                end
                                                                            else
                                                                                v100 = v40 - v86 - v87
                                                                                v99 = v100 - v98 * v54
                                                                                if v99 * v99 < v79 then
                                                                                    v100 = v41 - v88 - v89 - v98 * v57
                                                                                    if v100 * v100 < v80 then
                                                                                        return true
                                                                                    end
                                                                                end
                                                                            end
                                                                        else
                                                                            v99 = v40 - v86 - v87
                                                                            v98 = v99 - v97 * v54
                                                                            if v98 * v98 < v79 then
                                                                                v99 = v41 - v88 - v89 - v97 * v57
                                                                                if v99 * v99 < v80 then
                                                                                    return true
                                                                                end
                                                                            end
                                                                        end
                                                                    else
                                                                        v98 = v40 + v86 - v87
                                                                        v97 = v98 - v96 * v54
                                                                        if v97 * v97 < v79 then
                                                                            v98 = v41 + v88 - v89 - v96 * v57
                                                                            if v98 * v98 < v80 then
                                                                                return true
                                                                            end
                                                                        end
                                                                    end
                                                                else
                                                                    v97 = v40 + v86 - v87
                                                                    v96 = v97 - v95 * v54
                                                                    if v96 * v96 < v79 then
                                                                        v97 = v41 + v88 - v89 - v95 * v57
                                                                        if v97 * v97 < v80 then
                                                                            return true
                                                                        end
                                                                    end
                                                                end
                                                            else
                                                                v96 = v40 - v86 + v87
                                                                v95 = v96 - v94 * v54
                                                                if v95 * v95 < v79 then
                                                                    v96 = v41 - v88 + v89 - v94 * v57
                                                                    if v96 * v96 < v80 then
                                                                        return true
                                                                    end
                                                                end
                                                            end
                                                        else
                                                            v95 = v40 - v86 + v87
                                                            v94 = v95 - v82 * v54
                                                            if v94 * v94 < v79 then
                                                                v95 = v41 - v88 + v89 - v82 * v57
                                                                if v95 * v95 < v80 then
                                                                    return true
                                                                end
                                                            end
                                                        end
                                                    else
                                                        v94 = v40 + v86 + v87
                                                        v82 = v94 - v81 * v54
                                                        if v82 * v82 < v79 then
                                                            v94 = v41 + v88 + v89 - v81 * v57
                                                            if v94 * v94 < v80 then
                                                                return true
                                                            end
                                                        end
                                                    end
                                                else
                                                    v82 = v40 + v86 + v87
                                                    v81 = v82 - v93 * v54
                                                    if v81 * v81 < v79 then
                                                        v82 = v41 + v88 + v89 - v93 * v57
                                                        if v82 * v82 < v80 then
                                                            return true
                                                        end
                                                    end
                                                end
                                            else
                                                v79 = -v67 - v68 - v69 - v44
                                                if v79 * v79 < v63 then
                                                    v80 = -v70 - v71 - v72 - v46
                                                    if v80 * v80 < v61 then
                                                        return true
                                                    end
                                                end
                                            end
                                        else
                                            v78 = v67 - v68 - v69 - v44
                                            if v78 * v78 < v63 then
                                                v79 = v70 - v71 - v72 - v46
                                                if v79 * v79 < v61 then
                                                    return true
                                                end
                                            end
                                        end
                                    else
                                        v77 = -v67 + v68 - v69 - v44
                                        if v77 * v77 < v63 then
                                            v78 = -v70 + v71 - v72 - v46
                                            if v78 * v78 < v61 then
                                                return true
                                            end
                                        end
                                    end
                                else
                                    v76 = v67 + v68 - v69 - v44
                                    if v76 * v76 < v63 then
                                        v77 = v70 + v71 - v72 - v46
                                        if v77 * v77 < v61 then
                                            return true
                                        end
                                    end
                                end
                            else
                                v75 = -v67 - v68 + v69 - v44
                                if v75 * v75 < v63 then
                                    v76 = -v70 - v71 + v72 - v46
                                    if v76 * v76 < v61 then
                                        return true
                                    end
                                end
                            end
                        else
                            v74 = v67 - v68 + v69 - v44
                            if v74 * v74 < v63 then
                                v75 = v70 - v71 + v72 - v46
                                if v75 * v75 < v61 then
                                    return true
                                end
                            end
                        end
                    else
                        v52 = -v67 + v68 + v69 - v44
                        if v52 * v52 < v63 then
                            v74 = -v70 + v71 + v72 - v46
                            if v74 * v74 < v61 then
                                return true
                            end
                        end
                    end
                else
                    v51 = v67 + v68 + v69 - v44
                    if v51 * v51 < v63 then
                        v52 = v70 + v71 + v72 - v46
                        if v52 * v52 < v61 then
                            return true
                        end
                    end
                end
            end
        end
    end
end
local u28 = setmetatable
local components_2 = CFrame.new().components
local u32 = Workspace
local u33 = type
local new = Region3.new
local new_2 = Vector3.new
local function Region3BoundingBox(p1, p2) -- Line: 296 -- upvalues: components_2 (val), new (val), new_2 (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16
    v5, v10, v11, v12, v13, v14, v15, v16, v1, v2, v3, v4 = components_2(p1)
    local v17 = p2.x / 2
    local v18 = p2.y / 2
    local v19 = p2.z / 2
    if v12 >= 0 then
        v6 = v12
    else
        v6 = -v12
    end
    if v13 >= 0 then
        v7 = v13
    else
        v7 = -v13
    end
    local v20 = v17 * v6 + v18 * v7
    if v14 >= 0 then
        v6 = v14
    else
        v6 = -v14
    end
    local v21 = v20 + v19 * v6
    if v15 >= 0 then
        v7 = v15
    else
        v7 = -v15
    end
    if v16 >= 0 then
        v8 = v16
    else
        v8 = -v16
    end
    local v22 = v17 * v7 + v18 * v8
    if v1 >= 0 then
        v7 = v1
    else
        v7 = -v1
    end
    v20 = v22 + v19 * v7
    if v2 >= 0 then
        v8 = v2
    else
        v8 = -v2
    end
    if v3 >= 0 then
        v9 = v3
    else
        v9 = -v3
    end
    v6 = v17 * v8 + v18 * v9
    if v4 >= 0 then
        v8 = v4
    else
        v8 = -v4
        if not v8 then
            v8 = v4
        end
    end
    v22 = v6 + v19 * v8
    v7 = new_2(v5 - v21, v10 - v20, v11 - v22)
    return new(v7, (new_2(v5 + v21, v10 + v20, v11 + v22)))
end
local function FindAllPartsInRegion3(p1, p2) -- Line: 316 -- upvalues: u33 (val), u32 (val)
    local v1
    if u33(p2) ~= "table" then
        v1 = {p2}
    else
        v1 = p2
        if not v1 then
            v1 = {p2}
        end
    end
    return u32:FindPartsInRegion3WithIgnoreList(p1, v1, math.huge)
end
local function CastPoint(p1, p2) -- Line: 323 -- upvalues: BoxPointCollision (ref)
    return BoxPointCollision(p1.CFrame, p1.Size, p2)
end
local function CastSphere(p1, p2, p3) -- Line: 329 -- upvalues: BoxSphereCollision (ref)
    return BoxSphereCollision(p1.CFrame, p1.Size, p2, p3)
end
local function CastBox(p1, p2, p3) -- Line: 335 -- upvalues: BoxCollision (ref)
    return BoxCollision(p1.CFrame, p1.Size, p2, p3)
end
local function CastPart(p1, p2) -- Line: 341 -- upvalues: BoxCollision (ref)
    return (BoxCollision(p1.CFrame, p1.Size, p2.CFrame, p2.Size))
end
local function CastParts(p1, p2) -- Line: 348 -- upvalues: CastPart (val)
    local v1, v2
    local v3 = {}
    local v4 = #p2
    local v5 = 1
    v1, v2 = p1, p2
    for i = 1, v4, v5 do
        if CastPart(v1, v2[i]) then
            v3[#v3 + 1] = v2[i]
        end
    end
    return v3
end
local function Cast(p1, p2) -- Line: 360 -- upvalues: FindAllPartsInRegion3 (val), CastPart (val)
    local v1 = {}
    local v2 = FindAllPartsInRegion3(p1.Region3, p2)
    local v3 = #v2
    local v4 = 1
    local v5 = p1
    for i = 1, v3, v4 do
        if CastPart(v5, v2[i]) then
            v1[#v1 + 1] = v2[i]
        end
    end
    return v1
end
local function NewRegion(p1, p2) -- Line: 373 -- upvalues: Region3BoundingBox (val), Cast (val), CastPart (val), CastParts (val), CastPoint (val), CastSphere (val), CastBox (val), u28 (val)
    local u2 = {
        CFrame = p1,
        Size = p2,
        Region3 = Region3BoundingBox(p1, p2),
        Cast = Cast,
        CastPart = CastPart,
        CastParts = CastParts,
        CastPoint = CastPoint,
        CastSphere = CastSphere,
        CastBox = CastBox,
    }
    local v1 = {}
    local v2 = {
        __index = u2,
        __newindex = function(p1, p2, p3) -- Line: 387 -- upvalues: u2 (val), Region3BoundingBox (upval)
            u2[p2] = p3
            u2.Region3 = Region3BoundingBox(u2.CFrame, u2.Size)
        end,
    }
    return (u28(v1, v2))
end
v1.Region3BoundingBox = Region3BoundingBox
v1.FindAllPartsInRegion3 = FindAllPartsInRegion3
v1.BoxPointCollision = BoxPointCollision
v1.BoxSphereCollision = BoxSphereCollision
v1.BoxCollision = BoxCollision
v1.new = NewRegion
function v1.FromPart(p1) -- Line: 402 -- upvalues: NewRegion (val)
    return NewRegion(p1.CFrame, p1.Size)
end
return v1