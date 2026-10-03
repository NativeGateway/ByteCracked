local n25 = 7215
local flag2 = true
local flag3 = true
do
do
do
do
do
do
do
do
do

									do
										local tbl31, balls, touchEnabled

										do
											do
												repeat
													task.wait()
												until game:IsLoaded()

												tbl17 = { Flags = {}, Keybinds = {} }
												ReplicatedStorage = game:GetService("ReplicatedStorage")

												tbl31 = {
													Parry_Remote = nil,
													Parry_Hash = nil,
													Parry_Key = nil,
													Token = nil,
													Time_Encoder = nil,
												}

												do
													local module2 = require(game:GetService("ReplicatedStorage").Controllers["SwordsController \12"]:WaitForChild("PRY"))
													local v92 = debug.getupvalues(module2)
													tbl31.Time_Encoder = v92[4]
													tbl31.Parry_Hash = v92[8]
													tbl31.Parry_Key = v92[3][3]
												end
											end

											do
												if not tbl31.Parry_Remote then
													do
														local v92 = nil

														local function fn33(parryRemote, ...)
															local v93 = table.pack(...)
															local tbl32 = { ... }

															if parryRemote and typeof(parryRemote) == "Instance" and parryRemote:IsA("RemoteEvent") and tbl32[1] == tbl31.Parry_Hash then
																if not tbl31.Parry_Remote then
																	tbl31.Parry_Remote = parryRemote
																end
															end

															return v92(parryRemote, table.unpack(v93, 1, v93.n))
														end

														v92 = hookfunction
														v92 = v92(Instance.new("RemoteEvent").FireServer, fn33)
													end
												end

												tbl18 = {}
												tbl19 = {}
												FinishersController = require(game.ReplicatedStorage.Controllers.FinishersController)
												RunService = game:GetService("RunService")
												instance = Instance.new("VirtualInputManager")
												Players = game:GetService("Players")
												localPlayer = Players.LocalPlayer
												balls = workspace:WaitForChild("Balls")
												UserInputService = game:GetService("UserInputService")
												touchEnabled = UserInputService.TouchEnabled
												replicatedInstances = ReplicatedStorage:WaitForChild("Shared"):WaitForChild("ReplicatedInstances")
												module = require(replicatedInstances:WaitForChild("Swords"))
												local serverStatsItem = game:GetService("Stats").Network.ServerStatsItem
											end

											do
												local attribute = localPlayer:GetAttribute("CurrentlyEquippedSword")
												sword = module:GetSword(attribute)
											end
										end

										do
											do
												function_ = nil
												function_2 = nil

												do
													local net = ReplicatedStorage.Packages._Index["sleitnick_net@0.1.0"].net
													text = localPlayer.PlayerGui.Settings.Frame.Frame["Keybinds/Block"].Keybind1.TextBox.Text or localPlayer.PlayerGui.Settings.Frame.Frame["Keybinds/Block"].Keybind2.TextBox.Text or localPlayer.PlayerGui.Settings.Frame.Frame["Keybinds/Block"].Keybind3.TextBox.Text
													v86 = nil
													v87 = nil

													for _, v92 in net:GetChildren() do
														if v92:IsA("UnreliableRemoteEvent") and v92.Name ~= "URE/ReplicateBallPosition" then
															tbl18["Real Ball Position"] = v92.OnClientEvent:Connect(function(arg, arg2)
																if not arg or not arg.Parent then
																	if arg == v87 then
																		v87 = nil
																		v86 = nil
																	end

																	return
																end

																v87 = arg
																v86 = arg2
															end)
														end
													end
												end
											end

											for _, v92 in getconnections(ReplicatedStorage.Remotes.FireSwordInfo.OnClientEvent) do
												function_2 = v92.Function
												v92:Disable()
												v92:Disconnect()
											end

											for _, v92 in getconnections(ReplicatedStorage.Remotes.ParrySuccessAll.OnClientEvent) do
												if v92 and v92.Function then
													function_ = v92.Function
													v92:Disable()
													v92:Disconnect()
												end
											end

											tbl20 = { storage = { current = nil, Trove = nil } }

											for _, v92 in game:GetService("ReplicatedStorage").Misc.Emotes:GetChildren() do
												if v92:IsA("Animation") and v92:GetAttribute("EmoteName") then
													tbl20.storage[v92:GetAttribute("EmoteName")] = v92
												end
											end

											do
												local tbl32 = {}

												for k in tbl20.storage, nil, nil do
													table.insert(tbl32, k)
												end

												table.sort(tbl32)
											end
										end

										do
											if isfile("Aries/fav_emotes.json") then
												local json = readfile("Aries/fav_emotes.json")
												data = game:GetService("HttpService"):JSONDecode(json)
											elseif true then
												data = {}
											else
												while true do
												end
											end

											fn28 = function()
												writefile("Aries/fav_emotes.json", game:GetService("HttpService"):JSONEncode(data))
											end

											if isfile("Aries/wheel_slots.json") then
												data2 = game:GetService("HttpService"):JSONDecode(readfile("Aries/wheel_slots.json"))
											else
												data2 = {}
											end

											fn29 = function()
												writefile("Aries/wheel_slots.json", game:GetService("HttpService"):JSONEncode(data2))
											end

											tbl19.Generate_Token = function()
												local v92 = tbl31.Time_Encoder(tbl31.Parry_Key, "TIME")
												local n41 = #v92
												local v93 = 100
												local str10 = tostring(math.floor(workspace:GetServerTimeNow() * v93))
												local n42 = #str10
												local v94 = table.create(n42)

												for i = 1, n42 do
													local v95 = str10:byte(i)
													local v96 = v92:byte((i - 1) % n41 + 1)
													v94[i] = string.char(bit32.bxor(v95 + i, v96))
												end

												return table.concat(v94)
											end

											tbl19.Client_Ball = function()
												for _, v92 in workspace.Balls:GetChildren() do
													if not v92:GetAttribute("realBall") then
														return v92
													end
												end
											end

											tbl19.Get_Ball = function()
												for _, v92 in balls:GetChildren() do
													if v92:GetAttribute("realBall") then
														return v92
													end
												end
											end

											tbl19.Get_Balls = function()
												local tbl32 = {}

												for _, v92 in balls:GetChildren() do
													if v92:GetAttribute("realBall") then
														table.insert(tbl32, v92)
													end
												end

												return tbl32
											end

											tbl19.Get_Crosshair_Target = function()
												local currentCamera = workspace.CurrentCamera
												local alive = workspace.Alive
												if not alive then
													return false
												end
												local viewportSize = currentCamera.ViewportSize
												local vector2 = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
												local huge = math.huge
												local tbl32 = nil

												for _, v92 in alive:GetChildren() do
													if v92 ~= localPlayer.Character and v92.PrimaryPart then
														local v93, v94 = currentCamera:WorldToScreenPoint(v92.PrimaryPart.Position)

														if v94 then
															local magnitude = (Vector2.new(v93.X, v93.Y) - vector2).Magnitude

															if magnitude < huge then
																tbl32 = { Character = v92, Screen_Data = { v93.X, v93.Y } }
																huge = magnitude
															end
														end
													end
												end

												return tbl32
											end

											do
												local v92 = nil

												tbl19.Closest_Aim = function()
													local alive = workspace.Alive
													if localPlayer.Character.Parent ~= alive then
														return false
													end
													local n41 = -math.huge
													local currentCamera = workspace.CurrentCamera
													local v93 = nil

													for _, v94 in alive:GetChildren() do
														if v94 ~= localPlayer.Character and v94.PrimaryPart then
															v94:FindFirstChildOfClass("Humanoid")
															local v95 = currentCamera.CFrame.LookVector:Dot((v94.PrimaryPart.Position - currentCamera.CFrame.Position).Unit)
															local v96, v97 = currentCamera:WorldToViewportPoint(v94.PrimaryPart.Position)

															if v97 and v95 > n41 then
																n41 = v95
																v93 = v94
															end
														end
													end

													v92 = v93
													return v92
												end
											end
										end

										tbl19.Force_Target = function()
											local currentCamera = workspace.CurrentCamera
											local alive = workspace.Alive
											if not alive then
												return false
											end
											local huge = math.huge
											local tbl32 = nil

											for _, v92 in alive:GetChildren() do
												if v92 ~= localPlayer.Character and v92.PrimaryPart then
													local v93, v94 = currentCamera:WorldToScreenPoint(v92.PrimaryPart.Position)

													if v94 then
														local magnitude = (localPlayer.Character.PrimaryPart.Position - v92.PrimaryPart.Position).Magnitude

														if magnitude < huge then
															tbl32 = { Character = v92, Screen_Data = { v93.X, v93.Y } }
															huge = magnitude
														end
													end
												end
											end

											if not tbl32 then
												return false
											end
											return tbl32
										end

										tbl19.FFA = function()
											local currentCamera = workspace.CurrentCamera
											local alive = workspace.Alive
											if not alive then
												return false
											end
											local v92 = tbl19.Get_Ball()
											if not v92 then
												Last_FFA_Target = nil
												return false
											end

											if not v92:FindFirstChild("zoomies") then
												return false
											end
											local attribute = v92:GetAttribute("target")

											if attribute ~= Last_FFA_Target then
												Last_FFA_Target = nil
											end

											local tbl32 = {}

											for _, v93 in alive:GetChildren() do
												if v93 ~= localPlayer.Character and v93.PrimaryPart then
													local v94, v95 = currentCamera:WorldToScreenPoint(v93.PrimaryPart.Position)

													if v95 and v93.Name ~= attribute and v93 ~= Last_FFA_Target then
														table.insert(tbl32, { Character = v93, Screen_Data = { v94.X, v94.Y } })
													end
												end
											end

											if #tbl32 < 1 then
												return false
											end
											local v93 = tbl32[math.random(1, #tbl32)]
											Last_FFA_Target = v93.Character.Name
											return v93
										end

										tbl19.select_target_by_mouse = function()
											local tbl32 = {}

											for _, v92 in workspace.Alive:GetChildren() do
												if v92.Name ~= localPlayer.Name and v92.PrimaryPart then
													table.insert(tbl32, v92)
												end
											end

											local currentCamera = workspace.CurrentCamera
											local mouseLocation = UserInputService:GetMouseLocation()
											local direction = currentCamera:ScreenPointToRay(mouseLocation.X, mouseLocation.Y).Direction
											local n41 = -math.huge
											local v92 = nil

											for _, v93 in tbl32, nil, nil do
												local v94 = direction:Dot((v93.PrimaryPart.Position - currentCamera.CFrame.Position).Unit)

												if n41 < v94 then
													n41 = v94
													v92 = v93
												end
											end

											return v92
										end

										tbl19.Parry_Data = function(arg)
											if touchEnabled then
												Vector2_Mouse_Location = {
													workspace.CurrentCamera.ViewportSize.X / 2,
													workspace.CurrentCamera.ViewportSize.Y / 2,
												}
											elseif true then
												local mouseLocation = UserInputService:GetMouseLocation()
												Vector2_Mouse_Location = { mouseLocation.X, mouseLocation.Y }
											else
												while true do
												end
											end

											local tbl32 = {}

											for _, v92 in workspace.Alive:GetChildren() do
												tbl32[v92.Name] = workspace.CurrentCamera:WorldToScreenPoint(v92.HumanoidRootPart.Position)
											end

											if arg == "Camera" then
												local tbl33 = {}
												local cframe = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.CurrentCamera.CFrame.Position + workspace.CurrentCamera.CFrame.LookVector)
												local v92 = Vector2_Mouse_Location
												tbl33[1] = 0
												tbl33[2] = cframe
												tbl33[3] = tbl32
												tbl33[4] = v92
												return tbl33
											end

											if arg == "Random" then
												local tbl33 = {}
												local cframe = CFrame.new(workspace.CurrentCamera.CFrame.Position, Vector3.new(math.random(-3000, 3000), math.random(-3000, 3000), math.random(-3000, 3000)))
												local v92 = Vector2_Mouse_Location
												tbl33[1] = 0
												tbl33[2] = cframe
												tbl33[3] = tbl32
												tbl33[4] = v92
												return tbl33
											end

											if arg == "Backwards" then
												local n41 = -workspace.CurrentCamera.CFrame.LookVector * 10000
												local tbl33 = {}
												local cframe = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.CurrentCamera.CFrame.Position + Vector3.new(n41.X, 100, n41.Z))
												local v92 = Vector2_Mouse_Location
												tbl33[1] = 0
												tbl33[2] = cframe
												tbl33[3] = tbl32
												tbl33[4] = v92
												return tbl33
											end

											if arg == "High" then
												local tbl33 = {}
												local cframe = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.CurrentCamera.CFrame.Position + Vector3.new(0, 10000, 0))
												local v92 = Vector2_Mouse_Location
												tbl33[1] = 0
												tbl33[2] = cframe
												tbl33[3] = tbl32
												tbl33[4] = v92
												return tbl33
											end

											if arg == "Dot" then
												local v92 = tbl19.Get_Crosshair_Target()

												if v92 then
													local screenData = v92.Screen_Data

													return {
														0,
														CFrame.new(localPlayer.Character.PrimaryPart.Position, v92.Character.PrimaryPart.Position + Vector3.new(0, 1.75, 0)),
														tbl32,
														screenData,
													}
												end

												local tbl33 = {}
												local v93 = 0
												local cframe = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.CurrentCamera.CFrame.Position + workspace.CurrentCamera.CFrame.LookVector)
												local v94 = Vector2_Mouse_Location
												tbl33[1] = v93
												tbl33[2] = cframe
												tbl33[3] = tbl32
												tbl33[4] = v94
												return tbl33
											end

											if arg == "Dot Pointer" then
												local currentCamera = workspace.CurrentCamera
												local v92 = tbl19.select_target_by_mouse()
												local position = v92 and v92.PrimaryPart and v92.PrimaryPart.Position or localPlayer.Character.PrimaryPart.Position + currentCamera.CFrame.LookVector * 1000
												local v93 = Vector2_Mouse_Location

												return {
													0,
													CFrame.lookAt(localPlayer.Character.PrimaryPart.Position, position + Vector3.new(0, 1.75, 0)),
													tbl32,
													v93,
												}
											end

											if arg == "Straight" then
												local v92 = tbl19.Force_Target()

												if v92 then
													local screenData = v92.Screen_Data

													return {
														0,
														CFrame.new(localPlayer.Character.PrimaryPart.Position, v92.Character.PrimaryPart.Position),
														tbl32,
														screenData,
													}
												end

												local tbl33 = {}
												local cframe = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.CurrentCamera.CFrame.Position + workspace.CurrentCamera.CFrame.LookVector)
												local v93 = Vector2_Mouse_Location
												tbl33[1] = 0
												tbl33[2] = cframe
												tbl33[3] = tbl32
												tbl33[4] = v93
												return tbl33
											end

											if arg == "FFA" then
												local v92 = tbl19.FFA()

												if v92 then
													local screenData = v92.Screen_Data

													return {
														0,
														CFrame.new(localPlayer.Character.PrimaryPart.Position, v92.Character.PrimaryPart.Position),
														tbl32,
														screenData,
													}
												end

												local tbl33 = {}
												local cframe = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.CurrentCamera.CFrame.Position + workspace.CurrentCamera.CFrame.LookVector)
												local v93 = Vector2_Mouse_Location
												tbl33[1] = 0
												tbl33[2] = cframe
												tbl33[3] = tbl32
												tbl33[4] = v93
												return tbl33
											end

											return arg
										end

										do
											local v92 = require(ReplicatedStorage.Packages.Signal).new()
											v92:Connect(require(ReplicatedStorage.Controllers["SwordsController \12"].PRY))

											tbl19.Parry = function(arg)
												if tbl17.Flags.Parry_Options == "Hardware" then
													mouse1click()
													return
												end

												if tbl17.Flags.Parry_Options == "Keypress" then
													instance:SendKeyEvent(true, text, false, game)
													instance:SendKeyEvent(false, text, false, game)
													return
												end

												local v93 = tbl19.Parry_Data(arg)
												if not tbl31.Parry_Remote then
													v92:Fire(0, v93[2], v93[3], v93[4], false)
													return
												end
												tbl31.Token = tbl19.Generate_Token()
												tbl31.Parry_Remote:FireServer(tbl31.Parry_Hash, tbl31.Parry_Key, tbl31.Token, v93[1], v93[2], v93[3], v93[4], false)
											end
										end
									end
								end

								do
									do
										local v92 = nil
										local v93 = nil
										local v94 = nil
										local v95 = nil
										local n41 = 0
										flag18 = false

										tbl19.Parry_Animation = function()
											local attribute = localPlayer:GetAttribute("CurrentlyEquippedSword")
											if not attribute then
												return
											end
											local grabParry = ReplicatedStorage.Shared.SwordAPI.Collection.Default:FindFirstChild("GrabParry")
											if not grabParry then
												return
											end
											local v96 = ReplicatedStorage.Shared.ReplicatedInstances.Swords.GetSword:Invoke(attribute)
											if not v96 or not v96.AnimationType then
												return
											end

											for _, v97 in ReplicatedStorage.Shared.SwordAPI.Collection:GetChildren() do
												if v97.Name == v96.AnimationType then
													local grab = v97:FindFirstChild("GrabParry") or v97:FindFirstChild("Grab")
													if grab then
														grabParry = grab
														break
													end
												end
											end

											if not grabParry then
												return
											end
											local character = localPlayer.Character
											character = character and character:FindFirstChildOfClass("Humanoid")
											local animator = character and character:FindFirstChildOfClass("Animator")
											if not animator then
												return
											end

											if v92 and (v93 ~= grabParry or v94 ~= animator or v95 ~= attribute) then
												v92:Stop(v92:GetAttribute("StopFadeTime"))
												v92:Destroy()
												v92 = nil
												v93 = nil
												v94 = nil
												v95 = nil
											end

											if not v92 then
												v92 = animator:LoadAnimation(grabParry)
												v93 = grabParry
												v94 = animator
												v95 = attribute
											end

											if v92.IsPlaying then
												return
											end

											for _, v97 in animator:GetPlayingAnimationTracks() do
												if v97 ~= v92 then
													if v97.Name == "Parry" or v97.Name == "Success" then
														v97:Stop(v97:GetAttribute("StopFadeTime"))
													end
												end
											end

											v92:Play(v92:GetAttribute("PlayFadeTime"), v92:GetAttribute("PlayWeight"), v92:GetAttribute("PlaySpeed") or 1)
										end

										tbl19.Play_Animation = function()
											if os.clock() - n41 >= 1 or flag18 then
												n41 = os.clock()
												flag18 = false
												tbl19.Parry_Animation()
											end
										end
									end

									do
										local v92 = nil

										tbl19.Closest_Player = function()
											local alive = workspace.Alive
											if (localPlayer.Character or localPlayer.CharacterAdded:Wait()).Parent ~= alive then
												return false
											end
											local huge = math.huge
											local v93 = nil

											for _, v94 in alive:GetChildren() do
												if v94 and v94.Name ~= localPlayer.Name then
													local v95 = localPlayer:DistanceFromCharacter(v94.HumanoidRootPart.Position)

													if v95 < huge then
														huge = v95
														v93 = v94
													end
												end
											end

											v92 = v93
											return v92
										end

										tbl21 = {
											Curving = tick(),
											Lerp_Radians = 0,
											Last_Warping = tick(),
										}

										tbl19.Linear_Interpolation = function(arg, arg2, arg3)
											return arg + (arg2 - arg) * arg3
										end

										local function fn33()
											local unit = workspace.CurrentCamera.CFrame.LookVector.Unit
											local primaryPart = localPlayer.Character.PrimaryPart
											local huge = math.huge
											local v93 = nil

											for _, v94 in workspace.Alive:GetChildren() do
												if v94:FindFirstChild("HumanoidRootPart") and v94 ~= localPlayer.Character then
													local magnitude = (v94.HumanoidRootPart.Position - primaryPart.Position).Magnitude

													if magnitude < huge then
														huge = magnitude
														v93 = v94
													end
												end
											end

											if not v93 then
												return false, false
											end
											local v94 = unit:Dot((v93.HumanoidRootPart.Position - primaryPart.Position).Unit)
											return v94 >= -0.0112, v94 < -0.7
										end

										n32 = 0
										n33 = 0
										n34 = 5

										tbl19.Is_Curved = function()
											tbl19.Get_Balls()
											local v93 = table.pack(true, next(tbl19.Get_Balls()))

											if v93[1] then
												local v94 = v93[3]

												if not v94 then
													n32 = 0
													n33 = 0
													n34 = 0
													return
												end

												local zoomies = v94:FindFirstChild("zoomies")
												if not zoomies then
													return
												end
												local vectorVelocity = zoomies.VectorVelocity
												local position

												if v94 == v87 and v86 then
													position = v86
												else
													position = v94.Position
												end

												local unit = vectorVelocity.Unit
												local unit2 = (localPlayer.Character.PrimaryPart.Position - position).Unit
												local v95 = unit2:Dot(unit)
												local magnitude = vectorVelocity.Magnitude
												local n41 = math.min(magnitude / 100, 40)
												local n42 = math.clamp(v95 - unit2:Dot((unit - vectorVelocity).Unit), -1, 1)
												local magnitude2 = (localPlayer.Character.PrimaryPart.Position - position).Magnitude
												local v96 = "Data Ping"
												local value = game:GetService("Stats").Network.ServerStatsItem[v96]:GetValue()
												local n43 = 0.5 - value / 1000
												local n44 = 20 * math.max(v95, 0)
												local flag25 = magnitude > 100
												local n45 = magnitude2 / magnitude - value / 1000
												local n46 = 15 - math.min(magnitude2 / 1000, 15) + n44 + n41
												v94:GetAttribute("target")
												local singularityCape = localPlayer.Character.PrimaryPart:FindFirstChild("SingularityCape")
												local n47 = math.clamp(v95, -1, 1)
												local v97 = math.rad(math.asin(n47))
												local v98 = unit2:Dot(unit)
												local now3 = os.clock()

												if not singularityCape and math.sign(v98) ~= math.sign(n32) then
													if now3 - n34 < 0.2 then
														n33 += 1
													else
														n33 = 0
													end

													n34 = now3
												end

												n32 = v98
												tbl21.Lerp_Radians = tbl19.Linear_Interpolation(tbl21.Lerp_Radians, v97, 0.8)

												if flag25 and n45 > value / 10 then
													n46 = math.max(n46 - 15, 15)
												end

												if n33 >= 5 then
													return false
												end

												if v95 < 0 then
													return true
												end

												if magnitude2 < n46 then
													return false
												end

												if n42 < n43 then
													return true
												end

												if tbl21.Lerp_Radians < 0.018 then
													tbl21.Last_Warping = tick()
												end

												local lastWarping = tbl21.Last_Warping
												if tick() - lastWarping < n45 / 1.5 then
													return true
												end
												local flag26 = magnitude2 > n46

												if flag26 then
													local curving = tbl21.Curving
													flag26 = tick() - curving < n45 / 1.5
												end

												if flag26 then
													return true
												end
												return v95 < n43
											end
										end

										tbl19.Encrypted_Clone = function()
											for _, v93 in workspace.Alive:GetChildren() do
												if v93 and v93.Name and v93.Name:find("ENCRYPTED CLONE", 1, true) then
													return v93
												end
											end
										end

										n35 = 0
										n36 = 5
										n37 = 0
										flag19 = false
										flag20 = false

										tbl19.Is_Curved2 = function()
											if game.PlaceId == 15264892126 then
												return false
											end
											local alive = workspace.Alive
											if game.PlaceId == 13772394625 and #alive:GetChildren() > 2 then
												return false
											end

											if not workspace.ShowdownActive then
												return false
											end
											tbl19.Get_Balls()
											local v93 = table.pack(true, next(tbl19.Get_Balls()))

											if v93[1] then
												local v94 = v93[3]
												local zoomies = v94:FindFirstChild("zoomies")
												if not zoomies then
													return false
												end

												if v94 == v87 and v86 then
													Ball_Position = v86
												else
													Ball_Position = v94.Position
												end

												local vectorVelocity = zoomies.VectorVelocity
												local v95 = (localPlayer.Character.HumanoidRootPart.Position - Ball_Position).Unit:Dot(vectorVelocity.Unit)
												local now3 = os.clock()

												if math.sign(v95) ~= math.sign(n37) then
													if now3 - n36 < 0.2 then
														n35 += 1
													else
														n35 = 0
													end

													n36 = now3
												end

												n37 = v95
												local flag25 = n35 >= 6
												local magnitude = (localPlayer.Character.PrimaryPart.Position - Ball_Position).Magnitude
												local magnitude2 = (localPlayer.Character.PrimaryPart.Position - Ball_Position + vectorVelocity * 0.15).Magnitude
												local unit = vectorVelocity.Unit
												local primaryPart = localPlayer.Character.PrimaryPart
												local lookVector = workspace.CurrentCamera.CFrame.LookVector
												local flag26 = Vector3.new(lookVector.X, 0, lookVector.Z).Unit:Dot((Ball_Position - primaryPart.Position).Unit) >= 0
												flag26 = flag26 and (localPlayer.Character.PrimaryPart.Position - Ball_Position).Unit:Dot(unit) >= 0
												local attribute = v94:GetAttribute("target")
												local attribute2 = v94:GetAttribute("from")
												local name = tbl19.Encrypted_Clone()
												name = name and name.Name

												if attribute2 == localPlayer.Name and flag19 then
													flag20 = true
												end

												if attribute2 ~= localPlayer.Name and attribute2 ~= name then
													flag20 = false
												end

												if not flag19 and attribute2 then
													if attribute2 ~= localPlayer.Name and attribute2 ~= name then
														flag19 = true
														FirstHit = attribute2
														flag20 = false
													end
												end

												if flag19 and FirstHit ~= nil and FirstHit ~= localPlayer.Name and FirstHit ~= name and attribute2 == name and attribute == localPlayer.Name and flag20 == false and game.PlaceId == 15234596844 and #alive:GetChildren() > 2 then
													return false
												end
												fn33()
												tbl19.Is_Curved()
												if flag26 then
													return false
												end
												local flag27 = game.PlaceId == 15234596844

												if flag27 then
													local v96 = 0.5
													flag27 = getgenv().Time_View > v96
												end

												if flag27 and magnitude2 > magnitude + 15.5 and not flag25 then
													return true
												end

												if #alive:GetChildren() == 2 and getgenv().Time_View > 0.5 and magnitude2 > magnitude + 15.5 and not flag25 then
													return true
												end
												return false
											end
										end

										tbl19.Get_Entity_Properties = function()
											tbl19.Closest_Player()
											if not v92 then
												return false
											end

											return {
												Velocity = v92.HumanoidRootPart.AssemblyLinearVelocity,
												Direction = (localPlayer.Character.HumanoidRootPart.Position - v92.HumanoidRootPart.Position).Unit,
												Distance = (localPlayer.Character.HumanoidRootPart.Position - v92.HumanoidRootPart.Position).Magnitude,
											}
										end
									end

									do
										local service2

										do
											tbl19.Get_Ball_Properties = function(arg, arg2)
												if not arg2 then
													return false
												end
												local v92 = arg2:FindFirstChild("zoomies")
												if not v92 then
													return false
												end
												local vectorVelocity = v92.VectorVelocity
												local position

												if arg2 == v87 and v86 then
													position = v86
												else
													position = arg2.Position
												end

												local unit = (localPlayer.Character.HumanoidRootPart.Position - position).Unit

												return {
													Speed = vectorVelocity.Magnitude,
													Velocity = vectorVelocity,
													Direction = unit,
													Distance = (localPlayer.Character.HumanoidRootPart.Position - position).Magnitude,
													Dot = unit:Dot(vectorVelocity.Unit),
												}
											end

											tbl19.Spam_Service = function(arg)
												local ball = arg.Ball
												if not ball then
													return false
												end
												local v92 = ball:FindFirstChild("zoomies")
												if not v92 then
													return false
												end
												local vectorVelocity = v92.VectorVelocity
												local magnitude = vectorVelocity.Magnitude
												local position

												if ball == v87 and v86 then
													position = v86
													if not flag3 then
														return
													end
												else
													position = ball.Position
												end

												local v93 = (localPlayer.Character.HumanoidRootPart.Position - position).Unit:Dot(vectorVelocity.Unit)
												local n41 = arg.Ping + math.min(magnitude / 5.8, 95)
												if arg.Entity_Properties.Distance > n41 or arg.Ball_Properties.Distance > n41 then
													return 0
												end
												local n42 = 5 - math.min(magnitude / 5, 5)
												return n41 - math.clamp(v93, -1, 0) * n42
											end

											if not isfolder("Aries") then
												makefolder("Aries")
											end

											service2 = game:GetService("HttpService")

											do
												local function fn33()
													if not isfile("Aries/fav_swords.json") then
														writefile("Aries/fav_swords.json", service2:JSONEncode({ FavoriteSword = {}, FavoriteExplosion = {}, LastEquipped = nil }))
													end

													return service2:JSONDecode(readfile("Aries/fav_swords.json"))
												end

												fn30 = function(arg, arg2, arg3)
													writefile("Aries/fav_swords.json", service2:JSONEncode({ FavoriteSword = arg, FavoriteExplosion = arg2, LastEquipped = arg3 }))
												end

												local v92 = fn33()
												favoriteSword = v92.FavoriteSword or {}
												favoriteExplosion = v92.FavoriteExplosion or {}
												lastEquipped = v92.LastEquipped
											end
										end

										tbl22 = {}
										v88 = nil
										tbl23 = {}
										getgenv().FinisherEquipped = getgenv().FinisherEquipped or {}
										getgenv().Selected_Finisher = getgenv().Selected_Finisher or false

										fn31 = function(arg)
											writefile("Aries/last_explosion.json", service2:JSONEncode({ last = arg }))
										end

										do
											local function fn33()
												if isfile("Aries/last_explosion.json") then
													return service2:JSONDecode(readfile("Aries/last_explosion.json")).last
												end
											end

											str8 = fn33() or ""
										end
									end
								end

								do
									local service2, tbl31

									do
										v89 = localPlayer:WaitForChild("PlayerGui")
										TitleData = require(ReplicatedStorage.Shared.TitleData)
										titleList = v89.Settings.Frame.Frame:WaitForChild("SettingTitles"):WaitForChild("TitleList")
										tbl24 = {}
										service = game:GetService("TextChatService")

										fn32 = function(arg)
											return string.format("#%02X%02X%02X", arg.R * 255, arg.G * 255, arg.B * 255)
										end

										tbl25 = nil
										v90 = nil
										tbl26 = {}
										tbl27 = {}
										tbl28 = {}
										v91 = nil

										for _, v92 in getgc(true) do
											local v93 = "table"

											if type(v92) == v93 then
												local value = rawget(v92, "PlayExplosion")
												local value2 = rawget(v92, "PlayExplosionFromInstance")
												local value3 = rawget(v92, "PlayExplosionFromInstance")
												if type(value) == "function" and type(value2) == "function" and type(value3) == "function" then
													v91 = v92
													break
												end
											end
										end

										tbl19.Play_Emote_Animation = function(current)
											local v92 = tbl20.storage[current]
											if not v92 then
												return false
											end
											local Trove = require(ReplicatedStorage.Packages.Trove)
											local EmotesShared = require(ReplicatedStorage.Shared.EmotesShared)
											tbl20.storage.Trove = Trove.new()
											EmotesShared:Play(localPlayer.Character, tbl20.storage.Trove, v92.Name, true, workspace:GetServerTimeNow())
											tbl20.storage.current = current
										end

										tbl19.Play_Wheel_Emote_Animations = function(arg)
											local v92 = tbl20.storage[arg]
											if not v92 then
												return false
											end
											local Trove = require(ReplicatedStorage.Packages.Trove)
											local EmotesShared = require(ReplicatedStorage.Shared.EmotesShared)
											local character = localPlayer.Character
											if not character then
												return
											end
											local humanoid = character:FindFirstChildWhichIsA("Humanoid")
											if not humanoid then
												return
											end

											for _, v93 in humanoid.Animator:GetPlayingAnimationTracks() do
												local animation = v93.Animation

												if animation and animation.Parent == ReplicatedStorage.Misc.Emotes then
													v93:Stop()
												end
											end

											if tbl20.storage.Trove then
												tbl20.storage.Trove:Destroy()
												tbl20.storage.Trove = nil
											end

											tbl20.storage.Trove = Trove.new()

											if tbl18["Emote Wheel Heartbeat"] then
												tbl18["Emote Wheel Heartbeat"]:Disconnect()
												tbl18["Emote Wheel Heartbeat"] = nil
											end

											if tbl18["Emote Wheel Jumping"] then
												tbl18["Emote Wheel Jumping"]:Disconnect()
												tbl18["Emote Wheel Jumping"] = nil
											end

											if tbl18["Emote Connection Death"] then
												tbl18["Emote Connection Death"]:Disconnect()
												tbl18["Emote Connection Death"] = nil
											end

											if tbl18["Emote Character Added"] then
												tbl18["Emote Character Added"]:Disconnect()
												tbl18["Emote Character Added"] = nil
											end

											local function fn33()
												character = localPlayer.Character
												if not character then
													return
												end
												humanoid = character:FindFirstChildWhichIsA("Humanoid")
												if not humanoid then
													return
												end

												for _, v93 in humanoid.Animator:GetPlayingAnimationTracks() do
													local animation = v93.Animation

													if animation and animation.Parent == ReplicatedStorage.Misc.Emotes then
														v93:Stop()
													end
												end

												if tbl20.storage.Trove then
													tbl20.storage.Trove:Destroy()
													tbl20.storage.Trove = nil
												end
											end

											local function fn34(arg2)
												character = arg2
												humanoid = character:WaitForChild("Humanoid")

												if tbl18["Emote Wheel Jumping"] then
													tbl18["Emote Wheel Jumping"]:Disconnect()
													tbl18["Emote Wheel Jumping"] = nil
												end

												if tbl18["Emote Connection Death"] then
													tbl18["Emote Connection Death"]:Disconnect()
													tbl18["Emote Connection Death"] = nil
												end

												tbl18["Emote Wheel Jumping"] = humanoid.Jumping:Connect(function()
													fn33()
												end)

												tbl18["Emote Connection Death"] = humanoid.Died:Connect(function()
													if true then
														fn33()
													else
														while true do
														end
													end
												end)
											end

											tbl18["Emote Wheel Heartbeat"] = RunService.Heartbeat:Connect(function()
												character = localPlayer.Character
												if not character then
													return
												end
												humanoid = character:FindFirstChildWhichIsA("Humanoid")
												if not humanoid then
													return
												end

												if humanoid.MoveDirection.Magnitude > 0 then
													fn33()
												end
											end)

											tbl18["Emote Character Added"] = localPlayer.CharacterAdded:Connect(function(character2)
												if tbl20.storage.Trove then
													tbl20.storage.Trove:Destroy()
													tbl20.storage.Trove = nil
												end

												fn34(character2)
											end)

											fn34(character)
											EmotesShared:Play(character, tbl20.storage.Trove, v92.Name, true, workspace:GetServerTimeNow())
										end

										tbl29 = {
											"Calming Deflection",
											"Raging Deflection",
											"Rapture",
											"Aerodynamic Slash",
											"Forcefield",
											"Infinity",
											"Fracture",
											"Invisibility",
											"Ninja Dash",
										}

										tbl30 = {
											"BallEmit",
											"Upgrade",
											"Arch2",
											"MaxHook",
											"Wave",
											"Totem",
											"TotemRange",
											"InfinityFX",
											"maxTransmission",
											"transmissionpart",
											"Tornado",
											"Barrier",
											"GUARDIAN_DRAGON",
											"DRAGON_POSITIONER",
											"SpiritDeflect",
											"Vanity",
											"dash",
											"Summon",
											"MaxBlink",
										}

										flag21 = false
										now2 = nil
										n38 = 0
										flag22 = false
										n39 = 0
										n40 = 1.1
										service2 = game:GetService("TweenService")

										do
											local HttpService2 = game:GetService("HttpService")
											flag23 = UserInputService.TouchEnabled and not UserInputService.MouseEnabled

											tbl31 = {
												CurrentTabs = { left = nil, right = nil },
												Tabs = {},
												ActiveKeybindToggle = nil,
												WaitingForKey = false,
												Widgets = {},
											}

											if not isfolder("Aries") then
												makefolder("Aries")
											end

											if not isfolder("Aries/Presets") then
												makefolder("Aries/Presets")
											end

											tbl17.save_flags = function()
												local json = HttpService2:JSONEncode(tbl17.Flags)
												writefile("Aries/" .. game.GameId .. ".lua", json)
											end

											tbl17.load_flags = function()
												if not isfile("Aries/" .. game.GameId .. ".lua") then
													tbl17.save_flags()
													return
												end
												local v92 = readfile("Aries/" .. game.GameId .. ".lua")
												if not v92 then
													tbl17.save_flags()
													return
												end
												tbl17.Flags = HttpService2:JSONDecode(v92)
											end

											tbl17.load_flags()

											tbl17.save_preset = function(arg, arg2, arg3)
												local json = HttpService2:JSONEncode(arg3)
												writefile("Aries/Presets/" .. arg2 .. ".json", json)
											end

											tbl17.load_preset = function(arg, arg2)
												local str10 = "Aries/Presets/" .. arg2 .. ".json"
												if not isfile(str10) then
													return nil
												end
												return (HttpService2:JSONDecode(readfile(str10)))
											end
										end
									end

									tbl17.list_presets = function()
										local tbl32 = {}

										for _, v92 in listfiles("Aries/Presets"), nil, nil do
											local match = v92:match("Aries[/\\]Presets[/\\](.+)%.json")

											if match then
												table.insert(tbl32, match)
											end
										end

										return tbl32
									end

									tbl17.validate = function(arg, arg2, arg3)
										local tbl32 = arg3 or {}

										for k, v92 in arg2, nil, nil do
											if tbl32[k] == nil then
												tbl32[k] = v92
											end
										end

										return tbl32
									end

									do
										local ok, result = pcall(function()
											if not (n25 > 7303) then
												return loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/lucide-roblox-direct/refs/heads/main/source.lua"))()
											end

											while true do
											end
										end)

										local function fn33(arg, arg2)
											local v92 = "string"
											local flag25 = typeof(arg) == v92

											if flag25 then
												flag25 = arg:match("^content://") or arg:match("^rbxasset://%x+/") or arg2 == true and arg:match("^rbxassetid://")
											end

											return flag25
										end

										IsValidCustomIcon = function(arg)
											local v92 = "string"
											return typeof(arg) == v92 and (arg:match("^rbxasset://textures/") or arg:match("roblox%.com/asset/%?id=") or arg:match("rbxthumb://type="))
										end

										tbl17.GetIcon = function(arg, arg2)
											if not ok or not result then
												return
											end
											local ok2, result2 = pcall(result.GetAsset, arg2)
											if not ok2 then
												return
											end
											return result2
										end

										tbl17.GetCustomIcon = function(arg, arg2)
											if not arg2 then
												return nil
											end

											if tonumber(arg2) then
												arg2 = string.format("rbxassetid://%s", tostring(arg2))
											end

											if fn33(arg2, true) then
												return { Url = arg2, ImageRectOffset = Vector2.zero, ImageRectSize = Vector2.zero }
											end

											if IsValidCustomIcon(arg2) then
												return { Url = arg2, ImageRectOffset = Vector2.zero, ImageRectSize = Vector2.zero, Custom = true }
											end
											local icon = tbl17:GetIcon(arg2)
											if icon then
												return icon
											end
											return nil
										end
									end

									if flag23 then
										tbl17["1"] = Instance.new("ScreenGui", game:GetService("CoreGui"))
										tbl17["1"].Name = "Mobile_Gui"
										tbl17["1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
										tbl17["2"] = Instance.new("TextButton", tbl17["1"])
										tbl17["2"].BorderSizePixel = 0
										tbl17["2"].Modal = false
										tbl17["2"].AutoButtonColor = false
										tbl17["2"]["TextSize"] = 14
										tbl17["2"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
										tbl17["2"].BackgroundColor3 = Color3.fromRGB(28, 29, 34)
										tbl17["2"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
										tbl17["2"]["Size"] = UDim2.new(0, 122, 0, 38)
										tbl17["2"].Name = "Mobile"
										tbl17["2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
										tbl17["2"].Text = ""
										tbl17["2"]["Position"] = UDim2.new(0.5, -4, 0.918, -5)
										tbl17.Dragging = true
										tbl17["3"] = Instance.new("UICorner", tbl17["2"])
										tbl17["3"]["CornerRadius"] = UDim.new(0, 13)
										tbl17["4"] = Instance.new("ImageLabel", tbl17["2"])
										tbl17["4"].ZIndex = 0
										tbl17["4"].BorderSizePixel = 0
										tbl17["4"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
										tbl17["4"].ImageTransparency = 0.2
										tbl17["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
										tbl17["4"].Image = "rbxassetid://17183270335"
										tbl17["4"]["Size"] = UDim2.new(0, 142, 0, 58)
										tbl17["4"].BorderColor3 = Color3.fromRGB(0, 0, 0)
										tbl17["4"].BackgroundTransparency = 1
										tbl17["4"].Name = "Shadow"
										tbl17["4"].Position = UDim2.new(0.5, 0, 0.5, 0)
										tbl17["5"] = Instance.new("ImageLabel", tbl17["2"])
										tbl17["5"].BorderSizePixel = 0
										tbl17["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
										tbl17["5"].AnchorPoint = Vector2.new(0.5, 0.5)
										tbl17["5"]["Image"] = "rbxassetid://10709810463"
										tbl17["5"].Size = UDim2.new(0, 15, 0, 15)
										tbl17["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
										tbl17["5"]["BackgroundTransparency"] = 1
										tbl17["5"].Name = "Icon"
										tbl17["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)

										getgenv().MobileDrag = getgenv().MobileDrag or {
											Dragging = false,
											DragStart = nil,
											StartPosition = nil,
											DragInput = nil,
										}

										do
											local mobileDrag = getgenv().MobileDrag
											local UserInputService2 = game:GetService("UserInputService")

											tbl17["2"].InputBegan:Connect(function(input)
												if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
													mobileDrag.Dragging = true
													mobileDrag.DragStart = input.Position
													mobileDrag.StartPosition = tbl17["2"].Position

													input.Changed:Connect(function()
														if input.UserInputState == Enum.UserInputState.End then
															mobileDrag.Dragging = false
														end
													end)
												end
											end)

											tbl17["2"].InputChanged:Connect(function(input)
												if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
													mobileDrag.DragInput = input
												end
											end)

											UserInputService2.InputChanged:Connect(function(input)
												if input == mobileDrag.DragInput and mobileDrag.Dragging then
													local n41 = input.Position - mobileDrag.DragStart
													tbl17["2"].Position = UDim2.new(mobileDrag.StartPosition.X.Scale, mobileDrag.StartPosition.X.Offset + n41.X, mobileDrag.StartPosition.Y.Scale, mobileDrag.StartPosition.Y.Offset + n41.Y)
												end
											end)
										end

										tbl17["2"].InputBegan:Connect(function(input, gameProcessed)
											if gameProcessed then
												return
											end

											if input.UserInputType == Enum.UserInputType.MouseButton1 then
												if tbl31["1"].Enabled then
													local tbl32 = { Scale = 0 }
													local tween = service2:Create(tbl31["4"], TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), tbl32)
													tween:Play()
													tween.Completed:Wait()
													tbl31["1"].Enabled = false
												else
													tbl31["1"].Enabled = true
													tbl31["4"].Scale = 0
													service2:Create(tbl31["4"], TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), { Scale = 0.8 }):Play()
												end
											end
										end)

										tbl17["2"].TouchTap:Connect(function()
											if tbl31["1"].Enabled then
												local tbl32 = { Scale = 0 }
												local tween = service2:Create(tbl31["4"], TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), tbl32)
												tween:Play()
												tween.Completed:Wait()
												tbl31["1"].Enabled = false
											else
												tbl31["1"].Enabled = true
												tbl31["4"].Scale = 0
												service2:Create(tbl31["4"], TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), { Scale = 0.8 }):Play()
											end
										end)
									end

									byteUi = game:GetService("CoreGui"):FindFirstChild("Byte_UI")

									tbl17.new = function()
										tbl31["1"] = Instance.new("ScreenGui", localPlayer.PlayerGui)
										tbl31["1"].IgnoreGuiInset = true
										tbl31["1"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
										tbl31["1"].Name = "Byte_UI"
										tbl31["1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
										tbl31["1"].ResetOnSpawn = false
										tbl31["2"] = Instance.new("Frame", tbl31["1"])
										tbl31["2"].BorderSizePixel = 0
										tbl31["2"].BackgroundColor3 = Color3.fromRGB(10, 11, 16)
										tbl31["2"].AnchorPoint = Vector2.new(0.5, 0.5)
										tbl31["2"].Size = UDim2.new(0, 718, 0, 440)
										tbl31["2"].Position = UDim2.new(0.5, 0, 0.5, 0)
										tbl31["2"]["Name"] = "Main_Menu_Window"
										tbl31["2"]:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
										tbl31["3"] = Instance.new("UICorner", tbl31["2"])
										tbl31["3"].CornerRadius = UDim.new(0, 14)

										if flag23 then
											tbl31["4"] = Instance.new("UIScale", tbl31["2"])
											tbl31["4"].Scale = 0.8
											tbl31._targetScale = 0.8
										else
											tbl31["4"] = Instance.new("UIScale", tbl31["2"])
											tbl31["4"].Scale = 1
											tbl31._targetScale = 1
										end

										tbl31["5"] = Instance.new("Frame", tbl31["2"])
										tbl31["5"].BorderSizePixel = 0
										tbl31["5"].BackgroundColor3 = Color3.fromRGB(14, 15, 20)
										tbl31["5"]["Size"] = UDim2.new(0, 180, 1, -16)
										tbl31["5"].Position = UDim2.new(-0.03755, 0, 0.01818, 0)
										tbl31["5"].Name = "left_panel"
										tbl31["5"].BackgroundTransparency = 0.04
										tbl31["5"]:SetAttribute("fadeOriginal_BackgroundTransparency", 0.04)
										tbl31.TabContainer = Instance.new("Frame", tbl31["5"])
										tbl31.TabContainer.BackgroundTransparency = 1
										tbl31["TabContainer"].Size = UDim2.new(1, 0, 0, 280)
										tbl31.TabContainer.Position = UDim2.new(0, 0, 0, 90)
										tbl31["TabContainer"].Name = "TabContainer"
										local uiListLayout = Instance.new("UIListLayout", tbl31.TabContainer)
										uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
										uiListLayout.Padding = UDim.new(0, 6)
										uiListLayout.FillDirection = Enum.FillDirection.Vertical
										tbl31["6"] = Instance.new("UICorner", tbl31["5"])
										tbl31["6"].CornerRadius = UDim.new(0, 14)
										tbl31["7"] = Instance.new("UIShadow", tbl31["5"])
										tbl31["7"]:SetAttribute("fadeOriginal_Transparency", 0.55)
										tbl31["8"] = Instance.new("ImageLabel", tbl31["5"])
										tbl31["8"]["BorderSizePixel"] = 0
										tbl31["8"]["ScaleType"] = Enum.ScaleType.Fit
										tbl31["8"]["Image"] = "rbxassetid://84194878517331"
										tbl31["8"].Size = UDim2.new(0, 144, 0, 36)
										tbl31["8"].BackgroundTransparency = 1
										tbl31["8"].Name = "IMG_Logo"
										tbl31["8"].Position = UDim2.new(0, 18, 0, 14)
										tbl31["8"]:SetAttribute("fadeOriginal_ImageTransparency", 0)
										tbl31["8"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["9"] = Instance.new("Frame", tbl31["5"])
										tbl31["9"].BorderSizePixel = 0
										tbl31["9"].BackgroundColor3 = Color3.fromRGB(21, 21, 26)
										tbl31["9"].Size = UDim2.new(0, 158, 0, 32)
										tbl31["9"]["Position"] = UDim2.new(0, 0, 0, 380)
										tbl31["9"].Name = "UserCard"
										tbl31["9"]["BackgroundTransparency"] = 1
										tbl31["9"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["a"] = Instance.new("TextLabel", tbl31["9"])
										tbl31.a.TextTruncate = Enum.TextTruncate.AtEnd
										tbl31.a["TextSize"] = 12
										tbl31.a.TextXAlignment = Enum.TextXAlignment.Left
										tbl31.a.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
										tbl31.a["TextColor3"] = Color3.fromRGB(243, 243, 247)
										tbl31["a"].BackgroundTransparency = 1
										tbl31.a["Size"] = UDim2.new(0, 90, 0, 13)
										tbl31.a.Text = "Byteverserys"
										tbl31.a["Name"] = "Name"
										tbl31.a.Position = UDim2.new(0, 57, 0, 0)
										tbl31.a:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl31["a"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31.b = Instance.new("TextLabel", tbl31["9"])
										tbl31["b"].TextSize = 10
										tbl31.b["TextXAlignment"] = Enum.TextXAlignment.Left
										tbl31.b.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
										tbl31.b.TextColor3 = Color3.fromRGB(143, 143, 154)
										tbl31.b.BackgroundTransparency = 1
										tbl31.b.Size = UDim2.new(0, 96, 0, 11)
										tbl31.b.Text = "Till:  Lifetime"
										tbl31.b.Name = "Expiry"
										tbl31.b["Position"] = UDim2.new(0, 57, 0, 15)
										tbl31.b:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl31["b"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31.c = Instance.new("ImageLabel", tbl31["9"])
										tbl31.c.BorderSizePixel = 0
										tbl31["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
										tbl31.c["Image"] = "rbxthumb://type=AvatarHeadShot&id=7329993111&w=48&h=48"
										tbl31["c"].Size = UDim2.new(0, 32, 0, 30)
										tbl31.c.BackgroundTransparency = 1
										tbl31.c.Name = "IMG_Avatar"
										tbl31.c["Position"] = UDim2.new(0.09494, 0, 0.01989, 0)
										tbl31.c:SetAttribute("fadeOriginal_ImageTransparency", 0)
										tbl31.c:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31.d = Instance.new("UICorner", tbl31.c)
										tbl31.d.CornerRadius = UDim.new(1, 0)
										tbl31["1e"] = Instance.new("Frame", tbl31["2"])
										tbl31["1e"].BorderSizePixel = 0
										tbl31["1e"].BackgroundColor3 = Color3.fromRGB(27, 27, 34)
										tbl31["1e"].Size = UDim2.new(1, -158, 0, 62)
										tbl31["1e"].Position = UDim2.new(0, 158, 0, 0)
										tbl31["1e"].Name = "top_bar_content"
										tbl31["1e"]["BackgroundTransparency"] = 1
										tbl31["1e"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["1f"] = Instance.new("Frame", tbl31["1e"])
										tbl31["1f"]["BorderSizePixel"] = 0
										tbl31["1f"]["BackgroundColor3"] = Color3.fromRGB(14, 15, 20)
										tbl31["1f"].Size = UDim2.new(0, 200, 0, 34)
										tbl31["1f"].Position = UDim2.new(0, 8, 0, 23)
										tbl31["1f"].Name = "search"
										tbl31["1f"]["BackgroundTransparency"] = 0.3
										tbl31["1f"]:SetAttribute("fadeOriginal_BackgroundTransparency", 0.3)
										tbl31["20"] = Instance.new("UICorner", tbl31["1f"])
										tbl31["20"]["CornerRadius"] = UDim.new(0, 10)
										tbl31["21"] = Instance.new("UIShadow", tbl31["1f"])
										tbl31["21"]:SetAttribute("fadeOriginal_Transparency", 0.55)
										tbl31["22"] = Instance.new("ImageLabel", tbl31["1f"])
										tbl31["22"].BorderSizePixel = 0
										tbl31["22"]["ScaleType"] = Enum.ScaleType.Fit
										tbl31["22"].ImageTransparency = 0.3
										tbl31["22"].Image = "rbxassetid://109659294248163"
										tbl31["22"].Size = UDim2.new(0, 14, 0, 14)
										tbl31["22"].BackgroundTransparency = 1
										tbl31["22"].Name = "IMG_SearchIcon"
										tbl31["22"].Position = UDim2.new(0, 12, 0, 10)
										tbl31["22"]:SetAttribute("fadeOriginal_ImageTransparency", 0.3)
										tbl31["22"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["23"] = Instance.new("TextLabel", tbl31["1f"])
										tbl31["23"].TextSize = 12
										tbl31["23"].TextXAlignment = Enum.TextXAlignment.Left
										tbl31["23"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
										tbl31["23"]["TextColor3"] = Color3.fromRGB(143, 143, 154)
										tbl31["23"].BackgroundTransparency = 1
										tbl31["23"]["Size"] = UDim2.new(0, 160, 0, 34)
										tbl31["23"]["Text"] = "Search..."
										tbl31["23"].Name = "Placeholder"
										tbl31["23"].Position = UDim2.new(0, 34, 0, 0)
										tbl31["23"]:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl31["23"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["24"] = Instance.new("TextBox", tbl31["1f"])
										tbl31["24"].SelectionStart = 1
										tbl31["24"].Name = "Input"
										tbl31["24"].TextXAlignment = Enum.TextXAlignment.Left
										tbl31["24"].ZIndex = 2
										tbl31["24"].TextSize = 12
										tbl31["24"].TextColor3 = Color3.fromRGB(243, 243, 247)
										tbl31["24"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
										tbl31["24"].ClearTextOnFocus = false
										tbl31["24"].Size = UDim2.new(0, 160, 0, 34)
										tbl31["24"].Position = UDim2.new(0, 34, 0, 0)
										tbl31["24"].Text = ""
										tbl31["24"].BackgroundTransparency = 1
										tbl31["24"]:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl31["24"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["25"] = Instance.new("UIStroke", tbl31["1f"])
										tbl31["25"].Transparency = 1
										tbl31["25"].Color = Color3.fromRGB(125, 109, 247)
										tbl31["25"]:SetAttribute("fadeOriginal_Transparency", 1)
										tbl31["26"] = Instance.new("Frame", tbl31["1e"])
										tbl31["26"].BorderSizePixel = 0
										tbl31["26"].BackgroundColor3 = Color3.fromRGB(14, 15, 20)
										tbl31["26"].Size = UDim2.new(0, 95, 0, 34)
										tbl31["26"]["Position"] = UDim2.new(0, 453, 0, 23)
										tbl31["26"]["Name"] = "LegitPvP_Button"
										tbl31["26"]["BackgroundTransparency"] = 0.1
										tbl31["26"]:SetAttribute("fadeOriginal_BackgroundTransparency", 0.1)
										tbl31["27"] = Instance.new("UICorner", tbl31["26"])
										tbl31["27"].CornerRadius = UDim.new(0, 10)
										tbl31["28"] = Instance.new("TextLabel", tbl31["26"])
										tbl31["28"]["TextTruncate"] = Enum.TextTruncate.AtEnd
										tbl31["28"]["TextSize"] = 12
										tbl31["28"].TextXAlignment = Enum.TextXAlignment.Left
										tbl31["28"].FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
										tbl31["28"].TextColor3 = Color3.fromRGB(243, 243, 247)
										tbl31["28"].BackgroundTransparency = 1
										tbl31["28"]["Size"] = UDim2.new(0, 50, 0, 34)
										tbl31["28"].Text = "Config 1"
										tbl31["28"].Name = "Label"
										tbl31["28"].Position = UDim2.new(0, 12, 0, 0)
										tbl31["28"]:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl31["28"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["29"] = Instance.new("ImageLabel", tbl31["26"])
										tbl31["29"].BorderSizePixel = 0
										tbl31["29"].ScaleType = Enum.ScaleType.Fit
										tbl31["29"].Image = "rbxassetid://10723386277"
										tbl31["29"]["Size"] = UDim2.new(0, 16, 0, 16)
										tbl31["29"].BackgroundTransparency = 1
										tbl31["29"].Name = "IMG_FolderIcon"
										tbl31["29"].Position = UDim2.new(0, 70, 0, 9)
										tbl31["29"]:SetAttribute("fadeOriginal_ImageTransparency", 0)
										tbl31["29"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["2a"] = Instance.new("TextButton", tbl31["26"])
										tbl31["2a"].AutoButtonColor = false
										tbl31["2a"].ZIndex = 3
										tbl31["2a"].BackgroundTransparency = 1
										tbl31["2a"].Size = UDim2.new(1, 0, 1, 0)
										tbl31["2a"].Text = ""
										tbl31["2a"].Name = "Hit"
										tbl31["2a"]:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl31["2a"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31.Indicator = Instance.new("ImageLabel", tbl31["5"])
										tbl31.Indicator.BorderSizePixel = 0
										tbl31.Indicator.Image = "rbxassetid://90362801488029"
										tbl31.Indicator.Size = UDim2.new(0, 3, 0, 15)
										tbl31.Indicator.BackgroundTransparency = 1
										tbl31.Indicator.Name = "Indicator"
										tbl31.Indicator.Position = UDim2.new(0, 0, 0, 93)
										tbl31["e"] = Instance.new("Frame", tbl31["5"])
										tbl31.e.BorderSizePixel = 0
										tbl31.e.BackgroundColor3 = Color3.fromRGB(23, 24, 32)
										tbl31["e"].Size = UDim2.new(1, -26, 0, 23)
										tbl31.e.Position = UDim2.new(0, 8, 0, 90)
										tbl31.e.Name = "Highlight"
										tbl31.e.Visible = true
										tbl31["e"].ZIndex = 0
										tbl31["e"]:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
										tbl31.f = Instance.new("UICorner", tbl31.e)
										tbl31["10"] = Instance.new("UIShadow", tbl31.e)
										tbl31["10"]:SetAttribute("fadeOriginal_Transparency", 0.55)
										tbl31.ef = Instance.new("Frame", tbl31["2"])
										tbl31["ef"].Visible = false
										tbl31.ef.ZIndex = 60
										tbl31.ef.BorderSizePixel = 0
										tbl31.ef["BackgroundColor3"] = Color3.fromRGB(10, 11, 16)
										tbl31.ef.Size = UDim2.new(0, 236, 0, 490)
										tbl31.ef.Position = UDim2.new(0, 737, 0, 3)
										tbl31.ef.Name = "name_config_window"
										tbl31.ef:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
										tbl31.ef:SetAttribute("fadeLayer", 3)
										tbl31["ef"]:SetAttribute("fadeIsolated", true)
										tbl31["ef"].ClipsDescendants = true
										tbl31.f0 = Instance.new("UICorner", tbl31.ef)
										tbl31.f0.CornerRadius = UDim.new(0, 12)
										tbl31["f1"] = Instance.new("UIStroke", tbl31.ef)
										tbl31.f1.Transparency = 0.4
										tbl31.f1["Color"] = Color3.fromRGB(47, 47, 58)
										tbl31.f1:SetAttribute("fadeOriginal_Transparency", 0.4)
										tbl31.f2 = Instance.new("ImageLabel", tbl31["ef"])
										tbl31.f2["ZIndex"] = 61
										tbl31.f2.ScaleType = Enum.ScaleType.Fit
										tbl31["f2"].ImageColor3 = Color3.fromRGB(151, 151, 162)
										tbl31.f2.Image = "rbxassetid://70621328130295"
										tbl31.f2.Size = UDim2.new(0, 18, 0, 18)
										tbl31["f2"].BackgroundTransparency = 1
										tbl31.f2["Name"] = "IMG_CloudIcon"
										tbl31.f2.Position = UDim2.new(0, 14, 0, 15)
										tbl31.f2:SetAttribute("fadeOriginal_ImageTransparency", 0)
										tbl31.f2:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31.f3 = Instance.new("TextLabel", tbl31.ef)
										tbl31.f3["ZIndex"] = 61
										tbl31.f3.TextSize = 14
										tbl31.f3["TextXAlignment"] = Enum.TextXAlignment.Left
										tbl31.f3.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
										tbl31.f3.TextColor3 = Color3.fromRGB(243, 243, 247)
										tbl31["f3"]["BackgroundTransparency"] = 1
										tbl31.f3.Size = UDim2.new(0, 120, 0, 24)
										tbl31.f3.Text = "Presets"
										tbl31["f3"].Name = "Title"
										tbl31.f3.Position = UDim2.new(0, 40, 0, 12)
										tbl31.f3:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl31["f3"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31.f4 = Instance.new("Frame", tbl31.ef)
										tbl31.f4.ZIndex = 61
										tbl31["f4"].BorderSizePixel = 0
										tbl31.f4.BackgroundColor3 = Color3.fromRGB(25, 24, 43)
										tbl31.f4.Size = UDim2.new(0, 26, 0, 26)
										tbl31.f4["Position"] = UDim2.new(0, 196, 0, 11)
										tbl31.f4.Name = "AddButton"
										tbl31.f4:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
										tbl31["f5"] = Instance.new("UICorner", tbl31.f4)
										tbl31.f5.CornerRadius = UDim.new(0, 7)
										tbl31.f6 = Instance.new("ImageLabel", tbl31.f4)
										tbl31["f6"]["ZIndex"] = 61
										tbl31.f6["ScaleType"] = Enum.ScaleType.Fit
										tbl31["f6"].ImageColor3 = Color3.fromRGB(243, 243, 247)
										tbl31.f6["Image"] = "rbxassetid://101123124881873"
										tbl31.f6["Size"] = UDim2.new(0, 14, 0, 14)
										tbl31.f6["BackgroundTransparency"] = 1
										tbl31.f6.Name = "IMG_Add"
										tbl31.f6["Position"] = UDim2.new(0, 6, 0, 6)
										tbl31.f6:SetAttribute("fadeOriginal_ImageTransparency", 0)
										tbl31.f6:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31.f7 = Instance.new("TextButton", tbl31.f4)
										tbl31.f7.AutoButtonColor = false
										tbl31.f7.ZIndex = 62
										tbl31["f7"]["BackgroundTransparency"] = 1
										tbl31.f7.Size = UDim2.new(1, 0, 1, 0)
										tbl31.f7.Text = ""
										tbl31.f7.Name = "Hit"
										tbl31["f7"]:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl31.f7:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31.f8 = Instance.new("UIStroke", tbl31["f4"])
										tbl31.f8.Transparency = 1
										tbl31["f8"]["Color"] = Color3.fromRGB(85, 85, 101)
										tbl31.f8:SetAttribute("fadeOriginal_Transparency", 1)
										tbl31.f9 = Instance.new("Frame", tbl31.ef)
										tbl31.f9.ZIndex = 61
										tbl31.f9.BorderSizePixel = 0
										tbl31.f9.BackgroundColor3 = Color3.fromRGB(25, 24, 43)
										tbl31.f9.Size = UDim2.new(0, 174, 0, 34)
										tbl31.f9.Position = UDim2.new(0, 14, 0, 50)
										tbl31["f9"].Name = "SearchBar"
										tbl31.f9:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
										tbl31.fa = Instance.new("UICorner", tbl31.f9)
										tbl31["fb"] = Instance.new("ImageLabel", tbl31.f9)
										tbl31["fb"]["ZIndex"] = 61
										tbl31["fb"].ScaleType = Enum.ScaleType.Fit
										tbl31.fb.ImageColor3 = Color3.fromRGB(151, 151, 162)
										tbl31.fb.Image = "rbxassetid://72296609649861"
										tbl31.fb.Size = UDim2.new(0, 14, 0, 14)
										tbl31.fb.BackgroundTransparency = 1
										tbl31.fb["Name"] = "IMG_SearchIcon"
										tbl31.fb["Position"] = UDim2.new(0, 10, 0, 10)
										tbl31.fb:SetAttribute("fadeOriginal_ImageTransparency", 0)
										tbl31["fb"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["fc"] = Instance.new("TextBox", tbl31.f9)
										tbl31.fc.Name = "Input"
										tbl31.fc.TextXAlignment = Enum.TextXAlignment.Left
										tbl31.fc.PlaceholderColor3 = Color3.fromRGB(121, 121, 132)
										tbl31.fc.ZIndex = 61
										tbl31.fc["TextSize"] = 12
										tbl31.fc.TextColor3 = Color3.fromRGB(243, 243, 247)
										tbl31.fc.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
										tbl31["fc"]["ClearTextOnFocus"] = false
										tbl31.fc.PlaceholderText = "Search"
										tbl31["fc"].Size = UDim2.new(0, 130, 0, 34)
										tbl31.fc.Position = UDim2.new(0, 32, 0, 0)
										tbl31.fc.Text = ""
										tbl31.fc.BackgroundTransparency = 1
										tbl31.fc:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl31["fc"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31.fd = Instance.new("Frame", tbl31.ef)
										tbl31["fd"].ZIndex = 61
										tbl31.fd.BorderSizePixel = 0
										tbl31.fd.BackgroundColor3 = Color3.fromRGB(25, 24, 43)
										tbl31.fd.Size = UDim2.new(0, 30, 0, 34)
										tbl31.fd.Position = UDim2.new(0, 192, 0, 50)
										tbl31["fd"].Name = "SortButton"
										tbl31.fd:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
										tbl31.fe = Instance.new("UICorner", tbl31.fd)
										tbl31["ff"] = Instance.new("ImageLabel", tbl31.fd)
										tbl31.ff.ZIndex = 61
										tbl31["ff"].ScaleType = Enum.ScaleType.Fit
										tbl31.ff.ImageColor3 = Color3.fromRGB(151, 151, 162)
										tbl31.ff.Image = "rbxassetid://117405374619280"
										tbl31.ff["Size"] = UDim2.new(0, 14, 0, 14)
										tbl31["ff"].BackgroundTransparency = 1
										tbl31.ff["Name"] = "IMG_SortIcon"
										tbl31.ff["Position"] = UDim2.new(0, 8, 0, 10)
										tbl31.ff:SetAttribute("fadeOriginal_ImageTransparency", 0)
										tbl31["ff"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["100"] = Instance.new("TextButton", tbl31.fd)
										tbl31["100"]["AutoButtonColor"] = false
										tbl31["100"]["ZIndex"] = 62
										tbl31["100"].BackgroundTransparency = 1
										tbl31["100"].Size = UDim2.new(1, 0, 1, 0)
										tbl31["100"].Text = ""
										tbl31["100"].Name = "Hit"
										tbl31["100"]:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl31["100"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["101"] = Instance.new("UIStroke", tbl31.fd)
										tbl31["101"]["Transparency"] = 1
										tbl31["101"]["Color"] = Color3.fromRGB(85, 85, 101)
										tbl31["101"]:SetAttribute("fadeOriginal_Transparency", 1)
										tbl31["kpw"] = Instance.new("Frame", tbl31["1"])
										tbl31.kpw.BorderSizePixel = 0
										tbl31.kpw.BackgroundColor3 = Color3.fromRGB(9, 10, 15)
										tbl31.kpw["ZIndex"] = 90
										tbl31.kpw.Size = UDim2.new(0, 150, 0, 76)
										tbl31["kpw"].Position = UDim2.new(0, 500, 0, 200)
										tbl31.kpw.Name = "keybind_picker_window"
										tbl31.kpw.Visible = false
										tbl31.kpw.ClipsDescendants = true
										tbl31.kpw:SetAttribute("fadeIsolated", true)
										tbl31.kpw_c = Instance.new("UICorner", tbl31.kpw)
										tbl31.kpw_c.CornerRadius = UDim.new(0, 10)
										tbl31.kpw_s = Instance.new("UIStroke", tbl31["kpw"])
										tbl31["kpw_s"]["Transparency"] = 0.45
										tbl31.kpw_s.Color = Color3.fromRGB(48, 48, 58)
										tbl31.kpw_sh = Instance.new("UIShadow", tbl31["kpw"])
										tbl31.kpw_sh.Transparency = 1
										tbl31.kpw_sh:SetAttribute("fadeOriginal_Transparency", 1)
										tbl31.kpw_nbf = Instance.new("Frame", tbl31["kpw"])
										tbl31.kpw_nbf.BorderSizePixel = 0
										tbl31.kpw_nbf.BackgroundColor3 = Color3.fromRGB(22, 23, 31)
										tbl31["kpw_nbf"]["ZIndex"] = 56
										tbl31["kpw_nbf"]["Size"] = UDim2.new(0, 134, 0, 26)
										tbl31["kpw_nbf"]["Position"] = UDim2.new(0, 8, 0, 8)
										tbl31.kpw_nbf.Name = "NewBindFrame"
										tbl31.kpw_nbf_c = Instance.new("UICorner", tbl31["kpw_nbf"])
										tbl31.kpw_nbf_c.CornerRadius = UDim.new(0, 7)
										tbl31.kpw_nbf_s = Instance.new("UIStroke", tbl31["kpw_nbf"])
										tbl31.kpw_nbf_s.Transparency = 1
										tbl31.kpw_nbf_s.Color = Color3.fromRGB(125, 109, 247)
										tbl31.kpw_nbf_i = Instance.new("ImageLabel", tbl31.kpw_nbf)
										tbl31.kpw_nbf_i.BorderSizePixel = 0
										tbl31.kpw_nbf_i.ScaleType = Enum.ScaleType.Fit
										tbl31.kpw_nbf_i["ImageColor3"] = Color3.fromRGB(138, 138, 148)
										tbl31.kpw_nbf_i.Image = "rbxassetid://122878673716704"
										tbl31.kpw_nbf_i.ZIndex = 56
										tbl31.kpw_nbf_i.Size = UDim2.new(0, 12, 0, 12)
										tbl31.kpw_nbf_i.BackgroundTransparency = 1
										tbl31.kpw_nbf_i.Name = "IMG_BindIcon"
										tbl31.kpw_nbf_i.Position = UDim2.new(0, 9, 0, 7)
										tbl31.kpw_nbf_p = Instance.new("TextLabel", tbl31.kpw_nbf)
										tbl31.kpw_nbf_p.TextSize = 12
										tbl31["kpw_nbf_p"].TextXAlignment = Enum.TextXAlignment.Left
										tbl31.kpw_nbf_p.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
										tbl31.kpw_nbf_p["TextColor3"] = Color3.fromRGB(138, 138, 148)
										tbl31["kpw_nbf_p"].BackgroundTransparency = 1
										tbl31.kpw_nbf_p.ZIndex = 56
										tbl31.kpw_nbf_p.Size = UDim2.new(0, 82, 0, 26)
										tbl31.kpw_nbf_p["Text"] = "New bind"
										tbl31.kpw_nbf_p["Name"] = "Placeholder"
										tbl31["kpw_nbf_p"].Position = UDim2.new(0, 27, 0, 0)
										tbl31.kpw_nbf_pp = Instance.new("ImageLabel", tbl31.kpw_nbf)
										tbl31["kpw_nbf_pp"]["BorderSizePixel"] = 0
										tbl31.kpw_nbf_pp["ScaleType"] = Enum.ScaleType.Fit
										tbl31.kpw_nbf_pp.ImageColor3 = Color3.fromRGB(138, 138, 148)
										tbl31.kpw_nbf_pp.Image = "rbxassetid://101123124881873"
										tbl31.kpw_nbf_pp["ZIndex"] = 56
										tbl31.kpw_nbf_pp.Size = UDim2.new(0, 12, 0, 12)
										tbl31.kpw_nbf_pp.BackgroundTransparency = 1
										tbl31.kpw_nbf_pp["Name"] = "IMG_Plus"
										tbl31["kpw_nbf_pp"].Position = UDim2.new(0, 116, 0, 7)
										tbl31.kpw_nbf_h = Instance.new("TextButton", tbl31.kpw_nbf)
										tbl31["kpw_nbf_h"]["AutoButtonColor"] = false
										tbl31.kpw_nbf_h.ZIndex = 57
										tbl31.kpw_nbf_h["BackgroundTransparency"] = 1
										tbl31.kpw_nbf_h.Size = UDim2.new(1, 0, 1, 0)
										tbl31.kpw_nbf_h.Text = ""
										tbl31.kpw_nbf_h["Name"] = "Hit"
										tbl31.kpw_tb = Instance.new("Frame", tbl31.kpw)
										tbl31.kpw_tb.BorderSizePixel = 0
										tbl31.kpw_tb.BackgroundColor3 = Color3.fromRGB(41, 43, 54)
										tbl31.kpw_tb.ZIndex = 56
										tbl31.kpw_tb.Size = UDim2.new(0, 65, 0, 26)
										tbl31.kpw_tb.Position = UDim2.new(0, 8, 0, 42)
										tbl31.kpw_tb.Name = "ToggleButton"
										tbl31.kpw_tb_c = Instance.new("UICorner", tbl31.kpw_tb)
										tbl31.kpw_tb_c.CornerRadius = UDim.new(0, 7)
										tbl31.kpw_tb_s = Instance.new("UIStroke", tbl31.kpw_tb)
										tbl31["kpw_tb_s"].Transparency = 1
										tbl31.kpw_tb_s.Color = Color3.fromRGB(84, 84, 100)
										tbl31["kpw_tb_h"] = Instance.new("TextButton", tbl31.kpw_tb)
										tbl31["kpw_tb_h"].AutoButtonColor = false
										tbl31["kpw_tb_h"].ZIndex = 57
										tbl31["kpw_tb_h"]["BackgroundTransparency"] = 1
										tbl31.kpw_tb_h.Size = UDim2.new(1, 0, 1, 0)
										tbl31.kpw_tb_h.Text = ""
										tbl31.kpw_tb_h.Name = "Hit"
										tbl31.kpw_hb = Instance.new("Frame", tbl31.kpw)
										tbl31.kpw_hb.BorderSizePixel = 0
										tbl31.kpw_hb.BackgroundColor3 = Color3.fromRGB(41, 43, 54)
										tbl31.kpw_hb.ZIndex = 56
										tbl31.kpw_hb.Size = UDim2.new(0, 65, 0, 26)
										tbl31.kpw_hb["Position"] = UDim2.new(0, 77, 0, 42)
										tbl31["kpw_hb"].Name = "HoldButton"
										tbl31.kpw_hb_c = Instance.new("UICorner", tbl31.kpw_hb)
										tbl31["kpw_hb_c"]["CornerRadius"] = UDim.new(0, 7)
										tbl31.kpw_hb_s = Instance.new("UIStroke", tbl31.kpw_hb)
										tbl31.kpw_hb_s.Transparency = 1
										tbl31.kpw_hb_s.Color = Color3.fromRGB(84, 84, 100)
										tbl31.kpw_hb_h = Instance.new("TextButton", tbl31.kpw_hb)
										tbl31.kpw_hb_h.AutoButtonColor = false
										tbl31["kpw_hb_h"].ZIndex = 57
										tbl31.kpw_hb_h["BackgroundTransparency"] = 1
										tbl31.kpw_hb_h["Size"] = UDim2.new(1, 0, 1, 0)
										tbl31.kpw_hb_h["Text"] = ""
										tbl31.kpw_hb_h["Name"] = "Hit"
										tbl31.kpw_ms = Instance.new("Frame", tbl31.kpw)
										tbl31.kpw_ms["BorderSizePixel"] = 0
										tbl31["kpw_ms"].BackgroundColor3 = Color3.fromRGB(120, 104, 246)
										tbl31.kpw_ms.ZIndex = 56
										tbl31.kpw_ms["Size"] = UDim2.new(0, 65, 0, 26)
										tbl31.kpw_ms.Position = UDim2.new(0, 8, 0, 42)
										tbl31.kpw_ms.Name = "ModeSelection"
										tbl31.kpw_ms_c = Instance.new("UICorner", tbl31.kpw_ms)
										tbl31.kpw_ms_c["CornerRadius"] = UDim.new(0, 7)
										tbl31.kpw_tl = Instance.new("TextLabel", tbl31.kpw)
										tbl31.kpw_tl["TextSize"] = 12
										tbl31.kpw_tl["TextXAlignment"] = Enum.TextXAlignment.Center
										tbl31.kpw_tl.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
										tbl31["kpw_tl"].TextColor3 = Color3.fromRGB(34, 29, 72)
										tbl31.kpw_tl.BackgroundTransparency = 1
										tbl31.kpw_tl.ZIndex = 56
										tbl31.kpw_tl.Size = UDim2.new(0, 65, 0, 26)
										tbl31.kpw_tl["Text"] = "Toggle"
										tbl31.kpw_tl["Name"] = "ToggleLabel"
										tbl31["kpw_tl"]["Position"] = UDim2.new(0, 8, 0, 42)
										tbl31.kpw_hl = Instance.new("TextLabel", tbl31["kpw"])
										tbl31.kpw_hl.TextSize = 12
										tbl31.kpw_hl.TextXAlignment = Enum.TextXAlignment.Center
										tbl31.kpw_hl.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
										tbl31["kpw_hl"].TextColor3 = Color3.fromRGB(244, 244, 248)
										tbl31.kpw_hl["BackgroundTransparency"] = 1
										tbl31.kpw_hl["ZIndex"] = 56
										tbl31.kpw_hl.Size = UDim2.new(0, 65, 0, 26)
										tbl31.kpw_hl.Text = "Hold"
										tbl31["kpw_hl"].Name = "HoldLabel"
										tbl31.kpw_hl.Position = UDim2.new(0, 77, 0, 42)

										local function fn33(arg)
											if arg.UserInputType == Enum.UserInputType.Keyboard then
												return arg.KeyCode
											end

											if arg.UserInputType == Enum.UserInputType.MouseButton1 then
												return Enum.UserInputType.MouseButton1
											end

											if arg.UserInputType == Enum.UserInputType.MouseButton2 then
												return Enum.UserInputType.MouseButton2
											end

											if arg.UserInputType == Enum.UserInputType.MouseButton3 then
												return Enum.UserInputType.MouseButton3
											end
											return nil
										end

										local function fn34(arg)
											if typeof(arg) == "EnumItem" then
												if arg.EnumType == Enum.UserInputType then
													if arg == Enum.UserInputType.MouseButton1 then
														return "M1"
													end

													if arg == Enum.UserInputType.MouseButton2 then
														return "M2"
													end

													if arg == Enum.UserInputType.MouseButton3 then
														return "M3"
													end
												end

												return (arg.Name:gsub("Left", "L"):gsub("Right", "R"):gsub("Control", "Ctrl"):gsub("Shift", "Shf"))
											end

											return "None"
										end

										local tbl32 = { Enum.KeyCode.LeftControl, Enum.KeyCode.RightControl, Enum.KeyCode.LeftAlt, Enum.KeyCode.RightAlt }

										tbl31.kpw_nbf_h.MouseButton1Click:Connect(function()
											if not tbl31.ActiveKeybindToggle then
												return
											end
											tbl31.WaitingForKey = true
											tbl31.kpw_nbf_p.Text = "Press a key..."
											tbl31["kpw_nbf_p"].TextColor3 = Color3.fromRGB(125, 109, 247)
											service2:Create(tbl31.kpw_nbf_s, TweenInfo.new(0.2), { Transparency = 0 }):Play()
										end)

										tbl31.kpw_tb_h.MouseButton1Click:Connect(function()
											if not tbl31.ActiveKeybindToggle then
												return
											end
											tbl31.ActiveKeybindToggle.KeybindMode = "toggle"

											if tbl17.Keybinds[tbl31.ActiveKeybindToggle] then
												tbl17.Keybinds[tbl31.ActiveKeybindToggle].mode = "toggle"
											end

											if tbl31.ActiveKeybindToggle.flag and tbl17.Flags[tbl31.ActiveKeybindToggle.flag .. "_keybind"] then
												tbl17.Flags[tbl31.ActiveKeybindToggle.flag .. "_keybind"].mode = "toggle"
												tbl17.save_flags()
											end

											service2:Create(tbl31["kpw_ms"], TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.new(0, 8, 0, 42) }):Play()
											tbl31.kpw_tl.TextColor3 = Color3.fromRGB(34, 29, 72)
											tbl31.kpw_hl.TextColor3 = Color3.fromRGB(244, 244, 248)
										end)

										tbl31.kpw_hb_h.MouseButton1Click:Connect(function()
											if not tbl31.ActiveKeybindToggle then
												return
											end
											tbl31.ActiveKeybindToggle.KeybindMode = "hold"

											if tbl17.Keybinds[tbl31.ActiveKeybindToggle] then
												tbl17.Keybinds[tbl31.ActiveKeybindToggle].mode = "hold"
											end

											if tbl31.ActiveKeybindToggle.flag and tbl17.Flags[tbl31.ActiveKeybindToggle.flag .. "_keybind"] then
												tbl17.Flags[tbl31.ActiveKeybindToggle.flag .. "_keybind"].mode = "hold"
												tbl17.save_flags()
											end

											service2:Create(tbl31.kpw_ms, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.new(0, 77, 0, 42) }):Play()
											tbl31.kpw_tl.TextColor3 = Color3.fromRGB(244, 244, 248)
											tbl31.kpw_hl.TextColor3 = Color3.fromRGB(34, 29, 72)
										end)

										UserInputService.InputBegan:Connect(function(input)
											if not tbl31.WaitingForKey then
												return
											end

											if input.KeyCode == Enum.KeyCode.End then
												tbl31.WaitingForKey = false
												local activeKeybindToggle = tbl31.ActiveKeybindToggle

												if activeKeybindToggle then
													activeKeybindToggle.Keybind = nil
													activeKeybindToggle.KeybindName = nil
													tbl17.Keybinds[activeKeybindToggle] = nil

													if activeKeybindToggle.flag then
														tbl17.Flags[activeKeybindToggle.flag .. "_keybind"] = nil
														tbl17.save_flags()
													end

													if activeKeybindToggle["72_text"] then
														activeKeybindToggle["72_text"].Text = "···"
														activeKeybindToggle["72_text"].TextColor3 = Color3.fromRGB(138, 138, 148)
													end

													if activeKeybindToggle["73_s"] then
														service2:Create(activeKeybindToggle["73_s"], TweenInfo.new(0.2), { Transparency = 1 }):Play()
													end
												end

												tbl31.kpw_nbf_p.Text = "New bind"
												tbl31.kpw_nbf_p.TextColor3 = Color3.fromRGB(138, 138, 148)
												service2:Create(tbl31.kpw_nbf_s, TweenInfo.new(0.2), { Transparency = 1 }):Play()
												return
											end

											local v92 = fn33(input)
											if v92 == nil then
												return
											end

											if table.find(tbl32, v92) then
												return
											end
											tbl31.WaitingForKey = false
											local activeKeybindToggle = tbl31.ActiveKeybindToggle
											if not activeKeybindToggle then
												return
											end
											activeKeybindToggle.Keybind = v92
											activeKeybindToggle.KeybindName = fn34(v92)

											if not activeKeybindToggle.KeybindMode then
												activeKeybindToggle.KeybindMode = "toggle"
											end

											tbl17.Keybinds[activeKeybindToggle] = { key = v92, mode = activeKeybindToggle.KeybindMode, flag = activeKeybindToggle.flag }

											if activeKeybindToggle.flag then
												tbl17.Flags[activeKeybindToggle.flag .. "_keybind"] = {
													keyName = v92.Name,
													keyType = v92.EnumType == Enum.KeyCode and "KeyCode" or "UserInputType",
													displayName = fn34(v92),
													mode = activeKeybindToggle.KeybindMode,
												}

												tbl17.save_flags()
											end

											tbl31["kpw_nbf_p"].Text = fn34(v92)
											tbl31.kpw_nbf_p.TextColor3 = Color3.fromRGB(243, 243, 247)
											service2:Create(tbl31.kpw_nbf_s, TweenInfo.new(0.2), { Transparency = 1 }):Play()

											if activeKeybindToggle["72_text"] then
												activeKeybindToggle["72_text"].Text = fn34(v92)
												activeKeybindToggle["72_text"].TextColor3 = Color3.fromRGB(125, 109, 247)
											end

											if activeKeybindToggle["73_s"] then
												service2:Create(activeKeybindToggle["73_s"], TweenInfo.new(0.2), { Transparency = 0 }):Play()
											end
										end)

										UserInputService.InputBegan:Connect(function(input, gameProcessed)
											if gameProcessed then
												return
											end

											if tbl31.WaitingForKey then
												return
											end
											local v92 = fn33(input)
											if v92 == nil then
												return
											end

											for k, keybind in pairs(tbl17.Keybinds) do
												if keybind.key == v92 and k.flag then
													if keybind.mode == "toggle" then
														if not k._keybindHeld then
															k._keybindHeld = true

															pcall(function()
																k:Toggle()
															end)
														end
													elseif keybind.mode == "hold" then
														k._keybindHeld = true

														pcall(function()
															k:Toggle(true)
														end)
													end
												end
											end
										end)

										UserInputService.InputEnded:Connect(function(input)
											local v92 = fn33(input)
											if v92 == nil then
												return
											end

											for k, keybind in pairs(tbl17.Keybinds) do
												if keybind.key == v92 and k.flag then
													if keybind.mode == "toggle" then
														k._keybindHeld = false
													elseif keybind.mode == "hold" then
														k._keybindHeld = false

														pcall(function()
															k:Toggle(false)
														end)
													end
												end
											end
										end)

										tbl31.cpw = Instance.new("Frame", tbl31["1"])
										tbl31.cpw.BorderSizePixel = 0
										tbl31.cpw.BackgroundColor3 = Color3.fromRGB(9, 10, 15)
										tbl31.cpw.ZIndex = 90
										tbl31.cpw.Size = UDim2.new(0, 150, 0, 200)
										tbl31.cpw.Position = UDim2.new(0, 500, 0, 200)
										tbl31.cpw.Position = UDim2.new(-0.04, 1098, 0.286, 240)
										tbl31.cpw.Name = "color_picker_window"
										tbl31.cpw.Visible = false
										tbl31.cpw.ClipsDescendants = true
										tbl31.cpw:SetAttribute("fadeIsolated", true)
										tbl31.cpw_c = Instance.new("UICorner", tbl31.cpw)
										tbl31.cpw_c["CornerRadius"] = UDim.new(0, 10)
										tbl31.cpw_s = Instance.new("UIStroke", tbl31.cpw)
										tbl31.cpw_s.Transparency = 0.45
										tbl31.cpw_s.Color = Color3.fromRGB(48, 48, 58)
										tbl31.cpw_sh = Instance.new("UIShadow", tbl31.cpw)
										tbl31.cpw_sh.Transparency = 1
										tbl31.cpw_sh:SetAttribute("fadeOriginal_Transparency", 1)
										tbl31.cpw_pal = Instance.new("Frame", tbl31.cpw)
										tbl31.cpw_pal.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
										tbl31.cpw_pal.BorderSizePixel = 0
										tbl31.cpw_pal.ClipsDescendants = true
										tbl31.cpw_pal.Position = UDim2.new(0, 10, 0, 10)
										tbl31.cpw_pal["Size"] = UDim2.new(0, 106, 0, 106)
										tbl31.cpw_pal.ZIndex = 51
										tbl31.cpw_pal.Name = "Palette"
										Instance.new("UICorner", tbl31.cpw_pal).CornerRadius = UDim.new(0, 6)
										tbl31.cpw_pal_w = Instance.new("Frame", tbl31.cpw_pal)
										tbl31.cpw_pal_w.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
										tbl31.cpw_pal_w.BorderSizePixel = 0
										tbl31.cpw_pal_w.Size = UDim2.new(1, 0, 1, 0)
										tbl31.cpw_pal_w.ZIndex = 51
										tbl31.cpw_pal_w["Name"] = "WhiteOverlay"
										Instance.new("UICorner", tbl31.cpw_pal_w).CornerRadius = UDim.new(0, 6)
										local numberSequence = NumberSequence.new
										local new = NumberSequenceKeypoint.new
										local v92 = 1
										Instance.new("UIGradient", tbl31.cpw_pal_w).Transparency = numberSequence({ NumberSequenceKeypoint.new(0, 0), new(v92, 1) })
										tbl31.cpw_pal_b = Instance.new("Frame", tbl31.cpw_pal)
										tbl31.cpw_pal_b["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
										tbl31.cpw_pal_b.BorderSizePixel = 0
										tbl31.cpw_pal_b.Size = UDim2.new(1, 0, 1, 0)
										tbl31.cpw_pal_b.ZIndex = 51
										tbl31.cpw_pal_b.Name = "BlackOverlay"
										Instance.new("UICorner", tbl31.cpw_pal_b).CornerRadius = UDim.new(0, 6)
										local uiGradient = Instance.new("UIGradient", tbl31.cpw_pal_b)
										uiGradient.Rotation = 90
										local new2 = NumberSequenceKeypoint.new
										uiGradient.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), new2(1, 0) })
										tbl31.cpw_pal_sel = Instance.new("Frame", tbl31.cpw_pal)
										tbl31.cpw_pal_sel["BackgroundTransparency"] = 1
										tbl31.cpw_pal_sel["BorderSizePixel"] = 0
										tbl31.cpw_pal_sel.Position = UDim2.new(0.9, 0, 0, 0)
										tbl31.cpw_pal_sel["Size"] = UDim2.new(0, 10, 0, 10)
										tbl31.cpw_pal_sel.ZIndex = 52
										tbl31.cpw_pal_sel["Name"] = "Selector"
										Instance.new("UICorner", tbl31.cpw_pal_sel).CornerRadius = UDim.new(0, 4)
										local instance2 = Instance.new("UIStroke", tbl31.cpw_pal_sel)
										instance2.Color = Color3.fromRGB(255, 255, 255)
										instance2.Transparency = 0
										instance2.Thickness = 2
										tbl31.cpw_hue = Instance.new("Frame", tbl31.cpw)
										tbl31.cpw_hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
										tbl31.cpw_hue.BorderSizePixel = 0
										tbl31.cpw_hue.Position = UDim2.new(0, 124, 0, 10)
										tbl31.cpw_hue.Size = UDim2.new(0, 12, 0, 106)
										tbl31.cpw_hue.ZIndex = 51
										tbl31.cpw_hue.Name = "HueStrip"
										Instance.new("UICorner", tbl31.cpw_hue).CornerRadius = UDim.new(0, 5)
										local uiGradient2 = Instance.new("UIGradient", tbl31.cpw_hue)
										local colorSequence = ColorSequence.new
										local tbl33 = {}
										local v93 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0))
										local v94 = ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0))
										local v95 = ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0))
										local v96 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255))
										local v97 = ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255))
										local v98 = ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255))
										tbl33[1] = v93
										tbl33[2] = v94
										tbl33[3] = v95
										tbl33[4] = v96
										tbl33[5] = v97
										tbl33[6] = v98

										do
											local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)))
											table.move(values, 1, values.n, 7, tbl33)
										end

										uiGradient2.Color = colorSequence(tbl33)
										uiGradient2.Rotation = 90
										tbl31.cpw_hue_k = Instance.new("Frame", tbl31.cpw_hue)
										tbl31.cpw_hue_k["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
										tbl31.cpw_hue_k.BorderSizePixel = 0
										tbl31.cpw_hue_k.Position = UDim2.new(0, 0, 0, 0)
										tbl31.cpw_hue_k.Size = UDim2.new(0, 12, 0, 9)
										tbl31.cpw_hue_k["ZIndex"] = 52
										tbl31.cpw_hue_k["Name"] = "Knob"
										Instance.new("UICorner", tbl31.cpw_hue_k).CornerRadius = UDim.new(0, 4)
										local instance3 = Instance.new("UIStroke", tbl31.cpw_hue_k)
										instance3.Color = Color3.fromRGB(30, 30, 38)
										instance3.Transparency = 0
										instance3.Thickness = 2
										tbl31.cpw_alpha = Instance.new("Frame", tbl31.cpw)
										tbl31.cpw_alpha.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
										tbl31.cpw_alpha["BorderSizePixel"] = 0
										tbl31.cpw_alpha.ClipsDescendants = true
										tbl31.cpw_alpha.Position = UDim2.new(0, 10, 0, 124)
										tbl31.cpw_alpha.Size = UDim2.new(0, 126, 0, 10)
										tbl31.cpw_alpha.ZIndex = 51
										tbl31.cpw_alpha.Name = "AlphaBar"
										Instance.new("UICorner", tbl31.cpw_alpha).CornerRadius = UDim.new(0, 6)
										local imageLabel = Instance.new("ImageLabel", tbl31.cpw_alpha)
										imageLabel.Name = "Checkers"
										imageLabel.BackgroundTransparency = 1
										imageLabel.BorderSizePixel = 0
										imageLabel.Image = "rbxassetid://18274452449"
										imageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
										imageLabel.ImageTransparency = 0.6
										imageLabel.ScaleType = Enum.ScaleType.Tile
										imageLabel.TileSize = UDim2.new(0, 6, 0, 6)
										imageLabel.Size = UDim2.new(1, 0, 1, 0)
										imageLabel.ZIndex = 51
										tbl31.cpw_alpha_ramp = Instance.new("Frame", tbl31.cpw_alpha)
										tbl31.cpw_alpha_ramp.BackgroundColor3 = Color3.fromRGB(28, 108, 221)
										tbl31.cpw_alpha_ramp.BorderSizePixel = 0
										tbl31.cpw_alpha_ramp.Size = UDim2.new(1, 0, 1, 0)
										tbl31.cpw_alpha_ramp.ZIndex = 51
										tbl31.cpw_alpha_ramp["Name"] = "Ramp"
										Instance.new("UICorner", tbl31.cpw_alpha_ramp).CornerRadius = UDim.new(0, 6)
										local numberSequence2 = NumberSequence.new
										local new3 = NumberSequenceKeypoint.new
										local v99 = 1
										local v100 = 0
										Instance.new("UIGradient", tbl31.cpw_alpha_ramp).Transparency = numberSequence2({ NumberSequenceKeypoint.new(0, 1), new3(v99, v100) })
										tbl31.cpw_alpha_k = Instance.new("Frame", tbl31.cpw_alpha)
										tbl31.cpw_alpha_k.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
										tbl31.cpw_alpha_k.BorderSizePixel = 0
										tbl31.cpw_alpha_k.Position = UDim2.new(0.93, 0, 0, 0)
										tbl31.cpw_alpha_k["Size"] = UDim2.new(0, 9, 0, 10)
										tbl31.cpw_alpha_k.ZIndex = 52
										tbl31.cpw_alpha_k.Name = "Knob"
										Instance.new("UICorner", tbl31.cpw_alpha_k).CornerRadius = UDim.new(0, 4)
										local instance4 = Instance.new("UIStroke", tbl31.cpw_alpha_k)
										instance4.Color = Color3.fromRGB(30, 30, 38)
										instance4.Transparency = 0
										instance4.Thickness = 2
										tbl31.cpw_hex = Instance.new("Frame", tbl31.cpw)
										tbl31.cpw_hex.BorderSizePixel = 0
										tbl31.cpw_hex.BackgroundColor3 = Color3.fromRGB(22, 23, 31)
										tbl31.cpw_hex.Position = UDim2.new(0, 10, 0, 142)
										tbl31.cpw_hex.Size = UDim2.new(0, 126, 0, 24)
										tbl31.cpw_hex.ZIndex = 51
										tbl31.cpw_hex["Name"] = "HexField"
										Instance.new("UICorner", tbl31.cpw_hex).CornerRadius = UDim.new(0, 6)
										tbl31.cpw_hex_v = Instance.new("TextBox", tbl31.cpw_hex)
										tbl31.cpw_hex_v["BackgroundTransparency"] = 1
										tbl31.cpw_hex_v["Position"] = UDim2.new(0, 9, 0, 0)
										tbl31.cpw_hex_v["Size"] = UDim2.new(0, 108, 0, 24)
										tbl31.cpw_hex_v.ZIndex = 51
										tbl31.cpw_hex_v["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
										tbl31.cpw_hex_v.Text = "1C6CDDFF"
										tbl31.cpw_hex_v.TextColor3 = Color3.fromRGB(244, 244, 248)
										tbl31.cpw_hex_v["TextSize"] = 11
										tbl31.cpw_hex_v.TextXAlignment = Enum.TextXAlignment.Left
										tbl31.cpw_hex_v["ClearTextOnFocus"] = false
										tbl31.cpw_hex_v.Name = "Value"
										tbl31.ColorPickerState = { hue = 0.6, saturation = 0.87, value = 0.87, alpha = 1, isOpen = false, currentTarget = nil }
										local colorPickerState = tbl31.ColorPickerState

										local function fn35()
											return Color3.fromHSV(colorPickerState.hue, colorPickerState.saturation, colorPickerState.value)
										end

										local function fn36()
											local v101 = fn35()
											return string.format("%02X%02X%02X%02X", math.floor(v101.R * 255 + 0.5), math.floor(v101.G * 255 + 0.5), math.floor(v101.B * 255 + 0.5), math.floor(colorPickerState.alpha * 255 + 0.5))
										end

										local function fn37()
											local v101 = fn35()
											service2:Create(tbl31.cpw_pal, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromHSV(colorPickerState.hue, 1, 1) }):Play()
											local v102 = 0
											service2:Create(tbl31.cpw_pal_sel, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.new(math.min(colorPickerState.saturation, 0.92), v102, math.min(1 - colorPickerState.value, 0.92), 0) }):Play()
											local v103 = 0
											service2:Create(tbl31.cpw_hue_k, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.new(0, 0, math.min(colorPickerState.hue, 0.92), v103) }):Play()
											local v104 = 0
											local v105 = 0
											service2:Create(tbl31.cpw_alpha_k, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.new(math.min(colorPickerState.alpha, 0.93), v104, v105, 0) }):Play()
											service2:Create(tbl31.cpw_alpha_ramp, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundColor3 = v101 }):Play()
											tbl31.cpw_hex_v.Text = fn36()

											if colorPickerState.currentTarget then
												service2:Create(colorPickerState.currentTarget.swatch, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundColor3 = v101 }):Play()

												if colorPickerState.currentTarget.callback then
													colorPickerState.currentTarget.callback(v101)
												end

												if colorPickerState.currentTarget.flag then
													tbl17.Flags[colorPickerState.currentTarget.flag] = v101
													tbl17.save_flags()
												end
											end
										end

										local function closeColorPicker()
											colorPickerState.isOpen = false
											colorPickerState.currentTarget = nil
											service2:Create(tbl31.cpw_sh, TweenInfo.new(0.2), { Transparency = 1 }):Play()
											local tween = service2:Create(tbl31.cpw, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.new(0, 0, 0, 0) })

											tween.Completed:Once(function()
												tbl31.cpw.Visible = false
											end)

											tween:Play()
										end

										tbl31.closeColorPicker = closeColorPicker

										tbl31.openColorPicker = function(arg, arg2, arg3)
											if tbl31.cpw.Visible and colorPickerState.currentTarget and colorPickerState.currentTarget.swatch == arg then
												closeColorPicker()
												return
											end
											colorPickerState.isOpen = true
											colorPickerState.currentTarget = { swatch = arg, callback = arg2, flag = arg3 }
											local v101 = colorPickerState
											local v102 = colorPickerState
											local v103 = colorPickerState
											local v104, v105, v106 = arg.BackgroundColor3:ToHSV()
											v101.hue = v104
											v102.saturation = v105
											v103.value = v106
											colorPickerState.alpha = 1
											local absolutePosition = arg.AbsolutePosition
											local absolutePosition2 = tbl31["1"].AbsolutePosition
											tbl31.cpw.Position = UDim2.new(0, absolutePosition.X - absolutePosition2.X - 150 - 8, 0, absolutePosition.Y - absolutePosition2.Y - (178 - arg.AbsoluteSize.Y) / 2)
											tbl31.cpw.Size = UDim2.new(0, 0, 0, 0)
											tbl31.cpw.Visible = true
											service2:Create(tbl31.cpw_sh, TweenInfo.new(0.2), { Transparency = 0.55 }):Play()
											service2:Create(tbl31.cpw, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.new(0, 150, 0, 178) }):Play()
											fn37()
										end

										local flag25 = false
										local textButton = Instance.new("TextButton", tbl31.cpw_pal)
										textButton.AutoButtonColor = false
										textButton.ZIndex = 53
										textButton.BackgroundTransparency = 1
										textButton.Size = UDim2.new(1, 0, 1, 0)
										textButton.Text = ""
										textButton.Name = "Hit"

										local function fn38(arg)
											local absolutePosition = tbl31.cpw_pal.AbsolutePosition
											local absoluteSize = tbl31.cpw_pal.AbsoluteSize
											local v101 = 0
											colorPickerState.saturation = math.clamp((arg.X - absolutePosition.X) / math.max(1, absoluteSize.X), v101, 1)
											colorPickerState.value = 1 - math.clamp((arg.Y - absolutePosition.Y) / math.max(1, absoluteSize.Y), 0, 1)
											fn37()
										end

										textButton.MouseButton1Down:Connect(function()
											flag25 = true
											fn38(UserInputService:GetMouseLocation())
										end)

										UserInputService.InputChanged:Connect(function(input)
											if flag25 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
												fn38(input.Position)
											end
										end)

										UserInputService.InputEnded:Connect(function(input)
											if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
												flag25 = false
											end
										end)

										local flag26 = false
										local textButton2 = Instance.new("TextButton", tbl31.cpw_hue)
										textButton2.AutoButtonColor = false
										textButton2.ZIndex = 53
										textButton2.BackgroundTransparency = 1
										textButton2.Size = UDim2.new(1, 0, 1, 0)
										textButton2.Text = ""
										textButton2.Name = "Hit"

										local function fn39(arg)
											local v101 = 0
											colorPickerState.hue = math.clamp((arg.Y - tbl31.cpw_hue.AbsolutePosition.Y) / math.max(1, tbl31.cpw_hue.AbsoluteSize.Y), v101, 0.999)
											fn37()
										end

										textButton2.MouseButton1Down:Connect(function()
											flag26 = true
											fn39(UserInputService:GetMouseLocation())
										end)

										UserInputService.InputChanged:Connect(function(input)
											if flag26 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
												fn39(input.Position)
											end
										end)

										UserInputService.InputEnded:Connect(function(input)
											if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
												flag26 = false
											end
										end)

										local flag27 = false
										local textButton3 = Instance.new("TextButton", tbl31.cpw_alpha)
										textButton3.AutoButtonColor = false
										textButton3.ZIndex = 53
										textButton3.BackgroundTransparency = 1
										textButton3.Size = UDim2.new(1, 0, 1, 0)
										textButton3.Text = ""
										textButton3.Name = "Hit"

										local function fn40(arg)
											colorPickerState.alpha = math.clamp((arg.X - tbl31.cpw_alpha.AbsolutePosition.X) / math.max(1, tbl31.cpw_alpha.AbsoluteSize.X), 0, 1)
											fn37()
										end

										textButton3.MouseButton1Down:Connect(function()
											flag27 = true
											fn40(UserInputService:GetMouseLocation())
										end)

										UserInputService.InputChanged:Connect(function(input)
											if flag27 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
												fn40(input.Position)
											end
										end)

										UserInputService.InputEnded:Connect(function(input)
											if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
												flag27 = false
											end
										end)

										tbl31.cpw_hex_v.FocusLost:Connect(function()
											local match, v101, v102, v103 = tbl31.cpw_hex_v.Text:gsub("#", ""):upper():match("^(%x%x)(%x%x)(%x%x)(%x?%x?)$")

											if match then
												local v104 = tonumber
												local v105 = 16
												local color = Color3.fromRGB(tonumber(match, 16), tonumber(v101, 16), v104(v102, v105))
												local v106 = colorPickerState
												local v107 = colorPickerState
												local v108 = colorPickerState
												local v109, v110, v111 = color:ToHSV()
												v106.hue = v109
												v107.saturation = v110
												v108.value = v111
												local v112 = colorPickerState
												local alpha

												if v103 ~= "" then
													alpha = tonumber(v103, 16) / 255
												else
													alpha = 1
												end

												v112.alpha = alpha
											end

											fn37()
										end)

										UserInputService.InputBegan:Connect(function(input)
											if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
												if tbl31.cpw.Visible and colorPickerState.isOpen and colorPickerState.currentTarget then
													local position = input.Position
													local absolutePosition = tbl31.cpw.AbsolutePosition
													local absoluteSize = tbl31.cpw.AbsoluteSize
													local absolutePosition2 = colorPickerState.currentTarget.swatch.AbsolutePosition
													local absoluteSize2 = colorPickerState.currentTarget.swatch.AbsoluteSize

													if not (position.X >= absolutePosition.X and position.X <= absolutePosition.X + absoluteSize.X and position.Y >= absolutePosition.Y and position.Y <= absolutePosition.Y + absoluteSize.Y) and not (position.X >= absolutePosition2.X - 8 and position.X <= absolutePosition2.X + absoluteSize2.X + 8 and position.Y >= absolutePosition2.Y - 8 and position.Y <= absolutePosition2.Y + absoluteSize2.Y + 8) then
														closeColorPicker()
													end
												end
											end
										end)

										tbl31["2b"] = Instance.new("Frame", tbl31["2"])
										tbl31["2b"]["BorderSizePixel"] = 0
										tbl31["2b"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 34)
										tbl31["2b"].Size = UDim2.new(1, -158, 0, 22)
										tbl31["2b"].Position = UDim2.new(0, 158, 0, 62)
										tbl31["2b"].Name = "breadcrumb"
										tbl31["2b"].BackgroundTransparency = 1
										tbl31["2b"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["2c"] = Instance.new("ImageLabel", tbl31["2b"])
										tbl31["2c"].BorderSizePixel = 0
										tbl31["2c"]["ScaleType"] = Enum.ScaleType.Fit
										local icon = tbl17:GetIcon("chevron-right")
										local n2c = tbl31["2c"]

										if icon then
											n2c.Image = icon.Url
											n2c.ImageRectOffset = icon.ImageRectOffset
											n2c.ImageRectSize = icon.ImageRectSize
										end

										tbl31["2c"]["Size"] = UDim2.new(0, 15, 0, 15)
										tbl31["2c"].BackgroundTransparency = 1
										tbl31["2c"]["Name"] = "IMG_BreadcrumbIcon"
										tbl31["2c"].Position = UDim2.new(0, 8, 0, 3)
										tbl31["2c"]:SetAttribute("fadeOriginal_ImageTransparency", 0)
										tbl31["2c"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["2d"] = Instance.new("TextLabel", tbl31["2b"])
										tbl31["2d"]["TextSize"] = 12
										tbl31["2d"]["TextXAlignment"] = Enum.TextXAlignment.Left
										tbl31["2d"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
										tbl31["2d"].TextColor3 = Color3.fromRGB(143, 143, 154)
										tbl31["2d"].BackgroundTransparency = 1
										tbl31["2d"].Size = UDim2.new(0, 48, 0, 22)
										tbl31["2d"].Text = "Blatant"
										tbl31["2d"].Name = "Section"
										tbl31["2d"].Position = UDim2.new(0, 25, 0, 0)
										tbl31["2d"]:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl31["2d"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["2e"] = Instance.new("TextLabel", tbl31["2b"])
										tbl31["2e"]["TextSize"] = 18
										tbl31["2e"].FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
										tbl31["2e"].TextColor3 = Color3.fromRGB(106, 106, 117)
										tbl31["2e"].BackgroundTransparency = 1
										tbl31["2e"]["Size"] = UDim2.new(0, 25, 0, 26)
										tbl31["2e"]["Text"] = ""
										tbl31["2e"].Name = "Arrow"
										tbl31["2e"].Position = UDim2.new(0, 72, 0, -4)
										tbl31["2e"]:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl31["2e"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["2f"] = Instance.new("ImageLabel", tbl31["2e"])
										tbl31["2f"].BorderSizePixel = 0
										tbl31["2f"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
										tbl31["2f"].Image = "rbxassetid://10709768347"
										tbl31["2f"].Size = UDim2.new(0, 13, 0, 13)
										tbl31["2f"]["BackgroundTransparency"] = 1
										tbl31["2f"].Position = UDim2.new(0.28, 0, 0.30769, 0)
										tbl31["2f"]:SetAttribute("fadeOriginal_ImageTransparency", 0)
										tbl31["2f"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["31"] = Instance.new("TextLabel", tbl31["2b"])
										tbl31["31"].TextSize = 12
										tbl31["31"].TextXAlignment = Enum.TextXAlignment.Left
										tbl31["31"].FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
										tbl31["31"].TextColor3 = Color3.fromRGB(207, 207, 216)
										tbl31["31"]["BackgroundTransparency"] = 1
										tbl31["31"].Size = UDim2.new(0, 120, 0, 22)
										tbl31["31"]["Text"] = "Automation"
										tbl31["31"].Name = "Element"
										tbl31["31"]["Position"] = UDim2.new(0, 91, 0, 0)
										tbl31["31"]:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl31["31"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["30"] = Instance.new("UIAspectRatioConstraint", tbl31["2f"])
										local n2d = tbl31["2d"]
										local n2e = tbl31["2e"]
										local n312 = tbl31["31"]

										local function fn41()
											local targetScale = tbl31._targetScale or 1

											if targetScale <= 0 then
												targetScale = 1
											end

											local n41 = math.max(math.ceil(n2d.TextBounds.X / targetScale), 1)
											n2d.Size = UDim2.new(0, n41, 0, 22)
											n2d.Position = UDim2.new(0, 25, 0, 0)
											local n42 = 25 + n41 + 2
											n2e.Position = UDim2.new(0, n42, 0, -4)
											local n43 = n42 + 20 + 4
											local v101 = 1
											n312.Size = UDim2.new(0, math.max(math.ceil(n312.TextBounds.X / targetScale), v101), 0, 22)
											n312.Position = UDim2.new(0, n43, 0, 0)
										end

										n2d:GetPropertyChangedSignal("TextBounds"):Connect(fn41)
										n312:GetPropertyChangedSignal("TextBounds"):Connect(fn41)
										task.defer(fn41)
										tbl31["32"] = Instance.new("TextLabel", tbl31["2"])
										tbl31["32"].TextSize = 13
										tbl31["32"].TextXAlignment = Enum.TextXAlignment.Left
										tbl31["32"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
										tbl31["32"].TextColor3 = Color3.fromRGB(243, 243, 247)
										tbl31["32"].BackgroundTransparency = 1
										tbl31["32"]["Size"] = UDim2.new(0, 200, 0, 16)
										tbl31["32"].Text = "Auto Parry"
										tbl31["32"].Name = "MainTitle"
										tbl31["32"].Position = UDim2.new(0, 166, 0, 92)
										tbl31["32"]:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl31["32"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl31["33"] = Instance.new("TextLabel", tbl31["2"])
										tbl31["33"].TextSize = 13
										tbl31["33"].TextXAlignment = Enum.TextXAlignment.Left
										tbl31["33"].FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
										tbl31["33"].TextColor3 = Color3.fromRGB(243, 243, 247)
										tbl31["33"]["BackgroundTransparency"] = 1
										tbl31["33"].Size = UDim2.new(0, 200, 0, 16)
										tbl31["33"].Text = "Extras"
										tbl31["33"].Name = "ExtraTitle"
										tbl31["33"].Position = UDim2.new(0, 444, 0, 92)
										tbl31["33"]:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl31["33"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										local UserInputService2 = game:GetService("UserInputService")
										local n1 = tbl31["1"]
										local n42 = tbl31["4"]
										local tween = service2:Create(n42, TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), { Scale = 1 })
										local tween2 = service2:Create(n42, TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), { Scale = 0 })

										UserInputService2.InputBegan:Connect(function(input, gameProcessed)
											if gameProcessed then
												return
											end

											if input.KeyCode == Enum.KeyCode.RightControl or input.KeyCode == Enum.KeyCode.Insert or input.KeyCode == Enum.KeyCode.RightAlt or input.KeyCode == Enum.KeyCode.LeftAlt then
												if n1.Enabled then
													tween2:Play()
													tween2.Completed:Wait()
													n1.Enabled = false
												else
													n1.Enabled = true
													tween:Play()
												end
											end
										end)

										local n210 = tbl31["2"]
										local flag28 = false
										local position = nil
										local position2 = nil

										if not (n25 < 7201) then
											n210.Active = true
											n210.Selectable = true

											local function fn42(arg)
												flag28 = true
												position = arg.Position
												position2 = n210.Position
											end

											local function fn43()
												flag28 = false
											end

											n210.InputBegan:Connect(function(input)
												if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
													fn42(input)
												end
											end)

											n210.InputEnded:Connect(function(input)
												if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
													fn43()
												end
											end)

											UserInputService2.InputChanged:Connect(function(input)
												if flag28 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
													local n41 = input.Position - position
													n210.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n41.X, position2.Y.Scale, position2.Y.Offset + n41.Y)
												end
											end)

											local function fn44(arg, arg2)
												local tween3 = service2:Create(arg, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), arg2)
												tween3:Play()
												return tween3
											end

											tbl31["2a"].MouseButton1Click:Connect(function()
												local ef = tbl31.ef
												ef.Visible = not ef.Visible

												if ef.Visible then
													if tbl31.RefreshPresets then
														tbl31.RefreshPresets()
														local size = ef.Size
														ef.Size = UDim2.new(0, 236, 0, 0)
														fn44(ef, { Size = size })
													else
														fn44(ef, { Size = UDim2.new(0, 236, 0, 490) })
													end
												else
													fn44(ef, { Size = UDim2.new(0, 0, 0, 0) })
												end
											end)

											local n242 = tbl31["24"]
											local v101 = tbl31["23"]
											local n252 = tbl31["25"]
											local n41 = 0
											local scrollingFrame = Instance.new("ScrollingFrame", tbl31["2"])
											scrollingFrame.BorderSizePixel = 0
											scrollingFrame.BackgroundTransparency = 1
											scrollingFrame.Size = UDim2.new(0, 264, 0, 322)
											scrollingFrame.Position = UDim2.new(0, 166, 0, 118)
											scrollingFrame.ScrollBarThickness = 2
											scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 90)
											scrollingFrame.ClipsDescendants = true
											scrollingFrame.Visible = false
											scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
											scrollingFrame.Name = "SearchScrollLeft"
											local uiListLayout2 = Instance.new("UIListLayout", scrollingFrame)
											uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
											uiListLayout2.Padding = UDim.new(0, 10)
											local scrollingFrame2 = Instance.new("ScrollingFrame", tbl31["2"])
											scrollingFrame2.BorderSizePixel = 0
											scrollingFrame2.BackgroundTransparency = 1
											scrollingFrame2.Size = UDim2.new(0, 264, 0, 322)
											scrollingFrame2.Position = UDim2.new(0, 444, 0, 118)
											scrollingFrame2.ScrollBarThickness = 2
											scrollingFrame2.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 90)
											scrollingFrame2.ClipsDescendants = true
											scrollingFrame2.Visible = false
											scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
											scrollingFrame2.Name = "SearchScrollRight"
											local uiListLayout3 = Instance.new("UIListLayout", scrollingFrame2)
											uiListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
											uiListLayout3.Padding = UDim.new(0, 10)

											uiListLayout2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
												scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout2.AbsoluteContentSize.Y)
											end)

											uiListLayout3:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
												scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, uiListLayout3.AbsoluteContentSize.Y)
											end)

											local function fn45(arg)
												local label = arg:FindFirstChild("Label", true)
												if label and label:IsA("TextLabel") then
													return label.Text
												end
												return arg.Name
											end

											n242.Focused:Connect(function()
												service2:Create(n252, TweenInfo.new(0.2), { Transparency = 0 }):Play()
											end)

											n242.FocusLost:Connect(function()
												service2:Create(n252, TweenInfo.new(0.2), { Transparency = 1 }):Play()
											end)

											n242:GetPropertyChangedSignal("Text"):Connect(function()
												local v102 = string.lower(n242.Text)
												n41 += 1

												if v102 == "" then
													v101.Visible = true
													scrollingFrame.Visible = false
													scrollingFrame2.Visible = false

													for _, v103 in tbl31.Tabs, nil, nil do
														local allContainers = v103.AllContainers

														if not allContainers then
															allContainers = { { container = v103.ContentContainer, section = v103.Section or "left" } }
														end

														for _, v104 in allContainers, nil, nil do
															if v104.container.Parent ~= tbl31["2"] then
																v104.container.Parent = tbl31["2"]
															end

															for _, v105 in v104.container:GetChildren() do
																if v105:IsA("GuiObject") then
																	v105.Visible = true
																end
															end

															local section = v104.section
															v104.container.Visible = v103 == tbl31.CurrentTabs[section]
															v104.container.Position = UDim2.new(0, section == "right" and 444 or 166, 0, 118)
														end
													end
												else
													v101.Visible = false
													scrollingFrame.Visible = true
													scrollingFrame2.Visible = true
													local layoutOrder = 0
													local layoutOrder2 = 0

													for _, v103 in tbl31.Tabs, nil, nil do
														local allContainers = v103.AllContainers
														local tbl34

														if allContainers then
															tbl34 = allContainers
														else
															tbl34 = { { container = v103.ContentContainer, section = v103.Section or "left" } }
														end

														for _, v104 in tbl34, nil, nil do
															local flag29 = false

															for _, v105 in v104.container:GetChildren() do
																if v105:IsA("GuiObject") then
																	local v106 = fn45(v105)

																	if string.find(string.lower(v106), v102) then
																		v105.Visible = true
																		flag29 = true
																	else
																		v105.Visible = false
																	end
																end
															end

															if flag29 then
																if v104.section == "right" then
																	v104.container.Parent = scrollingFrame2
																	v104.container.LayoutOrder = layoutOrder
																	layoutOrder += 1
																else
																	v104.container.Parent = scrollingFrame
																	v104.container.LayoutOrder = layoutOrder2
																	layoutOrder2 += 1
																end

																v104.container.Position = UDim2.new(0, 0, 0, 0)
																v104.container.Visible = true
															else
																v104.container.Visible = false

																if v104.container.Parent ~= tbl31["2"] then
																	v104.container.Parent = tbl31["2"]
																end
															end
														end
													end
												end
											end)

											local v102 = tbl31["ef"]
											local fc = tbl31.fc
											local n100 = tbl31["100"]
											local ff = tbl31.ff
											local f7 = tbl31.f7
											local n282 = tbl31["28"]
											local TweenService = game:GetService("TweenService")
											local tbl34 = { "Legit PvP", "Rage HVH" }
											local color = Color3.fromRGB(25, 24, 43)
											local color2 = Color3.fromRGB(31, 30, 50)
											local color3 = Color3.fromRGB(31, 30, 50)
											local color4 = Color3.fromRGB(150, 150, 161)
											local color5 = Color3.fromRGB(243, 243, 247)
											local color6 = Color3.fromRGB(120, 120, 131)
											local color7 = Color3.fromRGB(150, 150, 161)
											local color8 = Color3.fromRGB(120, 120, 131)
											local color9 = Color3.fromRGB(224, 82, 76)
											local color10 = Color3.fromRGB(125, 109, 247)
											local color11 = Color3.fromRGB(150, 150, 161)
											local color12 = Color3.fromRGB(125, 109, 247)
											local tbl35 = {}
											local v103 = nil
											local flag29 = false
											local flag30 = true
											local imageLabel2 = Instance.new("ImageLabel")
											imageLabel2.Name = "indicator"
											imageLabel2.BackgroundTransparency = 1
											imageLabel2.BorderSizePixel = 0
											imageLabel2.Size = UDim2.new(0, 3, 0, 18)
											imageLabel2.Image = "rbxassetid://90362801488029"
											imageLabel2.ImageColor3 = color10
											imageLabel2.ZIndex = 62

											local function fn46()
												local tbl36 = {}

												for k, v104 in tbl17.Flags, nil, nil do
													if type(v104) == "table" then
														local tbl37 = {}

														for k2, v105 in v104, nil, nil do
															tbl37[k2] = v105
														end

														tbl36[k] = tbl37
													else
														tbl36[k] = v104
													end
												end

												return tbl36
											end

											local function fn47(arg)
												if not arg then
													return
												end

												for k in pairs(tbl17.Flags) do
													if k ~= "__lastPreset" then
														tbl17.Flags[k] = nil
													end
												end

												for k, v104 in arg, nil, nil do
													tbl17.Flags[k] = v104
												end
											end

											local function fn48(arg)
												local tbl36 = {}

												for k, v104 in pairs(arg) do
													if k ~= "__lastPreset" then
														if typeof(v104) == "Color3" then
															tbl36[k] = { __type = "Color3", R = v104.R, G = v104.G, B = v104.B }
														else
															tbl36[k] = v104
														end
													end
												end

												return tbl36
											end

											local function fn49(arg)
												if not arg then
													return {}
												end
												local tbl36 = {}

												for k, v104 in pairs(arg) do
													if type(v104) == "table" and v104.__type == "Color3" then
														tbl36[k] = Color3.new(v104.R or 0, v104.G or 0, v104.B or 0)
													elseif type(v104) == "table" and v104.R ~= nil and v104.G ~= nil and v104.B ~= nil and v104.A == nil and v104.__type == nil and v104.keyName == nil then
														tbl36[k] = Color3.new(v104.R, v104.G, v104.B)
													else
														tbl36[k] = v104
													end
												end

												return tbl36
											end

											local function fn50()
												if flag30 then
													return
												end

												for _, v104 in tbl35, nil, nil do
													local v105 = fn48(v104.flags or {})
													tbl17:save_preset(v104.name, v105)
												end

												if v103 then
													tbl17.Flags.__lastPreset = v103.name
												else
													tbl17.Flags.__lastPreset = nil
												end

												tbl17.save_flags()
											end

											local function refreshPresets()
												local v104 = string.lower(fc.Text or "")
												local tbl36 = {}

												for _, v105 in tbl35, nil, nil do
													if v104 == "" or string.find(string.lower(v105.name), v104, 1, true) then
														table.insert(tbl36, v105)
													end
												end

												if flag29 then
													table.sort(tbl36, function(arg, arg2)
														return string.lower(arg.name) < string.lower(arg2.name)
													end)
												end

												for _, v105 in tbl35, nil, nil do
													v105.row.Visible = false
												end

												for k, v105 in tbl36, nil, nil do
													v105.row.Visible = true
													v105.row.Position = UDim2.new(0, 14, 0, 98 + (k - 1) * 42)
												end

												v102.Size = UDim2.new(0, 236, 0, math.max(300, 98 + #tbl36 * 42 + 14))
											end

											tbl31.RefreshPresets = refreshPresets

											local function fn51()
												for _, v104 in tbl35, nil, nil do
													local flag31 = v104 == v103
													TweenService:Create(v104.row, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundTransparency = flag31 and 0 or 0.3, BackgroundColor3 = flag31 and color3 or color }):Play()
													v104.nameLabel.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", flag31 and Enum.FontWeight.SemiBold or Enum.FontWeight.Medium, Enum.FontStyle.Normal)
													v104.nameLabel.TextColor3 = flag31 and color5 or color4
													v104.editIcon.ImageColor3 = flag31 and color7 or color6
													v104.deleteIcon.ImageColor3 = flag31 and color9 or color8
												end

												if v103 and imageLabel2.Parent ~= nil then
													imageLabel2.Parent = v103.row
													imageLabel2.Position = UDim2.new(0, 0, 0, 8)
													n282.Text = v103.name
												end
											end

											local function fn52(arg)
												if v103 == arg then
													return
												end

												if v103 then
													v103.flags = fn46()
												end

												v103 = arg
												tbl31.ApplyingPreset = true

												for k, flag31 in pairs(tbl17.Flags) do
													if k ~= "__lastPreset" and type(flag31) == "boolean" then
														tbl17.Flags[k] = false
													end
												end

												for _, widget in ipairs(tbl31.Widgets) do
													widget()
												end

												fn47(arg.flags)

												for _, widget in ipairs(tbl31.Widgets) do
													widget()
												end

												tbl31.ApplyingPreset = false
												fn51()
												fn50()
											end

											local function fn53(text2, flags, arg)
												local frame = Instance.new("Frame")
												frame.Name = "Config_" .. text2:gsub("%s", "_")
												frame.Parent = v102
												frame.BackgroundTransparency = 0.3
												frame.BackgroundColor3 = color
												frame.BorderSizePixel = 0
												frame.Position = UDim2.new(0, 14, 0, 98)
												frame.Size = UDim2.new(0, 208, 0, 34)
												frame.ZIndex = 61
												Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
												local textLabel = Instance.new("TextLabel")
												textLabel.Name = "Name"
												textLabel.Parent = frame
												textLabel.BackgroundTransparency = 1
												textLabel.Position = UDim2.new(0, 14, 0, 0)
												textLabel.Size = UDim2.new(0, 130, 0, 34)
												textLabel.ZIndex = 61
												textLabel.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
												textLabel.Text = text2
												textLabel.TextColor3 = color4
												textLabel.TextSize = 12
												textLabel.TextXAlignment = Enum.TextXAlignment.Left
												textLabel.TextTruncate = Enum.TextTruncate.AtEnd
												local imageLabel3 = Instance.new("ImageLabel")
												imageLabel3.Name = "IMG_Edit"
												imageLabel3.Parent = frame
												imageLabel3.BackgroundTransparency = 1
												imageLabel3.Position = UDim2.new(0, 150, 0, 9)
												imageLabel3.Size = UDim2.new(0, 16, 0, 16)
												imageLabel3.ZIndex = 61
												imageLabel3.Image = "rbxassetid://131819263664272"
												imageLabel3.ImageColor3 = color6
												imageLabel3.ScaleType = Enum.ScaleType.Fit
												local imageLabel4 = Instance.new("ImageLabel")
												imageLabel4.Name = "IMG_Delete"
												imageLabel4.Parent = frame
												imageLabel4.BackgroundTransparency = 1
												imageLabel4.Position = UDim2.new(0, 178, 0, 9)
												imageLabel4.Size = UDim2.new(0, 16, 0, 16)
												imageLabel4.ZIndex = 61
												imageLabel4.Image = "rbxassetid://126010725826757"
												imageLabel4.ImageColor3 = color8
												imageLabel4.ScaleType = Enum.ScaleType.Fit
												local tbl36 = { name = text2 }
												tbl36.flags = flags or fn46()
												tbl36.row = frame
												tbl36.nameLabel = textLabel
												tbl36.editIcon = imageLabel3
												tbl36.deleteIcon = imageLabel4
												table.insert(tbl35, tbl36)
												local textButton4 = Instance.new("TextButton")
												textButton4.Name = "Hit_Select"
												textButton4.Parent = frame
												textButton4.AutoButtonColor = false
												textButton4.BackgroundTransparency = 1
												textButton4.Size = UDim2.new(0, 144, 1, 0)
												textButton4.Position = UDim2.new(0, 0, 0, 0)
												textButton4.ZIndex = 62
												textButton4.Text = ""

												textButton4.MouseEnter:Connect(function()
													if tbl36 ~= v103 then
														local tbl37 = { BackgroundColor3 = color2 }
														TweenService:Create(frame, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), tbl37):Play()
													end
												end)

												textButton4.MouseLeave:Connect(function()
													if tbl36 ~= v103 then
														local tbl37 = { BackgroundColor3 = color }
														TweenService:Create(frame, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), tbl37):Play()
													end
												end)

												textButton4.MouseButton1Click:Connect(function()
													fn52(tbl36)
												end)

												local textButton5 = Instance.new("TextButton")
												textButton5.Name = "Hit_Edit"
												textButton5.Parent = frame
												textButton5.AutoButtonColor = false
												textButton5.BackgroundTransparency = 1
												textButton5.Size = UDim2.new(0, 24, 0, 24)
												textButton5.Position = UDim2.new(0, 146, 0, 5)
												textButton5.ZIndex = 63
												textButton5.Text = ""

												textButton5.MouseButton1Click:Connect(function()
													local textBox = Instance.new("TextBox")
													textBox.Parent = frame
													textBox.BackgroundColor3 = color3
													textBox.BorderSizePixel = 0
													textBox.Position = UDim2.new(0, 10, 0, 5)
													textBox.Size = UDim2.new(0, 132, 0, 24)
													textBox.ZIndex = 64
													textBox.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
													textBox.Text = tbl36.name
													textBox.TextColor3 = color5
													textBox.TextSize = 12
													textBox.TextXAlignment = Enum.TextXAlignment.Left
													textBox.ClearTextOnFocus = false
													Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)
													textBox:CaptureFocus()

													textBox.FocusLost:Connect(function()
														local name = textBox.Text:gsub("^%s+", ""):gsub("%s+$", "")

														if name ~= "" then
															local name2 = tbl36.name
															tbl36.name = name
															textLabel.Text = name

															if tbl36 == v103 then
																n282.Text = name
															end

															if name2 ~= name then
																if n25 >= 7228 then
																	while true do
																	end
																else
																	pcall(function()
																		delfile("Aries/Presets/" .. name2 .. ".json")
																	end)
																end
															end
														end

														textBox:Destroy()
														refreshPresets()
														fn50()
													end)
												end)

												local textButton6 = Instance.new("TextButton")
												textButton6.Name = "Hit_Delete"
												textButton6.Parent = frame
												textButton6.AutoButtonColor = false
												textButton6.BackgroundTransparency = 1
												textButton6.Size = UDim2.new(0, 24, 0, 24)
												textButton6.Position = UDim2.new(0, 174, 0, 5)
												textButton6.ZIndex = 63
												textButton6.Text = ""

												textButton6.MouseButton1Click:Connect(function()
													if #tbl35 <= 1 then
														return
													end

													for k, v104 in tbl35, nil, nil do
														if v104 == tbl36 then
															table.remove(tbl35, k)
															break
														end
													end

													pcall(function()
														delfile("Aries/Presets/" .. tbl36.name .. ".json")
													end)

													if imageLabel2.Parent == frame then
														imageLabel2.Parent = nil
													end

													frame:Destroy()

													if v103 == tbl36 then
														v103 = nil

														if tbl35[1] then
															fn52(tbl35[1])
														else
															n282.Text = "Config 1"
														end
													end

													refreshPresets()
													fn50()
												end)

												if arg then
													v103 = tbl36
												end

												refreshPresets()
												fn51()
												fn50()
												return tbl36
											end

											local v104 = tbl17:list_presets()

											if #v104 > 0 then
												table.sort(v104, function(arg, arg2)
													return arg < arg2
												end)

												for _, v105 in v104, nil, nil do
													local v106 = tbl17:load_preset(v105)

													if v106 then
														fn53(v105, fn49(v106), false)
													end
												end
											else
												for k, v105 in tbl34, nil, nil do
													fn53(v105, nil, k == 1)
												end
											end

											flag30 = false

											fc:GetPropertyChangedSignal("Text"):Connect(function()
												refreshPresets()
											end)

											n100.MouseButton1Click:Connect(function()
												flag29 = not flag29
												TweenService:Create(ff, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { ImageColor3 = flag29 and color12 or color11 }):Play()
												refreshPresets()
											end)

											f7.MouseButton1Click:Connect(function()
												local str10 = "Config " .. tostring(#tbl35 + 1)
												local v105 = 1

												local function fn54(arg)
													for _, v106 in tbl35, nil, nil do
														if v106.name == arg then
															return true
														end
													end

													return false
												end

												local str11 = str10

												while fn54(str11) do
													v105 += 1
													str11 = str10 .. " (" .. v105 .. ")"
												end

												local v106 = fn53(str11, fn46(), true)
												fn52(v106)
											end)

											refreshPresets()
											fn51()
											return tbl31
										end

										while true do
										end
									end

									tbl17.Create_Tab = function(arg, arg2)
										local tbl32 = { Hover = false, Active = false, Section = "left" }

										local v92 = tbl17:validate({
											name = "Preview Tab",
											section_name = "Fallback",
											section = "left",
											icon = "rbxassetid://83752373575368",
										}, arg2 or {})

										tbl32.Section = string.lower(v92.section or "left")
										table.insert(tbl31.Tabs, tbl32)

										if not tbl31.CurrentTabs[tbl32.Section] then
											tbl31.CurrentTabs[tbl32.Section] = tbl32
										end

										if tbl31.CurrentTabs[tbl32.Section] == tbl32 then
											if tbl32.Section == "right" then
												tbl31["33"].Text = v92.name
											else
												tbl31["31"].Text = v92.section_name or "Fallback"
												tbl31["2d"].Text = v92.name
												tbl31["32"]["Text"] = v92.name
											end
										end

										tbl32["12"] = Instance.new("Frame", tbl31.TabContainer)
										tbl32["12"].BorderSizePixel = 0
										tbl32["12"].BackgroundColor3 = Color3.fromRGB(21, 21, 26)
										tbl32["12"]["Size"] = UDim2.new(1, 0, 0, 25)
										tbl32["12"]["Position"] = UDim2.new(0, 0, 0, 90)
										tbl32["12"]["Name"] = v92.name
										tbl32["12"].BackgroundTransparency = 1
										tbl32["12"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl32["13"] = Instance.new("ImageLabel", tbl32["12"])
										tbl32["13"].ZIndex = 2
										tbl32["13"]["BorderSizePixel"] = 0
										tbl32["13"].ScaleType = Enum.ScaleType.Fit
										tbl32["13"].ImageColor3 = Color3.fromRGB(143, 143, 154)
										local customIcon = tbl17:GetCustomIcon(v92.icon)

										if customIcon then
											local n132 = tbl32["13"]
											n132.Image = customIcon.Url
											n132.ImageRectOffset = customIcon.ImageRectOffset or Vector2.zero
											n132.ImageRectSize = customIcon.ImageRectSize or Vector2.zero
										end

										tbl32["13"].Size = UDim2.new(0, 14, 0, 14)
										tbl32["13"].BackgroundTransparency = 1
										tbl32["13"].Name = "IMG_Icon"
										tbl32["13"].Position = UDim2.new(0, 22, 0, 6)
										tbl32["13"]:SetAttribute("fadeOriginal_ImageTransparency", 0)
										tbl32["13"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl32["14"] = Instance.new("TextLabel", tbl32["12"])
										tbl32["14"]["ZIndex"] = 2
										tbl32["14"]["TextSize"] = 12
										tbl32["14"].TextXAlignment = Enum.TextXAlignment.Left
										tbl32["14"].FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
										tbl32["14"].TextColor3 = Color3.fromRGB(143, 143, 154)
										tbl32["14"]["BackgroundTransparency"] = 1
										tbl32["14"].Size = UDim2.new(1, -50, 0, 26)
										tbl32["14"]["Text"] = v92.name
										tbl32["14"]["Name"] = "Label"
										tbl32["14"].Position = UDim2.new(0, 43, 0, 0)
										tbl32["14"].TextScaled = true
										local uiTextSizeConstraint = Instance.new("UITextSizeConstraint", tbl32["14"])
										uiTextSizeConstraint.MaxTextSize = 12
										uiTextSizeConstraint.MinTextSize = 7
										tbl32["14"]:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl32["14"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
										tbl32["15"] = Instance.new("TextButton", tbl32["12"])
										tbl32["15"].AutoButtonColor = false
										tbl32["15"].ZIndex = 3
										tbl32["15"]["BackgroundTransparency"] = 1
										tbl32["15"]["Size"] = UDim2.new(1, 0, 1, 0)
										tbl32["15"]["Text"] = ""
										tbl32["15"].Name = "Hit"
										tbl32["15"]:SetAttribute("fadeOriginal_TextTransparency", 0)
										tbl32["15"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)

										if tbl31.CurrentTabs[tbl32.Section] == tbl32 then
											if tbl32.Section == "right" then
												tbl31["33"].Text = v92.name
											else
												tbl31["31"].Text = v92.section_name or "Fallback"
												tbl31["2d"].Text = v92.name
												tbl31["32"].Text = v92.name
											end
										end

										tbl32.ContentContainer = Instance.new("Frame", tbl31["2"])
										tbl32.ContentContainer.BorderSizePixel = 0
										tbl32.ContentContainer.BackgroundColor3 = Color3.fromRGB(14, 15, 20)
										tbl32.ContentContainer.AutomaticSize = Enum.AutomaticSize.Y
										tbl32.ContentContainer.Size = UDim2.new(0, 264, 0, 0)
										tbl32.ContentContainer.Position = UDim2.new(0, tbl32.Section == "right" and 444 or 166, 0, 118)
										tbl32.ContentContainer.Name = v92.name .. "_content"
										tbl32.ContentContainer:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
										tbl32.ContentContainer.Visible = tbl31.CurrentTabs[tbl32.Section] == tbl32
										Instance.new("UICorner", tbl32.ContentContainer).CornerRadius = UDim.new(0, 10)
										Instance.new("UIShadow", tbl32.ContentContainer):SetAttribute("fadeOriginal_Transparency", 0.55)
										local layoutOrder = Enum.SortOrder.LayoutOrder
										Instance.new("UIListLayout", tbl32.ContentContainer).SortOrder = layoutOrder
										tbl32.AllContainers = { { container = tbl32.ContentContainer, section = tbl32.Section } }

										tbl32.Activate = function()
											if not tbl32.Active then
												local tbl33 = {}

												for _, v93 in tbl32.AllContainers, nil, nil do
													tbl33[v93.section] = true
												end

												for k in pairs(tbl33) do
													if tbl31.CurrentTabs[k] ~= nil and tbl31.CurrentTabs[k] ~= tbl32 then
														tbl31.CurrentTabs[k]:Deactivate()
													end
												end

												tbl32.Active = true

												for _, v93 in tbl32.AllContainers, nil, nil do
													tbl31.CurrentTabs[v93.section] = tbl32
													v93.container.Visible = true
												end
											end
										end

										tbl32.Deactivate = function()
											if tbl32.Active then
												tbl32.Active = false
												tbl32.Hover = false

												for _, v93 in tbl32.AllContainers, nil, nil do
													v93.container.Visible = false
												end
											end
										end

										tbl32["15"].MouseEnter:Connect(function()
											tbl32.Hover = true

											if not tbl32.Active then
												if not tbl31.e.Visible then
													tbl31["e"].Visible = true
												end

												tbl32["13"].ImageColor3 = Color3.fromRGB(200, 200, 200)
												tbl32["14"].TextColor3 = Color3.fromRGB(255, 255, 255)
											end
										end)

										tbl32["15"].MouseLeave:Connect(function()
											local v93 = tbl31.CurrentTabs[tbl32.Section]

											if v93 and v93 ~= tbl32 then
												v93.Active = false
												v93["13"].ImageColor3 = Color3.fromRGB(143, 143, 154)
												v93["14"].TextColor3 = Color3.fromRGB(143, 143, 154)
											end

											tbl32.Hover = false

											if not tbl32.Active then
												tbl32["13"].ImageColor3 = Color3.fromRGB(143, 143, 154)
												tbl32["14"].TextColor3 = Color3.fromRGB(143, 143, 154)
											end
										end)

										tbl32["15"].MouseButton1Click:Connect(function()
											local tbl33 = {}

											for _, v93 in tbl32.AllContainers, nil, nil do
												tbl33[v93.section] = true
											end

											for k in pairs(tbl33) do
												local v93 = tbl31.CurrentTabs[k]

												if v93 and v93 ~= tbl32 then
													v93.Active = false

													if v93.AllContainers then
														for _, v94 in v93.AllContainers, nil, nil do
															v94.container.Visible = false
														end
													else
														v93.ContentContainer.Visible = false
													end

													v93["13"].ImageColor3 = Color3.fromRGB(143, 143, 154)
													v93["14"].TextColor3 = Color3.fromRGB(143, 143, 154)
												end
											end

											tbl32.Active = true

											for _, v93 in tbl32.AllContainers, nil, nil do
												v93.container.Visible = true
												tbl31.CurrentTabs[v93.section] = tbl32
											end

											tbl32["13"].ImageColor3 = Color3.fromRGB(255, 255, 255)
											tbl32["14"].TextColor3 = Color3.fromRGB(255, 255, 255)

											if not tbl31.e.Visible then
												tbl31["e"].Visible = true
											end

											if tbl32.Section == "right" then
												tbl31["33"].Text = v92.name
											else
												tbl31["31"].Text = v92.section_name or "Fallback"
												tbl31["2d"].Text = v92.name
												tbl31["32"].Text = v92.name
											end

											local targetScale = tbl31._targetScale or 1

											if targetScale <= 0 then
												targetScale = 1
											end

											local y = tbl32["12"].AbsoluteSize.Y
											local y2 = tbl32["12"].AbsolutePosition.Y
											local y3 = tbl31["5"].AbsolutePosition.Y
											local n41 = (y2 - y3 + (y - tbl31.Indicator.AbsoluteSize.Y) / 2) / targetScale
											service2:Create(tbl31.Indicator, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.new(0, 0, 0, n41) }):Play()
											local e = tbl31.e
											local n42 = (y2 - y3 + (y - e.AbsoluteSize.Y) / 2) / targetScale
											service2:Create(e, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.new(0, 8, 0, n42) }):Play()
										end)

										UserInputService.InputBegan:Connect(function(input, gameProcessed)
											if gameProcessed then
												return
											end

											if input.UserInputType == Enum.UserInputType.MouseButton1 then
												if tbl32.Hover then
													if true then
														tbl32:Activate()
													else
														while true do
														end
													end
												end
											end
										end)

										if tbl31.CurrentTabs[tbl32.Section] == tbl32 then
											tbl32:Activate()
											tbl32["13"].ImageColor3 = Color3.fromRGB(255, 255, 255)
											tbl32["14"].TextColor3 = Color3.fromRGB(255, 255, 255)
										end

										tbl32.Create_Toggle = function(arg3, arg4)
											local activeKeybindToggle = { State = false, flag = arg4.flag, Keybind = nil, WaitingForKey = false }
											activeKeybindToggle["70"] = Instance.new("Frame", arg4.tab and arg4.tab.ContentContainer or tbl32.ContentContainer)
											activeKeybindToggle["70"].BackgroundColor3 = Color3.fromRGB(39, 39, 47)
											activeKeybindToggle["70"].Size = UDim2.new(1, 0, 0, 38)
											activeKeybindToggle["70"]["Name"] = "AutoTotem_enable"
											activeKeybindToggle["70"].LayoutOrder = 0
											activeKeybindToggle["70"].BackgroundTransparency = 1
											activeKeybindToggle["70"]:SetAttribute("staggerBase", UDim2.new(0, 0, 0, 0))
											activeKeybindToggle["70"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											activeKeybindToggle["71"] = Instance.new("TextLabel", activeKeybindToggle["70"])
											activeKeybindToggle["71"].TextSize = 12
											activeKeybindToggle["71"].TextXAlignment = Enum.TextXAlignment.Left
											activeKeybindToggle["71"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
											activeKeybindToggle["71"].TextColor3 = Color3.fromRGB(143, 143, 154)
											activeKeybindToggle["71"].BackgroundTransparency = 1
											activeKeybindToggle["71"]["Size"] = UDim2.new(0, 200, 0, 38)
											activeKeybindToggle["71"].Text = arg4.name
											activeKeybindToggle["71"].Name = "Label"
											activeKeybindToggle["71"].Position = UDim2.new(0, 14, 0, 0)
											activeKeybindToggle["71"]:SetAttribute("fadeOriginal_TextTransparency", 0)
											activeKeybindToggle["71"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											activeKeybindToggle["72"] = Instance.new("Frame", activeKeybindToggle["70"])
											activeKeybindToggle["72"].BorderSizePixel = 0
											activeKeybindToggle["72"].BackgroundColor3 = Color3.fromRGB(22, 23, 31)
											activeKeybindToggle["72"].AnchorPoint = Vector2.new(1, 0.5)
											activeKeybindToggle["72"].AutomaticSize = Enum.AutomaticSize.X
											activeKeybindToggle["72"].Size = UDim2.new(0, 0, 0, 22)
											activeKeybindToggle["72"].Position = UDim2.new(1, -52, 0.5, 0)
											activeKeybindToggle["72"].Name = "KeybindBadge"
											activeKeybindToggle["72"]:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
											activeKeybindToggle["72_c"] = Instance.new("UICorner", activeKeybindToggle["72"])
											activeKeybindToggle["72_c"].CornerRadius = UDim.new(0, 7)
											activeKeybindToggle["72_p"] = Instance.new("UIPadding", activeKeybindToggle["72"])
											activeKeybindToggle["72_p"].PaddingLeft = UDim.new(0, 6)
											activeKeybindToggle["72_p"].PaddingRight = UDim.new(0, 6)
											activeKeybindToggle["72_max"] = Instance.new("UISizeConstraint", activeKeybindToggle["72"])
											activeKeybindToggle["72_max"].MaxSize = Vector2.new(60, 22)
											activeKeybindToggle["72_text"] = Instance.new("TextLabel", activeKeybindToggle["72"])
											activeKeybindToggle["72_text"].TextSize = 12
											activeKeybindToggle["72_text"].FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
											activeKeybindToggle["72_text"].TextColor3 = Color3.fromRGB(138, 138, 148)
											activeKeybindToggle["72_text"].BackgroundTransparency = 1
											activeKeybindToggle["72_text"].Size = UDim2.new(1, 0, 1, 0)
											activeKeybindToggle["72_text"]["Text"] = "···"
											activeKeybindToggle["72_text"].Name = "Text"
											activeKeybindToggle["73"] = Instance.new("TextButton", activeKeybindToggle["70"])
											activeKeybindToggle["73"].AutoButtonColor = false
											activeKeybindToggle["73"]["ZIndex"] = 4
											activeKeybindToggle["73"].BackgroundTransparency = 1
											activeKeybindToggle["73"]["Size"] = UDim2.new(0, 44, 0, 26)
											activeKeybindToggle["73"]["Text"] = ""
											activeKeybindToggle["73"]["Name"] = "Keybind_Hit"
											activeKeybindToggle["73"].Position = UDim2.new(1, -52, 0.5, 0)
											activeKeybindToggle["73"].AnchorPoint = Vector2.new(1, 0.5)
											activeKeybindToggle["73"]:SetAttribute("fadeOriginal_TextTransparency", 0)
											activeKeybindToggle["73"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											activeKeybindToggle["73_c"] = Instance.new("UICorner", activeKeybindToggle["73"])
											activeKeybindToggle["73_c"].CornerRadius = UDim.new(0, 7)
											activeKeybindToggle["73_s"] = Instance.new("UIStroke", activeKeybindToggle["73"])
											activeKeybindToggle["73_s"].Transparency = 1
											activeKeybindToggle["73_s"]["Color"] = Color3.fromRGB(125, 109, 247)
											activeKeybindToggle["74"] = Instance.new("Frame", activeKeybindToggle["70"])
											activeKeybindToggle["74"].BorderSizePixel = 0
											activeKeybindToggle["74"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 47)
											activeKeybindToggle["74"].AnchorPoint = Vector2.new(1, 0.5)
											activeKeybindToggle["74"].Size = UDim2.new(0, 30, 0, 17)
											activeKeybindToggle["74"].Position = UDim2.new(1, -12, 0.5, 0)
											activeKeybindToggle["74"].Name = "Toggle"
											activeKeybindToggle["74"]:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
											activeKeybindToggle["75"] = Instance.new("UICorner", activeKeybindToggle["74"])
											activeKeybindToggle["75"].CornerRadius = UDim.new(1, 0)
											activeKeybindToggle["76"] = Instance.new("Frame", activeKeybindToggle["74"])
											activeKeybindToggle["76"].BorderSizePixel = 0
											activeKeybindToggle["76"].BackgroundColor3 = Color3.fromRGB(64, 64, 76)
											activeKeybindToggle["76"].Size = UDim2.new(0, 13, 0, 13)
											activeKeybindToggle["76"].Position = UDim2.new(0, 2, 0, 2)
											activeKeybindToggle["76"].Name = "Knob"
											activeKeybindToggle["76"]:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
											activeKeybindToggle["77"] = Instance.new("UICorner", activeKeybindToggle["76"])
											activeKeybindToggle["77"].CornerRadius = UDim.new(1, 0)
											activeKeybindToggle["78"] = Instance.new("UIShadow", activeKeybindToggle["76"])
											activeKeybindToggle["78"]:SetAttribute("fadeOriginal_Transparency", 0.75)
											activeKeybindToggle["79"] = Instance.new("TextButton", activeKeybindToggle["70"])
											activeKeybindToggle["79"].AutoButtonColor = false
											activeKeybindToggle["79"].ZIndex = 2
											activeKeybindToggle["79"].BackgroundTransparency = 1
											activeKeybindToggle["79"].Size = UDim2.new(1, 0, 1, 0)
											activeKeybindToggle["79"]["Text"] = ""
											activeKeybindToggle["79"]["Name"] = "Hit"
											activeKeybindToggle["79"]:SetAttribute("fadeOriginal_TextTransparency", 0)
											activeKeybindToggle["79"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)

											if tbl17.Flags[activeKeybindToggle.flag] then
												service2:Create(activeKeybindToggle["74"], TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(125, 109, 247) }):Play()

												service2:Create(activeKeybindToggle["76"], TweenInfo.new(0.2), {
													Position = UDim2.new(0, 15, 0, 2),
													BackgroundColor3 = Color3.fromRGB(255, 255, 255),
												}):Play()
											else
												service2:Create(activeKeybindToggle["74"], TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(37, 37, 47) }):Play()
												service2:Create(activeKeybindToggle["76"], TweenInfo.new(0.2), { Position = UDim2.new(0, 2, 0, 2), BackgroundColor3 = Color3.fromRGB(64, 64, 76) }):Play()
											end

											activeKeybindToggle.Toggle = function(arg5, arg6)
												if tbl17.Flags[arg5.flag] == nil then
													tbl17.Flags[arg5.flag] = false
												end

												if arg6 == nil then
													tbl17.Flags[arg5.flag] = not tbl17.Flags[arg5.flag]
												elseif true then
													tbl17.Flags[arg5.flag] = arg6
												else
													while true do
													end
												end

												if arg5._activeTweens then
													for _, v93 in arg5._activeTweens, nil, nil do
														v93:Cancel()
													end
												end

												arg5._activeTweens = {}
												local n74 = activeKeybindToggle["74"]
												local n76 = activeKeybindToggle["76"]
												if not n74 or not n76 then
													return
												end

												if tbl17.Flags[arg5.flag] then
													local tween = service2:Create(n74, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(125, 109, 247) })
													local tween2 = service2:Create(n76, TweenInfo.new(0.2), { Position = UDim2.new(0, 15, 0, 2), BackgroundColor3 = Color3.fromRGB(255, 255, 255) })
													tween:Play()
													tween2:Play()
													table.insert(arg5._activeTweens, tween)
													table.insert(arg5._activeTweens, tween2)
												else
													local tween = service2:Create(n74, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(37, 37, 47) })
													local tween2 = service2:Create(n76, TweenInfo.new(0.2), { Position = UDim2.new(0, 2, 0, 2), BackgroundColor3 = Color3.fromRGB(64, 64, 76) })
													tween:Play()
													tween2:Play()
													table.insert(arg5._activeTweens, tween)
													table.insert(arg5._activeTweens, tween2)
												end

												if not tbl31.ApplyingPreset then
													pcall(tbl17.save_flags)
												end

												if arg4.callback then
													arg4.callback(tbl17.Flags[arg5.flag])
												end
											end

											if tbl17.Flags[activeKeybindToggle.flag] == nil then
												tbl17.Flags[activeKeybindToggle.flag] = false
											end

											activeKeybindToggle:Toggle(tbl17.Flags[activeKeybindToggle.flag])

											activeKeybindToggle["79"].MouseButton1Click:Connect(function()
												activeKeybindToggle:Toggle()
											end)

											activeKeybindToggle["73"].MouseButton1Click:Connect(function()
												if tbl31.kpw then
													local kpw = tbl31.kpw

													if not kpw.Visible then
														tbl31.ActiveKeybindToggle = activeKeybindToggle
														tbl31.WaitingForKey = false
														kpw.Size = UDim2.new(0, 0, 0, 0)
														kpw.Visible = true
														local absolutePosition = activeKeybindToggle["70"].AbsolutePosition
														local absolutePosition2 = tbl31["1"].AbsolutePosition
														local absoluteSize = activeKeybindToggle["70"].AbsoluteSize
														kpw.Position = UDim2.new(0, absolutePosition.X - absolutePosition2.X + absoluteSize.X - 52 - 20 - 5 - 150, 0, absolutePosition.Y - absolutePosition2.Y + (absoluteSize.Y - 76) / 2)

														if activeKeybindToggle.Keybind then
															tbl31.kpw_nbf_p.Text = activeKeybindToggle.KeybindName or "New bind"
															tbl31["kpw_nbf_p"].TextColor3 = Color3.fromRGB(243, 243, 247)
															service2:Create(tbl31.kpw_nbf_s, TweenInfo.new(0.2), { Transparency = 0 }):Play()
														else
															tbl31.kpw_nbf_p.Text = "New bind"
															tbl31["kpw_nbf_p"].TextColor3 = Color3.fromRGB(138, 138, 148)
															service2:Create(tbl31.kpw_nbf_s, TweenInfo.new(0.2), { Transparency = 1 }):Play()
														end

														if (activeKeybindToggle.KeybindMode or "toggle") == "toggle" then
															tbl31.kpw_ms.Position = UDim2.new(0, 8, 0, 42)
															tbl31["kpw_tl"].TextColor3 = Color3.fromRGB(34, 29, 72)
															tbl31.kpw_hl.TextColor3 = Color3.fromRGB(244, 244, 248)
														else
															tbl31.kpw_ms.Position = UDim2.new(0, 77, 0, 42)
															tbl31["kpw_tl"].TextColor3 = Color3.fromRGB(244, 244, 248)
															tbl31["kpw_hl"].TextColor3 = Color3.fromRGB(34, 29, 72)
														end

														service2:Create(kpw, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.new(0, 150, 0, 76) }):Play()
													else
														tbl31.WaitingForKey = false
														service2:Create(tbl31.kpw_nbf_s, TweenInfo.new(0.2), { Transparency = 1 }):Play()
														local tween = service2:Create(kpw, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.new(0, 0, 0, 0) })

														tween.Completed:Once(function()
															kpw.Visible = false
														end)

														tween:Play()
													end
												end
											end)

											activeKeybindToggle["73"].MouseButton2Click:Connect(function()
												if activeKeybindToggle.Keybind then
													activeKeybindToggle.Keybind = nil
													activeKeybindToggle.KeybindName = nil
													tbl17.Keybinds[activeKeybindToggle] = nil

													if activeKeybindToggle.flag then
														tbl17.Flags[activeKeybindToggle.flag .. "_keybind"] = nil
														tbl17.save_flags()
													end

													if activeKeybindToggle["72_text"] then
														activeKeybindToggle["72_text"].Text = "···"
														activeKeybindToggle["72_text"].TextColor3 = Color3.fromRGB(138, 138, 148)
													end

													if activeKeybindToggle["73_s"] then
														local tbl33 = { Transparency = 1 }
														service2:Create(activeKeybindToggle["73_s"], TweenInfo.new(0.2), tbl33):Play()
													end
												end
											end)

											if activeKeybindToggle.flag and tbl17.Flags[activeKeybindToggle.flag .. "_keybind"] then
												local v93 = tbl17.Flags[activeKeybindToggle.flag .. "_keybind"]
												local v94

												if v93.keyType == "KeyCode" then
													v94 = Enum.KeyCode[v93.keyName]
												else
													v94 = nil

													if v93.keyType == "UserInputType" then
														v94 = Enum.UserInputType[v93.keyName]
													end
												end

												if v94 then
													activeKeybindToggle.Keybind = v94
													activeKeybindToggle.KeybindName = v93.displayName or v94.Name
													activeKeybindToggle.KeybindMode = v93.mode or "toggle"
													tbl17.Keybinds[activeKeybindToggle] = { key = v94, mode = activeKeybindToggle.KeybindMode, flag = activeKeybindToggle.flag }

													if activeKeybindToggle["72_text"] then
														activeKeybindToggle["72_text"].Text = activeKeybindToggle.KeybindName
														activeKeybindToggle["72_text"].TextColor3 = Color3.fromRGB(125, 109, 247)
													end

													if activeKeybindToggle["73_s"] then
														activeKeybindToggle["73_s"].Transparency = 0
													end
												end
											end

											if activeKeybindToggle.flag then
												table.insert(tbl31.Widgets, function()
													pcall(function()
														activeKeybindToggle:Toggle(tbl17.Flags[activeKeybindToggle.flag] == true)
													end)
												end)
											end

											return activeKeybindToggle
										end

										tbl32.Create_Slider = function(arg3, arg4)
											local v93 = tbl17:validate({ name = "Slider", min = 0, max = 100, default = 50, callback = nil, tab = nil, flag = nil }, arg4 or {})
											local tbl33 = { MouseDown = false, Hover = false, Connection = nil, flag = v93.flag }
											tbl33["6c"] = Instance.new("Frame", v93.tab and v93.tab.ContentContainer or tbl32.ContentContainer)
											tbl33["6c"]["BorderSizePixel"] = 0
											tbl33["6c"].BackgroundColor3 = Color3.fromRGB(14, 15, 20)
											tbl33["6c"].AutomaticSize = Enum.AutomaticSize.Y
											tbl33["6c"]["Size"] = UDim2.new(0, 264, 0, 0)
											tbl33["6c"]["Position"] = UDim2.new(0, 0, 0, 0)
											tbl33["6c"]["Name"] = "AutoTotem_main"
											tbl33["6c"]:SetAttribute("pageToken", 22)
											tbl33["6c"]:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
											tbl33["6d"] = Instance.new("UICorner", tbl33["6c"])
											tbl33["6d"].CornerRadius = UDim.new(0, 10)
											tbl33["6e"] = Instance.new("UIShadow", tbl33["6c"])
											tbl33["6e"]:SetAttribute("fadeOriginal_Transparency", 0.55)
											tbl33["6f"] = Instance.new("UIListLayout", tbl33["6c"])
											tbl33["6f"].SortOrder = Enum.SortOrder.LayoutOrder
											tbl33["7a"] = Instance.new("Frame", tbl33["6c"])
											tbl33["7a"].BorderSizePixel = 0
											tbl33["7a"]["BackgroundColor3"] = Color3.fromRGB(39, 39, 47)
											tbl33["7a"].Size = UDim2.new(1, 0, 0, 1)
											tbl33["7a"].Name = "Divider_3"
											tbl33["7a"].LayoutOrder = 3
											tbl33["7a"].BackgroundTransparency = 0.25
											tbl33["7a"]:SetAttribute("staggerBase", UDim2.new(0, 0, 0, 0))
											tbl33["7a"]:SetAttribute("fadeOriginal_BackgroundTransparency", 0.25)
											tbl33["7b"] = Instance.new("Frame", tbl33["6c"])
											tbl33["7b"].Size = UDim2.new(1, 0, 0, 38)
											tbl33["7b"].Name = "AutoTotem_health"
											tbl33["7b"].LayoutOrder = 4
											tbl33["7b"].BackgroundTransparency = 1
											tbl33["7b"]:SetAttribute("staggerBase", UDim2.new(0, 0, 0, 0))
											tbl33["7b"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											tbl33["7c"] = Instance.new("TextLabel", tbl33["7b"])
											tbl33["7c"].TextSize = 12
											tbl33["7c"].TextXAlignment = Enum.TextXAlignment.Left
											tbl33["7c"].FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
											tbl33["7c"]["TextColor3"] = Color3.fromRGB(143, 143, 154)
											tbl33["7c"].BackgroundTransparency = 1
											tbl33["7c"].Size = UDim2.new(0, 200, 0, 38)
											tbl33["7c"].Text = v93.name
											tbl33["7c"]["Name"] = "Label"
											tbl33["7c"].Position = UDim2.new(0, 14, 0, 0)
											tbl33["7c"]:SetAttribute("fadeOriginal_TextTransparency", 0)
											tbl33["7c"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											tbl33["7d"] = Instance.new("TextLabel", tbl33["7b"])
											tbl33["7d"].TextSize = 12
											tbl33["7d"].TextXAlignment = Enum.TextXAlignment.Right
											tbl33["7d"]["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
											tbl33["7d"]["TextColor3"] = Color3.fromRGB(243, 243, 247)
											tbl33["7d"]["BackgroundTransparency"] = 1
											tbl33["7d"].AnchorPoint = Vector2.new(1, 0.5)
											tbl33["7d"]["Size"] = UDim2.new(0, 49, 0, 38)
											tbl33["7d"].Text = tostring((v93.default or 100) .. "%")
											tbl33["7d"].Name = "Value"
											tbl33["7d"].Position = UDim2.new(1, -95, 0.5, 0)
											tbl33["7d"]:SetAttribute("fadeOriginal_TextTransparency", 0)
											tbl33["7d"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											tbl33["7e"] = Instance.new("Frame", tbl33["7b"])
											tbl33["7e"]["BorderSizePixel"] = 0
											tbl33["7e"].BackgroundColor3 = Color3.fromRGB(53, 53, 63)
											tbl33["7e"].AnchorPoint = Vector2.new(1, 0.5)
											tbl33["7e"].Size = UDim2.new(0, 75, 0, 4)
											tbl33["7e"].Position = UDim2.new(1, -12, 0.5, 0)
											tbl33["7e"]["Name"] = "Slider"
											tbl33["7e"]:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
											tbl33["7f"] = Instance.new("UICorner", tbl33["7e"])
											tbl33["7f"].CornerRadius = UDim.new(0, 2)
											tbl33["80"] = Instance.new("Frame", tbl33["7e"])
											tbl33["80"].BorderSizePixel = 0
											tbl33["80"].BackgroundColor3 = Color3.fromRGB(125, 109, 247)
											local n41 = ((v93.default or 100) - (v93.min or 0)) / ((v93.max or 100) - (v93.min or 0))
											tbl33["80"].Size = UDim2.fromScale(n41, 1)
											tbl33["80"].Name = "Fill"
											tbl33["80"]:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
											tbl33["81"] = Instance.new("UICorner", tbl33["80"])
											tbl33["81"].CornerRadius = UDim.new(0, 2)
											tbl33["82"] = Instance.new("Frame", tbl33["7e"])
											tbl33["82"].BorderSizePixel = 0
											tbl33["82"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
											tbl33["82"].AnchorPoint = Vector2.new(0.5, 0.5)
											tbl33["82"]["Size"] = UDim2.new(0, 10, 0, 10)
											tbl33["82"].Position = UDim2.new(n41, 0, 0.5, 0)
											tbl33["82"]["Name"] = "Knob"
											tbl33["82"]:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
											tbl33["83"] = Instance.new("UICorner", tbl33["82"])
											tbl33["83"].CornerRadius = UDim.new(1, 0)
											tbl33["84"] = Instance.new("UIStroke", tbl33["82"])
											tbl33["84"].Thickness = 2
											tbl33["84"].Color = Color3.fromRGB(31, 31, 39)
											tbl33["84"]:SetAttribute("fadeOriginal_Transparency", 0)
											tbl33["85"] = Instance.new("TextButton", tbl33["7b"])
											tbl33["85"].AutoButtonColor = false
											tbl33["85"].ZIndex = 3
											tbl33["85"].BackgroundTransparency = 1
											tbl33["85"].Size = UDim2.new(0, 91, 0, 26)
											tbl33["85"]["Text"] = ""
											tbl33["85"].Name = "Hit"
											tbl33["85"].Position = UDim2.new(1, -95, 0.5, -13)
											tbl33["85"]:SetAttribute("fadeOriginal_TextTransparency", 0)
											tbl33["85"]:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											tbl33["86"] = Instance.new("Frame", tbl33["6c"])
											tbl33["86"].BorderSizePixel = 0
											tbl33["86"].BackgroundColor3 = Color3.fromRGB(39, 39, 47)
											tbl33["86"]["Size"] = UDim2.new(1, 0, 0, 1)
											tbl33["86"].Name = "Divider_5"
											tbl33["86"].LayoutOrder = 5
											tbl33["86"].BackgroundTransparency = 0.25
											tbl33["86"]:SetAttribute("staggerBase", UDim2.new(0, 0, 0, 0))
											tbl33["86"]:SetAttribute("fadeOriginal_BackgroundTransparency", 0.25)

											tbl33.SetValue = function(arg5, arg6, arg7)
												if arg6 == nil then
													local n42 = math.clamp(((arg7 or UserInputService:GetMouseLocation()).X - tbl33["7e"].AbsolutePosition.X) / tbl33["7e"].AbsoluteSize.X, 0, 1)
													local v94 = math.round((v93.max - v93.min) * n42 + v93.min)
													tbl33["7d"].Text = tostring(v94) .. "%"
													tbl33["82"].Position = UDim2.new(n42, 0, 0.5, 0)
													tbl33["80"].Size = UDim2.fromScale(n42, 1)
												else
													tbl33["7d"].Text = tostring(arg6) .. "%"
													local n42 = (arg6 - v93.min) / (v93.max - v93.min)
													tbl33["80"].Size = UDim2.fromScale(n42, 1)
													tbl33["82"].Position = UDim2.new(n42, 0, 0.5, 0)
												end

												if tbl33.flag then
													tbl17.Flags[tbl33.flag] = tbl33:GetValue()

													if not tbl31.ApplyingPreset then
														tbl17.save_flags()
													end
												end

												if v93.callback then
													v93.callback(tbl33:GetValue())
												end
											end

											tbl33.GetValue = function()
												return (tonumber(tbl33["7d"].Text:match("%-?%d+")))
											end

											tbl33["85"].MouseEnter:Connect(function()
												if true then
													tbl33.Hover = true
												else
													while true do
													end
												end
											end)

											tbl33["85"].MouseLeave:Connect(function()
												tbl33.Hover = false
											end)

											local flag25 = false

											tbl33["85"].MouseButton1Down:Connect(function()
												flag25 = true
												tbl33:SetValue(nil, UserInputService:GetMouseLocation())
											end)

											UserInputService.InputChanged:Connect(function(input)
												if flag25 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
													tbl33:SetValue(nil, input.Position)
												end
											end)

											UserInputService.InputEnded:Connect(function(input)
												if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
													flag25 = false
												end
											end)

											if tbl33.flag then
												if tbl17.Flags[tbl33.flag] ~= nil then
													tbl33:SetValue(tbl17.Flags[tbl33.flag])
												else
													tbl17.Flags[tbl33.flag] = v93.default or 50
												end
											end

											if tbl33.flag then
												table.insert(tbl31.Widgets, function()
													if tbl17.Flags[tbl33.flag] ~= nil then
														tbl33:SetValue(tbl17.Flags[tbl33.flag])
													end
												end)
											end

											return tbl33
										end

										tbl32.Create_Dropdown = function(arg3, arg4)
											local v93 = tbl17:validate({
												name = "Dropdown",
												options = { "Option 1", "Option 2", "Option 3" },
												default = nil,
												callback = nil,
												flag = nil,
												tab = nil,
											}, arg4 or {})

											local currentDropdown = {
												Selected = v93.flag and tbl17.Flags[v93.flag] or v93.default or v93.options[1],
												flag = v93.flag,
												Open = false,
											}

											currentDropdown.d70 = Instance.new("Frame", v93.tab and v93.tab.ContentContainer or tbl32.ContentContainer)
											currentDropdown.d70["BackgroundColor3"] = Color3.fromRGB(39, 39, 47)
											currentDropdown.d70.Size = UDim2.new(1, 0, 0, 38)
											currentDropdown.d70.Name = v93.name .. "_dropdown"
											currentDropdown.d70.LayoutOrder = 0
											currentDropdown.d70.BackgroundTransparency = 1
											currentDropdown.d70:SetAttribute("staggerBase", UDim2.new(0, 0, 0, 0))
											currentDropdown.d70:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											currentDropdown.d71 = Instance.new("TextLabel", currentDropdown.d70)
											currentDropdown.d71.TextSize = 12
											currentDropdown.d71.TextXAlignment = Enum.TextXAlignment.Left
											currentDropdown.d71["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
											currentDropdown.d71["TextColor3"] = Color3.fromRGB(143, 143, 154)
											currentDropdown.d71.BackgroundTransparency = 1
											currentDropdown.d71["Size"] = UDim2.new(0, 120, 0, 38)
											currentDropdown.d71["Text"] = v93.name
											currentDropdown.d71.Name = "Label"
											currentDropdown.d71.Position = UDim2.new(0, 14, 0, 0)
											currentDropdown.d71:SetAttribute("fadeOriginal_TextTransparency", 0)
											currentDropdown.d71:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											currentDropdown.d72 = Instance.new("Frame", currentDropdown.d70)
											currentDropdown.d72["BorderSizePixel"] = 0
											currentDropdown.d72["BackgroundColor3"] = Color3.fromRGB(39, 39, 47)
											currentDropdown.d72.AnchorPoint = Vector2.new(1, 0.5)
											currentDropdown.d72.Size = UDim2.new(0, 80, 0, 22)
											currentDropdown.d72.Position = UDim2.new(1, -12, 0.5, 0)
											currentDropdown.d72["Name"] = "DropdownButton"
											currentDropdown.d72:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
											currentDropdown.d72_c = Instance.new("UICorner", currentDropdown.d72)
											currentDropdown.d72_c.CornerRadius = UDim.new(0, 6)
											currentDropdown.d72_sh = Instance.new("UIShadow", currentDropdown.d72)
											currentDropdown.d72_sh:SetAttribute("fadeOriginal_Transparency", 0.55)
											currentDropdown.d73 = Instance.new("TextLabel", currentDropdown.d72)
											currentDropdown.d73.TextSize = 11
											currentDropdown.d73["TextXAlignment"] = Enum.TextXAlignment.Left
											currentDropdown.d73.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
											currentDropdown.d73.TextColor3 = Color3.fromRGB(243, 243, 247)
											currentDropdown.d73.BackgroundTransparency = 1
											currentDropdown.d73.Size = UDim2.new(1, -26, 1, 0)
											currentDropdown.d73.Text = currentDropdown.Selected
											currentDropdown.d73.Name = "Value"
											currentDropdown.d73.Position = UDim2.new(0, 8, 0, 0)
											currentDropdown.d73.TextTruncate = Enum.TextTruncate.AtEnd
											currentDropdown.d73:SetAttribute("fadeOriginal_TextTransparency", 0)
											currentDropdown.d73:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											currentDropdown.d74 = Instance.new("ImageLabel", currentDropdown.d72)
											currentDropdown.d74.BorderSizePixel = 0
											currentDropdown.d74["ScaleType"] = Enum.ScaleType.Fit
											currentDropdown.d74.Image = "rbxassetid://10709790948"
											currentDropdown.d74.ImageColor3 = Color3.fromRGB(143, 143, 154)
											currentDropdown.d74.Size = UDim2.new(0, 10, 0, 10)
											currentDropdown.d74.BackgroundTransparency = 1
											currentDropdown.d74.Name = "IMG_Caret"
											currentDropdown.d74.Position = UDim2.new(1, -15, 0, 6)
											currentDropdown.d74:SetAttribute("fadeOriginal_ImageTransparency", 0)
											currentDropdown.d74:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											currentDropdown.d72_s = Instance.new("UIStroke", currentDropdown.d72)
											currentDropdown.d72_s.Transparency = 1
											currentDropdown.d72_s.Color = Color3.fromRGB(70, 70, 86)
											currentDropdown.d72_s:SetAttribute("fadeOriginal_Transparency", 1)
											currentDropdown.d75 = Instance.new("TextButton", currentDropdown.d72)
											currentDropdown.d75.AutoButtonColor = false
											currentDropdown.d75.ZIndex = 3
											currentDropdown.d75.BackgroundTransparency = 1
											currentDropdown.d75["Size"] = UDim2.new(1, 0, 1, 0)
											currentDropdown.d75.Text = ""
											currentDropdown.d75.Name = "Hit"
											currentDropdown.d75:SetAttribute("fadeOriginal_TextTransparency", 0)
											currentDropdown.d75:SetAttribute("fadeOriginal_BackgroundTransparency", 1)

											currentDropdown.d73:GetPropertyChangedSignal("TextBounds"):Connect(function()
												local n41 = math.clamp(math.ceil(currentDropdown.d73.TextBounds.X) + 34, 58, 150)
												service2:Create(currentDropdown.d72, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.new(0, n41, 0, 22) }):Play()
											end)

											if not tbl31.DropdownPopup then
												tbl31.DropdownPopup = Instance.new("Frame", tbl31["1"])
												tbl31.DropdownPopup.BorderSizePixel = 0
												tbl31.DropdownPopup.BackgroundColor3 = Color3.fromRGB(14, 15, 20)
												tbl31.DropdownPopup.ClipsDescendants = true
												tbl31.DropdownPopup.ZIndex = 52
												tbl31.DropdownPopup.Size = UDim2.new(0, 139, 0, 0)
												tbl31.DropdownPopup.Position = UDim2.new(0, 500, 0, 200)
												tbl31.DropdownPopup.Name = "dropdown_popup"
												tbl31.DropdownPopup.Visible = false
												tbl31.DropdownPopup:SetAttribute("fadeIsolated", true)
												Instance.new("UICorner", tbl31.DropdownPopup).CornerRadius = UDim.new(0, 10)
												local uiStroke = Instance.new("UIStroke", tbl31.DropdownPopup)
												uiStroke.Transparency = 0.4
												uiStroke.Color = Color3.fromRGB(47, 47, 58)
												Instance.new("UIShadow", tbl31.DropdownPopup):SetAttribute("fadeOriginal_Transparency", 0.55)

												tbl31.DropdownPopupData = {
													window = tbl31.DropdownPopup,
													currentAnchor = nil,
													currentCallback = nil,
													currentDropdown = nil,
												}

												tbl31.closeDropdownPopup = function()
													local dropdownPopupData = tbl31.DropdownPopupData

													if dropdownPopupData.currentDropdown then
														dropdownPopupData.currentDropdown.Open = false
														service2:Create(dropdownPopupData.currentDropdown.d74, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Rotation = 0 }):Play()
													end

													dropdownPopupData.currentAnchor = nil
													dropdownPopupData.currentCallback = nil
													dropdownPopupData.currentDropdown = nil
													local dropdownPopup = tbl31.DropdownPopup
													local tween = service2:Create(dropdownPopup, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.new(0, dropdownPopup.AbsoluteSize.X, 0, 0) })

													tween.Completed:Once(function()
														dropdownPopup.Visible = false
													end)

													tween:Play()
												end

												UserInputService.InputBegan:Connect(function(input)
													if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
														if tbl31.DropdownPopup.Visible and tbl31.DropdownPopupData.currentAnchor then
															local position = input.Position
															local absolutePosition = tbl31.DropdownPopup.AbsolutePosition
															local absoluteSize = tbl31.DropdownPopup.AbsoluteSize
															local absolutePosition2 = tbl31.DropdownPopupData.currentAnchor.AbsolutePosition
															local absoluteSize2 = tbl31.DropdownPopupData.currentAnchor.AbsoluteSize

															if not (position.X >= absolutePosition.X and position.X <= absolutePosition.X + absoluteSize.X and position.Y >= absolutePosition.Y and position.Y <= absolutePosition.Y + absoluteSize.Y) and not (position.X >= absolutePosition2.X - 4 and position.X <= absolutePosition2.X + absoluteSize2.X + 4 and position.Y >= absolutePosition2.Y - 4 and position.Y <= absolutePosition2.Y + absoluteSize2.Y + 4) then
																tbl31.closeDropdownPopup()
															end
														end
													end
												end)
											end

											local function fn33()
												local dropdownPopup = tbl31.DropdownPopup
												local d72 = currentDropdown.d72
												if dropdownPopup.Visible and tbl31.DropdownPopupData.currentAnchor == d72 then
													tbl31.closeDropdownPopup()
													return
												end

												if dropdownPopup.Visible then
													dropdownPopup.Visible = false

													if tbl31.DropdownPopupData.currentDropdown then
														tbl31.DropdownPopupData.currentDropdown.Open = false
														tbl31.DropdownPopupData.currentDropdown.d74.Rotation = 0
													end
												end

												currentDropdown.Open = true
												tbl31.DropdownPopupData.currentAnchor = d72

												tbl31.DropdownPopupData.currentCallback = function(selected)
													currentDropdown.Selected = selected
													currentDropdown.d73.Text = selected

													if currentDropdown.flag then
														tbl17.Flags[currentDropdown.flag] = selected
														tbl17.save_flags()
													end

													if v93.callback then
														v93.callback(selected)
													end
												end

												tbl31.DropdownPopupData.currentDropdown = currentDropdown
												service2:Create(currentDropdown.d74, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Rotation = 180 }):Play()

												for _, v94 in dropdownPopup:GetChildren() do
													if v94:IsA("Frame") or v94:IsA("TextButton") then
														v94:Destroy()
													end
												end

												local n41 = 139

												for _, v94 in v93.options, nil, nil do
													n41 = math.max(n41, #v94 * 7 + 54)
												end

												local n42 = math.min(n41, 240)
												local tbl33 = {}

												for k, v94 in v93.options, nil, nil do
													local flag25 = v94 == currentDropdown.Selected
													local frame = Instance.new("Frame", dropdownPopup)
													frame.Name = "Option_" .. v94
													frame.BackgroundColor3 = Color3.fromRGB(39, 39, 47)
													frame.BackgroundTransparency = flag25 and 0 or 1
													frame.BorderSizePixel = 0
													frame.Position = UDim2.new(0, 5, 0, 6 + (k - 1) * 26)
													frame.Size = UDim2.new(0, n42 - 10, 0, 26)
													frame.ZIndex = 53
													Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

													if flag25 then
														local imageLabel = Instance.new("ImageLabel", frame)
														imageLabel.Name = "IMG_Check"
														imageLabel.AnchorPoint = Vector2.new(0, 0.5)
														imageLabel.BackgroundTransparency = 1
														imageLabel.Position = UDim2.new(0, 9, 0.5, 0)
														imageLabel.Size = UDim2.new(0, 12, 0, 12)
														imageLabel.ZIndex = 53
														imageLabel.Image = "rbxassetid://86817768619372"
														imageLabel.ImageColor3 = Color3.fromRGB(246, 246, 250)
														imageLabel.ScaleType = Enum.ScaleType.Fit
														imageLabel.ImageTransparency = 1
													end

													local textLabel = Instance.new("TextLabel", frame)
													textLabel.Name = "Label"
													textLabel.BackgroundTransparency = 1
													textLabel.Position = UDim2.new(0, 30, 0, 0)
													textLabel.Size = UDim2.new(0, n42 - 46, 0, 26)
													textLabel.ZIndex = 53
													textLabel.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", flag25 and Enum.FontWeight.SemiBold or Enum.FontWeight.Medium, Enum.FontStyle.Normal)
													textLabel.Text = v94
													textLabel.TextColor3 = flag25 and Color3.fromRGB(246, 246, 250) or Color3.fromRGB(132, 132, 143)
													textLabel.TextSize = 12
													textLabel.TextXAlignment = Enum.TextXAlignment.Left
													textLabel.TextTransparency = 1
													local textButton = Instance.new("TextButton", frame)
													textButton.AutoButtonColor = false
													textButton.ZIndex = 54
													textButton.BackgroundTransparency = 1
													textButton.Size = UDim2.new(1, 0, 1, 0)
													textButton.Text = ""

													if not flag25 then
														textButton.MouseEnter:Connect(function()
															service2:Create(frame, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundTransparency = 0.6 }):Play()
														end)

														textButton.MouseLeave:Connect(function()
															service2:Create(frame, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundTransparency = 1 }):Play()
														end)
													end

													textButton.MouseButton1Click:Connect(function()
														local currentCallback = tbl31.DropdownPopupData.currentCallback
														tbl31.closeDropdownPopup()

														if currentCallback then
															currentCallback(v94)
														end
													end)

													table.insert(tbl33, { row = frame, label = textLabel, selected = flag25 })
												end

												local absolutePosition = d72.AbsolutePosition
												local absolutePosition2 = tbl31["1"].AbsolutePosition
												local absoluteSize = d72.AbsoluteSize
												local n43 = 12 + #v93.options * 26
												dropdownPopup.Position = UDim2.new(0, absolutePosition.X - absolutePosition2.X + absoluteSize.X - n42, 0, absolutePosition.Y - absolutePosition2.Y + absoluteSize.Y + 4)
												dropdownPopup.Size = UDim2.new(0, n42, 0, math.floor(n43 * 0.72))
												dropdownPopup.Visible = true
												service2:Create(dropdownPopup, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.new(0, n42, 0, n43) }):Play()

												for k, v94 in tbl33, nil, nil do
													task.delay(k * 0.025, function()
														local tbl34 = { TextTransparency = 0 }
														service2:Create(v94.label, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), tbl34):Play()

														if v94.selected then
															local imgCheck = v94.row:FindFirstChild("IMG_Check")

															if imgCheck then
																service2:Create(imgCheck, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { ImageTransparency = 0 }):Play()
															end
														end
													end)
												end
											end

											currentDropdown.d75.MouseEnter:Connect(function()
												service2:Create(currentDropdown.d72_s, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Transparency = 0.35 }):Play()
											end)

											currentDropdown.d75.MouseLeave:Connect(function()
												service2:Create(currentDropdown.d72_s, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Transparency = 1 }):Play()
											end)

											currentDropdown.d75.MouseButton1Click:Connect(function()
												fn33()
											end)

											if currentDropdown.flag then
												tbl17.Flags[currentDropdown.flag] = currentDropdown.Selected
											end

											currentDropdown.SetValue = function(arg5, selected)
												currentDropdown.Selected = selected
												currentDropdown.d73.Text = selected

												if currentDropdown.flag then
													tbl17.Flags[currentDropdown.flag] = selected
												end

												if v93.callback then
													v93.callback(selected)
												end
											end

											currentDropdown.GetValue = function()
												return currentDropdown.Selected
											end

											if currentDropdown.flag then
												table.insert(tbl31.Widgets, function()
													if tbl17.Flags[currentDropdown.flag] ~= nil then
														currentDropdown:SetValue(tbl17.Flags[currentDropdown.flag])
													end
												end)
											end

											return currentDropdown
										end

										tbl32.Create_ColorPicker = function(arg3, arg4)
											local v93 = tbl17:validate({
												name = "ColorPicker",
												default = Color3.fromRGB(255, 255, 255),
												callback = nil,
												flag = nil,
												tab = nil,
											}, arg4 or {})

											local function fn33()
												if v93.flag and tbl17.Flags[v93.flag] then
													local v94 = tbl17.Flags[v93.flag]
													if typeof(v94) == "table" then
														return Color3.new(v94.R or 1, v94.G or 1, v94.B or 1)
													end

													if typeof(v94) == "Color3" then
														return v94
													end
												end

												return v93.default or Color3.fromRGB(255, 255, 255)
											end

											local tbl33 = { Color = fn33(), flag = v93.flag }
											tbl33.cp0 = Instance.new("Frame", v93.tab and v93.tab.ContentContainer or tbl32.ContentContainer)
											tbl33.cp0["BackgroundColor3"] = Color3.fromRGB(39, 39, 47)
											tbl33.cp0.Size = UDim2.new(1, 0, 0, 38)
											tbl33.cp0.Name = v93.name .. "_colorpicker"
											tbl33.cp0.LayoutOrder = 0
											tbl33.cp0.BackgroundTransparency = 1
											tbl33.cp0:SetAttribute("staggerBase", UDim2.new(0, 0, 0, 0))
											tbl33.cp0:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											tbl33.cp1 = Instance.new("TextLabel", tbl33.cp0)
											tbl33.cp1["TextSize"] = 12
											tbl33.cp1.TextXAlignment = Enum.TextXAlignment.Left
											tbl33.cp1.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
											tbl33.cp1.TextColor3 = Color3.fromRGB(143, 143, 154)
											tbl33.cp1["BackgroundTransparency"] = 1
											tbl33.cp1.Size = UDim2.new(0, 120, 0, 38)
											tbl33.cp1.Text = v93.name
											tbl33.cp1["Name"] = "Label"
											tbl33.cp1.Position = UDim2.new(0, 14, 0, 0)
											tbl33.cp1:SetAttribute("fadeOriginal_TextTransparency", 0)
											tbl33.cp1:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											tbl33.cp2 = Instance.new("Frame", tbl33.cp0)
											tbl33.cp2["BorderSizePixel"] = 0
											tbl33.cp2.BackgroundColor3 = tbl33.Color
											tbl33.cp2.AnchorPoint = Vector2.new(1, 0.5)
											tbl33.cp2.Size = UDim2.new(0, 16, 0, 16)
											tbl33.cp2.Position = UDim2.new(1, -12, 0.5, 0)
											tbl33.cp2.Name = "ColorSwatch"
											tbl33.cp2:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
											Instance.new("UICorner", tbl33.cp2).CornerRadius = UDim.new(0, 4)
											tbl33.cp3 = Instance.new("TextButton", tbl33.cp0)
											tbl33.cp3.AutoButtonColor = false
											tbl33.cp3.ZIndex = 3
											tbl33.cp3["BackgroundTransparency"] = 1
											tbl33.cp3.Size = UDim2.new(0, 24, 0, 24)
											tbl33.cp3.Position = UDim2.new(1, -32, 0.5, -12)
											tbl33.cp3["Text"] = ""
											tbl33.cp3.Name = "Hit"
											tbl33.cp3:SetAttribute("fadeOriginal_TextTransparency", 0)
											tbl33.cp3:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											tbl33.cp2_s = Instance.new("UIStroke", tbl33.cp2)
											tbl33.cp2_s.Transparency = 1
											tbl33.cp2_s.Color = Color3.fromRGB(70, 70, 86)

											tbl33.cp3.MouseEnter:Connect(function()
												service2:Create(tbl33.cp2_s, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Transparency = 0.35 }):Play()
											end)

											tbl33.cp3.MouseLeave:Connect(function()
												local tbl34 = { Transparency = 1 }
												service2:Create(tbl33.cp2_s, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), tbl34):Play()
											end)

											tbl33.cp3.MouseButton1Click:Connect(function()
												tbl31.openColorPicker(tbl33.cp2, function(color)
													tbl33.Color = color

													if v93.callback then
														v93.callback(color)
													end
												end, tbl33.flag)
											end)

											if tbl33.flag then
												tbl17.Flags[tbl33.flag] = tbl33.Color
											end

											tbl33.SetColor = function(arg5, color)
												tbl33.Color = color
												tbl33.cp2.BackgroundColor3 = color

												if tbl33.flag then
													tbl17.Flags[tbl33.flag] = color
												end

												if v93.callback then
													v93.callback(color)
												end
											end

											tbl33.GetColor = function()
												return tbl33.Color
											end

											if tbl33.flag then
												table.insert(tbl31.Widgets, function()
													local color = tbl17.Flags[tbl33.flag]

													if color then
														if typeof(color) == "table" then
															color = Color3.new(color.R or 1, color.G or 1, color.B or 1)
														end

														tbl33:SetColor(color)
													end
												end)
											end

											return tbl33
										end

										tbl32.Create_TextBox = function(arg3, arg4)
											local v93 = tbl17:validate({
												name = "TextBox",
												default = "...",
												placeholder = "Enter text...",
												callback = nil,
												flag = nil,
												tab = nil,
												clearOnFocus = false,
												numeric = false,
											}, arg4 or {})

											local tbl33 = { Value = v93.flag and tbl17.Flags[v93.flag] or v93.default or "", flag = v93.flag }
											tbl33.t70 = Instance.new("Frame", v93.tab and v93.tab.ContentContainer or tbl32.ContentContainer)
											tbl33.t70["BackgroundColor3"] = Color3.fromRGB(39, 39, 47)
											tbl33.t70["Size"] = UDim2.new(1, 0, -0.088, 56)
											tbl33.t70["Name"] = v93.name .. "_textbox"
											tbl33.t70.LayoutOrder = 0
											tbl33.t70.BackgroundTransparency = 1
											tbl33.t70:SetAttribute("staggerBase", UDim2.new(0, 0, 0, 0))
											tbl33.t70:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											tbl33.t70_div = Instance.new("Frame", tbl33.t70)
											tbl33.t70_div.BorderSizePixel = 0
											tbl33.t70_div.BackgroundColor3 = Color3.fromRGB(39, 39, 47)
											tbl33.t70_div.Size = UDim2.new(1, 0, 0, 1)
											tbl33.t70_div.Position = UDim2.new(0, 0, 0, 0)
											tbl33.t70_div.Name = "Divider"
											tbl33.t70_div.BackgroundTransparency = 0.25
											tbl33.t70_div:SetAttribute("staggerBase", UDim2.new(0, 0, 0, 0))
											tbl33.t70_div:SetAttribute("fadeOriginal_BackgroundTransparency", 0.25)
											tbl33.t71 = Instance.new("TextLabel", tbl33.t70)
											tbl33.t71.TextSize = 12
											tbl33.t71.TextXAlignment = Enum.TextXAlignment.Center
											tbl33.t71["FontFace"] = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
											tbl33.t71["TextColor3"] = Color3.fromRGB(143, 143, 154)
											tbl33.t71.BackgroundTransparency = 1
											tbl33.t71.Size = UDim2.new(1, 0, 0, 14)
											tbl33.t71.Text = ""
											tbl33.t71.Name = "Label"
											tbl33.t71.Position = UDim2.new(0, 0, 0, 6)
											tbl33.t71:SetAttribute("fadeOriginal_TextTransparency", 0)
											tbl33.t71:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											tbl33.t72 = Instance.new("Frame", tbl33.t70)
											tbl33.t72["BorderSizePixel"] = 0
											tbl33.t72.BackgroundColor3 = Color3.fromRGB(39, 39, 47)
											tbl33.t72.Size = UDim2.new(1, -28, 0, 24)
											tbl33.t72.Position = UDim2.new(0, 14, 0, 12)
											tbl33.t72.Name = "InputFrame"
											tbl33.t72:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
											tbl33.t72_c = Instance.new("UICorner", tbl33.t72)
											tbl33.t72_c.CornerRadius = UDim.new(0, 6)
											tbl33.t72_sh = Instance.new("UIShadow", tbl33.t72)
											tbl33.t72_sh:SetAttribute("fadeOriginal_Transparency", 0.55)
											tbl33.t72_s = Instance.new("UIStroke", tbl33.t72)
											tbl33.t72_s.Transparency = 1
											tbl33.t72_s.Color = Color3.fromRGB(70, 70, 86)
											tbl33.t72_s:SetAttribute("fadeOriginal_Transparency", 1)
											tbl33.t73 = Instance.new("TextBox", tbl33.t72)
											tbl33.t73.TextSize = 11
											tbl33.t73.TextXAlignment = Enum.TextXAlignment.Center
											tbl33.t73.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
											tbl33.t73.TextColor3 = Color3.fromRGB(243, 243, 247)
											tbl33.t73["BackgroundTransparency"] = 1
											tbl33.t73.Size = UDim2.new(1, -16, 1, 0)
											tbl33.t73.Text = tbl33.Value
											tbl33.t73.PlaceholderText = v93.placeholder
											tbl33.t73.PlaceholderColor3 = Color3.fromRGB(132, 132, 143)
											tbl33.t73["Name"] = "Input"
											tbl33.t73.Position = UDim2.new(0, 8, 0, 0)
											tbl33.t73.TextTruncate = Enum.TextTruncate.AtEnd
											tbl33.t73.ClearTextOnFocus = v93.clearOnFocus
											tbl33.t73.ZIndex = 2

											if v93.numeric then
												tbl33.t73.Numeric = true
											end

											tbl33.t73:SetAttribute("fadeOriginal_TextTransparency", 0)
											tbl33.t73:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											local flag25 = false

											tbl33.t73.Focused:Connect(function()
												flag25 = true
												local tbl34 = { Transparency = 0 }
												service2:Create(tbl33.t72_s, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), tbl34):Play()
											end)

											tbl33.t73.FocusLost:Connect(function()
												flag25 = false
												service2:Create(tbl33.t72_s, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Transparency = 1 }):Play()
												tbl33.Value = tbl33.t73.Text

												if tbl33.flag then
													tbl17.Flags[tbl33.flag] = tbl33.Value
													tbl17.save_flags()

													if n25 < 7207 then
														while true do
														end
													end
												end

												if v93.callback then
													v93.callback(tbl33.Value)
												end
											end)

											tbl33.t73.MouseEnter:Connect(function()
												service2:Create(tbl33.t72_s, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Transparency = 0.35 }):Play()
											end)

											tbl33.t73.MouseLeave:Connect(function()
												if not flag25 then
													service2:Create(tbl33.t72_s, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Transparency = 1 }):Play()
												end
											end)

											if tbl33.flag and tbl17.Flags[tbl33.flag] == nil then
												tbl17.Flags[tbl33.flag] = tbl33.Value
											end

											if tbl33.flag and tbl17.Flags[tbl33.flag] and tbl17.Flags[tbl33.flag] ~= "" and v93.callback then
												task.defer(function()
													v93.callback(tbl17.Flags[tbl33.flag])
												end)
											end

											tbl33.SetValue = function(arg5, value)
												tbl33.Value = value
												tbl33.t73.Text = value

												if tbl33.flag then
													tbl17.Flags[tbl33.flag] = value
												end

												if v93.callback then
													v93.callback(value)
												end
											end

											tbl33.GetValue = function()
												return tbl33.Value
											end

											if tbl33.flag then
												table.insert(tbl31.Widgets, function()
													if tbl17.Flags[tbl33.flag] ~= nil then
														tbl33:SetValue(tbl17.Flags[tbl33.flag])
													end
												end)
											end

											return tbl33
										end

										tbl32.Create_Section = function(arg3, arg4, arg5)
											local v93

											if arg4 == "left" or arg4 == "right" then
												v93 = nil
											else
												local section = arg5 or tbl32.Section

												if section then
													v93 = arg4
													arg4 = section
												else
													v93 = arg4
													arg4 = "left"
												end
											end

											local tab = { section = arg4, Tab = tbl32, title = v93 }
											local str10 = "_wrapper_" .. arg4

											if not tbl32[str10] then
												tbl32[str10] = Instance.new("Frame", tbl31["2"])
												tbl32[str10].BorderSizePixel = 0
												tbl32[str10].BackgroundTransparency = 1
												tbl32[str10].AutomaticSize = Enum.AutomaticSize.Y
												tbl32[str10].Size = UDim2.new(0, 264, 0, 0)
												tbl32[str10].Position = UDim2.new(0, arg4 == "right" and 444 or 166, 0, 118)
												tbl32[str10].Name = (tbl32["12"].Name or "Tab") .. "_" .. arg4 .. "_wrapper"
												local uiListLayout = Instance.new("UIListLayout", tbl32[str10])
												uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
												uiListLayout.Padding = UDim.new(0, 8)

												if not tbl31.CurrentTabs[arg4] then
													tbl31.CurrentTabs[arg4] = tbl32
												end

												tbl32[str10].Visible = tbl31.CurrentTabs[arg4] == tbl32
												table.insert(tbl32.AllContainers, { container = tbl32[str10], section = arg4 })
											end

											local v94 = tbl32[str10]

											if v93 then
												tab.MainTitle = Instance.new("TextLabel", v94)
												tab.MainTitle.TextSize = 13
												tab.MainTitle.TextXAlignment = Enum.TextXAlignment.Left
												tab.MainTitle.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
												tab.MainTitle.TextColor3 = Color3.fromRGB(243, 243, 247)
												tab.MainTitle.BackgroundTransparency = 1
												tab.MainTitle.Size = UDim2.new(0, 200, 0, 16)
												tab.MainTitle.Text = v93
												tab.MainTitle.Name = "MainTitle"
												tab.MainTitle:SetAttribute("fadeOriginal_TextTransparency", 0)
												tab.MainTitle:SetAttribute("fadeOriginal_BackgroundTransparency", 1)
											end

											tab.ContentContainer = Instance.new("Frame", v94)
											tab.ContentContainer.BorderSizePixel = 0
											tab.ContentContainer.BackgroundColor3 = Color3.fromRGB(14, 15, 20)
											tab.ContentContainer.AutomaticSize = Enum.AutomaticSize.Y
											tab.ContentContainer.Size = UDim2.new(0, 264, 0, 0)
											tab.ContentContainer.Name = (tbl32["12"].Name or "Tab") .. "_" .. arg4 .. "_content"
											tab.ContentContainer:SetAttribute("fadeOriginal_BackgroundTransparency", 0)
											tab.ContentContainer.Visible = true
											Instance.new("UICorner", tab.ContentContainer).CornerRadius = UDim.new(0, 10)
											Instance.new("UIShadow", tab.ContentContainer):SetAttribute("fadeOriginal_Transparency", 0.55)
											local layoutOrder2 = Enum.SortOrder.LayoutOrder
											Instance.new("UIListLayout", tab.ContentContainer).SortOrder = layoutOrder2

											tab.Create_Toggle = function(arg6, arg7)
												local tbl33 = arg7 or {}
												tbl33.tab = tab
												return tbl32:Create_Toggle(tbl33)
											end

											tab.Create_Slider = function(arg6, arg7)
												local tbl33 = arg7 or {}
												tbl33.tab = tab
												return tbl32:Create_Slider(tbl33)
											end

											tab.Create_Dropdown = function(arg6, arg7)
												local tbl33 = arg7 or {}
												tbl33.tab = tab
												return tbl32:Create_Dropdown(tbl33)
											end

											tab.Create_ColorPicker = function(arg6, arg7)
												local tbl33 = arg7 or {}
												tbl33.tab = tab
												return tbl32:Create_ColorPicker(tbl33)
											end

											tab.Create_TextBox = function(arg6, arg7)
												local tbl33 = arg7 or {}
												tbl33.tab = tab
												return tbl32:Create_TextBox(tbl33)
											end

											return tab
										end

										return tbl32
									end
								end

								do
									local v92, v93

									do
										tbl17.Notify = function(arg, text2, arg2, arg3)
											local n41 = arg3 or 4
											local tbl31 = { ["1"] = Instance.new("ScreenGui") }
											tbl31["1"].Name = "Zenthra Notification"
											tbl31["1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
											tbl31["1"].Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
											tbl31["2"] = Instance.new("Frame", tbl31["1"])
											tbl31["2"].Name = "Notifications"
											tbl31["2"].Size = UDim2.new(0, 230, 0, 400)
											tbl31["2"].Position = UDim2.new(1, -16, 1, -16)
											tbl31["2"].AnchorPoint = Vector2.new(1, 1)
											tbl31["2"].BackgroundTransparency = 1
											tbl31["2"].ZIndex = 10
											local uiListLayout = Instance.new("UIListLayout", tbl31["2"])
											uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
											uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
											uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
											uiListLayout.Padding = UDim.new(0, 8)
											tbl31["4"] = Instance.new("Frame")
											tbl31["4"].Size = UDim2.fromOffset(230, 52)
											tbl31["4"].BackgroundTransparency = 1
											tbl31["4"].ZIndex = 10
											local frame = Instance.new("Frame", tbl31["4"])
											frame.Size = UDim2.new(1, 0, 1, 0)
											frame.BackgroundColor3 = Color3.fromRGB(35, 35, 38)
											frame.ZIndex = 10
											frame.Position = UDim2.fromOffset(260, 0)
											Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
											local frame2 = Instance.new("Frame", frame)
											frame2.Position = UDim2.fromOffset(12, 14)
											frame2.Size = UDim2.fromOffset(24, 24)
											frame2.BackgroundColor3 = Color3.fromRGB(47, 47, 50)
											frame2.ZIndex = 11
											Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 6)
											local textLabel = Instance.new("TextLabel", frame2)
											textLabel.BackgroundTransparency = 1
											textLabel.Size = UDim2.fromScale(1, 1)
											textLabel.Font = Enum.Font.GothamBold
											textLabel.Text = "i"
											textLabel.TextSize = 12
											textLabel.TextColor3 = Color3.fromRGB(236, 236, 236)
											textLabel.ZIndex = 12
											local textLabel2 = Instance.new("TextLabel", frame)
											textLabel2.BackgroundTransparency = 1
											textLabel2.Position = UDim2.fromOffset(46, 12)
											textLabel2.Size = UDim2.new(1, -58, 0, 14)
											textLabel2.Font = Enum.Font.GothamBold
											textLabel2.Text = text2
											textLabel2.TextSize = 12
											textLabel2.TextColor3 = Color3.fromRGB(236, 236, 236)
											textLabel2.TextXAlignment = Enum.TextXAlignment.Left
											textLabel2.ZIndex = 11
											local frame3 = Instance.new("Frame", frame)
											frame3.Name = "track"
											frame3.Position = UDim2.fromOffset(46, 34)
											frame3.Size = UDim2.new(1, -60, 0, 3)
											frame3.BackgroundColor3 = Color3.fromRGB(56, 56, 59)
											frame3.BorderSizePixel = 0
											frame3.ZIndex = 11
											Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 2)
											local frame4 = Instance.new("Frame", frame3)
											frame4.Name = "fill"
											frame4.Size = UDim2.fromScale(1, 1)
											frame4.BackgroundColor3 = Color3.fromRGB(236, 236, 236)
											frame4.BorderSizePixel = 0
											frame4.ZIndex = 12
											Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 2)
											local clone = tbl31["4"]:Clone()
											clone.Parent = tbl31["2"]
											clone.Visible = true
											local frame5 = clone:FindFirstChildOfClass("Frame")
											local track = frame5:FindFirstChild("track")
											track = track and track:FindFirstChild("fill")

											if track then
												game:GetService("TweenService"):Create(track, TweenInfo.new(n41, Enum.EasingStyle.Linear), { Size = UDim2.new(0, 0, 1, 0) }):Play()
											end

											game:GetService("TweenService"):Create(frame5, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Position = UDim2.fromOffset(0, 0) }):Play()

											task.delay(n41, function()
												local tween = game:GetService("TweenService"):Create(frame5, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Position = UDim2.fromOffset(260, 0) })
												tween:Play()

												tween.Completed:Once(function()
													local tween2 = game:GetService("TweenService"):Create(clone, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(230, 0) })
													tween2:Play()

													tween2.Completed:Once(function()
														clone:Destroy()
													end)
												end)
											end)
										end

										flag24 = false
										
									end

									
								end
							end

							local tbl31, v92, v93, v94, v95, right

							do
								do
									local v96

									do
										do
											tbl31 = {}
										end

										do
											local v97

											do
												tbl17.new()

												v97 = tbl17:Create_Tab({
													name = "Blatant",
													section_name = "Automation",
													icon = "shield-check",
												})

												do
													local left = v97:Create_Section("left")

													left:Create_Toggle({
														name = "Auto Parry",
														flag = "Auto_Parry",
														callback = function(arg)
															if tbl17.Flags.Auto_Parry_Notification then
																tbl17:Notify("AP = " .. tostring(arg and "Enabled" or "Disabled"), 5)
															end

															if arg then
																tbl18["Auto Parry"] = RunService.PreSimulation:Connect(function()
																	local alive = workspace.Alive
																	if (localPlayer.Character or localPlayer.CharacterAdded:Wait()).Parent ~= alive then
																		return
																	end
																	local v98 = tbl19.Get_Ball()

																	for _, v99 in tbl19.Get_Balls(), nil, nil do
																		if not v99 then
																			return
																		end
																		local zoomies = v99:FindFirstChild("zoomies")
																		if not zoomies then
																			return
																		end
																		getgenv().Time_View = os.clock() - n38
																		local n41 = os.clock() - n38

																		tbl18["Target Change"] = v99:GetAttributeChangedSignal("target"):Once(function()
																			if flag22 then
																				flag22 = false
																			end
																		end)

																		local maxShield = localPlayer.Character.PrimaryPart:FindFirstChild("MaxShield")
																		local tornado = workspace.Runtime:FindFirstChild("Tornado")
																		local abilities = localPlayer.Character and localPlayer.Character:FindFirstChild("Abilities")
																		local hotbar = localPlayer:FindFirstChild("PlayerGui") and localPlayer.PlayerGui:FindFirstChild("Hotbar")
																		local visible = hotbar and hotbar:FindFirstChild("Ability") and hotbar.Ability:FindFirstChild("Duration") and hotbar.Ability.Duration.Visible
																		local infinity = abilities and abilities:FindFirstChild("Infinity")
																		infinity = infinity and infinity.Enabled
																		infinity = visible and infinity and flag21
																		abilities = abilities and abilities:FindFirstChild("Time Hole")
																		abilities = abilities and abilities.Enabled
																		local singularityCape = localPlayer.Character.PrimaryPart:FindFirstChild("SingularityCape")
																		local uiGradient = localPlayer.PlayerGui.Hotbar.Block.UIGradient
																		getgenv().Parry_Cooldown = uiGradient
																		local uiGradient2 = localPlayer.PlayerGui.Hotbar.Ability.UIGradient
																		local attribute = v99:GetAttribute("target")
																		v98:GetAttribute("target")
																		local magnitude = zoomies.VectorVelocity.Magnitude
																		local value = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
																		local n42 = math.clamp(value / 10, 10, 16) + magnitude / (2.3497562749127492 + math.clamp(magnitude, 0, 425) * 0.002) * n40
																		local n43 = n42 + tbl17.Flags.Parry_Range or 0
																		local position

																		if v99 == v87 and v86 then
																			position = v86
																		else
																			position = v99.Position
																		end

																		local magnitude2 = (localPlayer.Character.PrimaryPart.Position - position).Magnitude
																		local v100 = tbl19.Is_Curved()
																		local v101 = tbl19.Is_Curved2()
																		if infinity or visible and abilities then
																			n39 = 0
																			return
																		end

																		if visible and maxShield or singularityCape then
																			n39 = 0
																			return
																		end

																		if attribute == localPlayer.Name and tornado then
																			local n44 = (tornado:GetAttribute("TornadoTime") or 1) + 0.314159

																			if now2 then
																				if tick() - now2 < n44 then
																					return
																				end
																				game:GetService("Debris"):AddItem(tornado, 0)
																				now2 = nil
																			end
																		end

																		if attribute == localPlayer.Name and getgenv().Cooldown_Protection and n41 > 0.5 and (uiGradient.Offset.Y <= 0.4 and magnitude2 <= n42 or uiGradient.Offset.Y > 0 and uiGradient.Offset.Y <= -0.15) then
																			for _, v102 in tbl29, nil, nil do
																				if localPlayer.Character.Abilities[v102].Enabled then
																					flag22 = true
																					ReplicatedStorage.Remotes.AbilityButtonPress:Fire()
																					return
																				end
																			end
																		end

																		if attribute == localPlayer.Name and uiGradient2.Offset.Y == 0.5 and magnitude2 <= n42 and getgenv().Auto_Ability and n41 > 0.5 then
																			for _, v102 in tbl29, nil, nil do
																				if localPlayer.Character.Abilities[v102].Enabled then
																					flag22 = true
																					ReplicatedStorage.Remotes.AbilityButtonPress:Fire()
																					return
																				end
																			end
																		end

																		if attribute == localPlayer.Name and v100 then
																			return
																		end

																		if attribute == localPlayer.Name and n41 > 0.5 and v101 and game.PlaceId ~= 15264892126 then
																			warn("backwards curved")
																			return
																		end

																		if tbl17.Flags.Phantom_Detection and attribute == localPlayer.Name and flag24 then
																			return
																		end

																		if attribute == localPlayer.Name and magnitude2 <= n43 and not flag22 then
																			tbl19.Play_Animation()
																			tbl19.Parry(tbl17.Flags.Parry_Type)
																			n38 = os.clock()
																			flag22 = true
																			local now3 = os.clock()

																			task.spawn(function()
																				local n44 = math.clamp(value / 10, 5, 17)
																				local ballProperties = tbl19:Get_Ball_Properties(v99)
																				if not ballProperties then
																					return
																				end
																				local entityProperties = tbl19:Get_Entity_Properties()
																				if not entityProperties then
																					return
																				end
																				local v102 = tbl19.Spam_Service({ Ball = v99, Ball_Properties = ballProperties, Entity_Properties = entityProperties, Ping = n44 })
																				if not v102 or v102 == 0 then
																					return
																				end

																				while true do
																					RunService.Heartbeat:Wait()
																					if not (os.clock() - now3 >= 0.65 or not flag22) then
																						continue
																					end
																					break
																				end

																				flag22 = false
																				if n39 >= 7 then
																					return false
																				end
																				n39 += 1

																				task.delay(0.5, function()
																					if n39 > 0 then
																						n39 -= 1
																					end
																				end)

																				tbl18.Prevent_AP_Parry_When_Manual_Parried = uiGradient:GetPropertyChangedSignal("Offset"):Once(function()
																					if uiGradient.Offset.Y < 0.5 and magnitude2 > v102 then
																						flag22 = true
																						now3 = os.clock()
																					end
																				end)
																			end)
																		end
																	end
																end)
															else
																if tbl18["Target Change"] then
																	tbl18["Target Change"]:Disconnect()
																	tbl18["Target Change"] = nil
																end

																if tbl18["Auto Parry"] then
																	tbl18["Auto Parry"]:Disconnect()
																	tbl18["Auto Parry"] = nil
																end
															end
														end,
													})

													left:Create_Toggle({
														name = "AP Notification",
														flag = "Auto_Parry_Notification",
														callback = function(autoParryNotification)
															tbl17.Flags.Auto_Parry_Notification = autoParryNotification
														end,
													})
												end
											end

											local right2 = v97:Create_Section("right")

											right2:Create_Toggle({
												name = "Auto Spam",
												flag = "Auto_Spam",
												callback = function(arg)
													if arg then
														tbl18["Auto Spam"] = RunService.PostSimulation:Connect(function()
															if not tbl17.Flags.Auto_Parry then
																return
															end
															local alive = workspace.Alive
															local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
															if character.Parent ~= alive then
																return
															end
															local v98 = tbl19.Get_Ball()
															if not v98 then
																return
															end

															if not v98:FindFirstChild("zoomies") then
																return
															end
															local n41 = math.clamp(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() / 10, 10, 16.5)
															local ballProperties = tbl19:Get_Ball_Properties(v98)
															if not ballProperties then
																return
															end
															local entityProperties = tbl19:Get_Entity_Properties()
															if not entityProperties then
																return
															end
															local v99 = tbl19.Spam_Service({ Ball = v98, Ball_Properties = ballProperties, Entity_Properties = entityProperties, Ping = n41 })
															if not v99 or v99 == 0 then
																return
															end
															local hotbar = localPlayer:FindFirstChild("PlayerGui") and localPlayer.PlayerGui:FindFirstChild("Hotbar")
															character = character and character:FindFirstChild("Abilities")
															local visible = hotbar and hotbar:FindFirstChild("Ability") and hotbar.Ability:FindFirstChild("Duration") and hotbar.Ability.Duration.Visible
															local infinity = character and character:FindFirstChild("Infinity")
															infinity = infinity and infinity.Enabled
															infinity = visible and infinity and flag21
															character = character and character:FindFirstChild("Time Hole")
															character = character and character.Enabled
															if infinity then
																n39 = 0
																return
															end

															if not (visible and character) then
																local position

																if v98 == v87 and v86 then
																	position = v86
																else
																	position = v98.Position
																end

																if (localPlayer.Character.PrimaryPart.Position - position).Magnitude <= v99 and n39 >= tonumber(tbl17.Flags.Clashing_Threshold) then
																	if flag23 then
																		tbl19.Parry_Animation()
																	end

																	if game.PlaceId == 15264892126 and not flag23 then
																		instance:SendKeyEvent(true, text, false, game)
																		instance:SendKeyEvent(false, text, false, game)
																	end

																	if game.PlaceId ~= 15264892126 and not flag23 then
																		instance:SendKeyEvent(true, text, false, game)
																		instance:SendKeyEvent(false, text, false, game)
																	end

																	tbl19.Parry(tbl17.Flags.Parry_Type)
																end

																return
															end

															n39 = 0
															if not (n25 <= 7209) then
																return
															end

															while true do
															end
														end)
													elseif tbl18["Auto Spam"] then
														tbl18["Auto Spam"]:Disconnect()
														tbl18["Auto Spam"] = nil
													end
												end,
											})

											if flag23 then
												right2:Create_Toggle({
													name = "Manual Spam",
													flag = "Manual_Spam",
													callback = function(arg)
														if arg then
															local screenGui = Instance.new("ScreenGui")
															screenGui.Name = "ManualSpamUI"
															screenGui.ResetOnSpawn = false
															screenGui.Parent = game.CoreGui
															local frame = Instance.new("Frame")
															frame.Name = "MainFrame"
															frame.Position = UDim2.new(0, 20, 0, 20)
															frame.Size = UDim2.new(0, 200, 0, 100)
															frame.BackgroundColor3 = Color3.fromRGB(10, 10, 50)
															frame.BackgroundTransparency = 0.3
															frame.BorderSizePixel = 0
															frame.Active = true
															frame.Draggable = true
															frame.Parent = screenGui
															local uiCorner = Instance.new("UICorner")
															uiCorner.CornerRadius = UDim.new(0, 12)
															uiCorner.Parent = frame
															local uiStroke = Instance.new("UIStroke")
															uiStroke.Thickness = 2
															uiStroke.Color = Color3.new(0, 0, 0)
															uiStroke.Parent = frame
															local textButton = Instance.new("TextButton")
															textButton.Name = "ClashModeButton"
															textButton.Text = "Start"
															textButton.Size = UDim2.new(0, 160, 0, 40)
															textButton.Position = UDim2.new(0.5, -80, 0.5, -20)
															textButton.BackgroundTransparency = 1
															textButton.BorderSizePixel = 0
															textButton.Font = Enum.Font.GothamSemibold
															textButton.TextColor3 = Color3.new(1, 1, 1)
															textButton.TextSize = 22
															textButton.Parent = frame
															local flag25 = false

															textButton.MouseButton1Click:Connect(function()
																flag25 = not flag25
																textButton.Text = flag25 and "Stop" or "Start"

																if flag25 then
																	tbl18["Manual Spam UI"] = RunService.PostSimulation:Connect(function()
																		if localPlayer.Character.Parent ~= workspace.Alive then
																			return
																		end
																		tbl19.Parry(tbl17.Flags.Parry_Type)

																		if flag23 then
																			tbl19.Play_Animation()
																		end
																	end)
																elseif tbl18["Manual Spam UI"] then
																	tbl18["Manual Spam UI"]:Disconnect()
																	tbl18["Manual Spam UI"] = nil
																end
															end)
														else
															if game:GetService("CoreGui"):FindFirstChild("ManualSpamUI") then
																game:GetService("CoreGui"):FindFirstChild("ManualSpamUI"):Destroy()
															end

															if tbl18["Manual Spam UI"] then
																tbl18["Manual Spam UI"]:Disconnect()
																tbl18["Manual Spam UI"] = nil
															end
														end
													end,
												})
											else
												right2:Create_Toggle({
													name = "Manual Spam",
													flag = "Manual_Spam",
													callback = function(arg)
														if arg then
															tbl18["Manual Spam"] = RunService.PostSimulation:Connect(function()
																local alive = workspace.Alive
																if (localPlayer.Character or localPlayer.CharacterAdded:Wait()).Parent ~= alive then
																	return
																end
																local v98 = tbl19.Get_Ball()
																if not v98 then
																	return
																end

																if not v98:FindFirstChild("zoomies") then
																	return
																end

																if game.PlaceId == 15264892126 then
																	instance:SendKeyEvent(true, text, false, game)
																	instance:SendKeyEvent(false, text, false, game)
																end

																if game.PlaceId ~= 15264892126 and not flag23 then
																	instance:SendKeyEvent(true, text, false, game)
																	instance:SendKeyEvent(false, text, false, game)
																end

																tbl19.Parry(tbl17.Flags.Parry_Type)
															end)
														elseif tbl18["Manual Spam"] then
															tbl18["Manual Spam"]:Disconnect()
															tbl18["Manual Spam"] = nil
														end
													end,
												})
											end
										end

										v96 = tbl17:Create_Tab({
											name = "Configs",
											section_name = "Automation",
											icon = "file-cog",
										})

										do
											local left = v96:Create_Section("left")

											v92 = left:Create_Slider({
												name = "Parry Accuracy",
												flag = "Parry_Accuracy",
												min = 1,
												max = 100,
												default = 72,
												callback = function(parryAccuracy)
													if tbl17.Flags.Phantom_Detection then
														n40 = 0.8 + (parryAccuracy - 1) * 0.024747474747474751
													else
														n40 = 0.8 + (parryAccuracy - 1) * 0.0030303030303030303
													end

													tbl17.Flags.Parry_Accuracy = parryAccuracy
												end,
											})

											v93 = left:Create_Dropdown({
												name = "Parry Type",
												options = {
													"Camera",
													"High",
													"FFA",
													"Dot",
													"Dot Pointer",
													"Straight",
													"Random",
													"Backwards",
												},
												default = "Camera",
												flag = "Parry_Type",
												callback = function(parryType)
													tbl17.Flags.Parry_Type = parryType
												end,
											})
										end
									end

									do
										do
											local right2 = v96:Create_Section("right")

											v94 = right2:Create_Slider({
												name = "Parry Range",
												flag = "Parry_Range",
												min = 0,
												max = 10,
												default = 0,
												callback = function(parryRange)
													if true then
														tbl17.Flags.Parry_Range = parryRange
														return
													end

													while true do
													end
												end,
											})

											right2:Create_Dropdown({
												name = "Clashing Threshold",
												options = { "1", "2", "3" },
												default = "1",
												flag = "Clashing_Threshold",
												callback = function(clashingThreshold)
													tbl17.Flags.Clashing_Threshold = clashingThreshold
												end,
											})
										end

										v96:Create_Section("Parry Options", "left"):Create_Dropdown({
											name = "Parry Options",
											options = { "Remote", "Hardware", "Keypress" },
											default = "Remote",
											flag = "Parry_Options",
											callback = function(parryOptions)
												tbl17.Flags.Parry_Options = parryOptions
											end,
										})

										v95 = tbl17:Create_Tab({
											name = "Visuals",
											section_name = "Render",
											icon = "rbxassetid://79435149356304",
										})

										do
											local left = v95:Create_Section("left")

											left:Create_Toggle({
												name = "No Render",
												flag = "No_Render",
												callback = function(arg)
													if arg then
														if tbl17.Flags.No_Render_Notification then
															tbl17:Notify("No Render = Enabled", 5)
														end

														tbl18["No Render"] = workspace:WaitForChild("Runtime").ChildAdded:Connect(function(child)
															if child.Name:find("PortalFor_") or child.Name:find("WaypointFor_") then
																return
															end

															if table.find(tbl30, child.Name) then
																return
															end
															game:GetService("Debris"):AddItem(child, 0)
														end)
													else
														if tbl17.Flags.No_Render_Notification then
															tbl17:Notify("No Render = Disabled", 5)
														end

														if tbl18["No Render"] then
															tbl18["No Render"]:Disconnect()
															tbl18["No Render"] = nil
														end
													end
												end,
											})

											left:Create_Toggle({
												name = "No_Render Notify",
												flag = "No_Render_Notification",
												callback = function(noRenderNotification)
													tbl17.Flags.No_Render_Notification = noRenderNotification
												end,
											})
										end
									end
								end

								right = v95:Create_Section("right")

								do
									local tbl32 = { Sword = {}, Explosion = {} }
									local str10 = nil
									getgenv().Sword_Name = getgenv().Sword_Name or "Base Sword"
									getgenv().FinisherEquipped = getgenv().FinisherEquipped or {}
									getgenv().Selected_Finisher = getgenv().Selected_Finisher or false
									local HoverInfoController = require(ReplicatedStorage.Controllers.HoverInfoController)
									local Utils = require(ReplicatedStorage.Common.Utils)
									local EmoteController = require(ReplicatedStorage.Controllers.EmoteController)
									local SecretAwakenData = require(ReplicatedStorage.Shared.SecretAwakenData)

									right:Create_Toggle({
										name = "Unlock All",
										flag = "Unlock_All",
										callback = function(unlockAll)
											tbl17.Flags.Unlock_All = unlockAll
											local Shared = require(ReplicatedStorage.Shared.Inventory.Shared)

											if unlockAll then
												task.spawn(function()
													local InventoryController = require(ReplicatedStorage.Controllers.Trading.InventoryController)
													local ShopController = require(ReplicatedStorage.Controllers.UI.ShopController)
													local favorite = localPlayer.PlayerGui.Shop.Holder.Favorite

													if not sword then
														local attribute = localPlayer:GetAttribute("CurrentlyEquippedSword")

														if attribute then
															sword = module:GetSword(attribute)
														end
													end

													local v96 = lastEquipped

													if v96 then
														local sword2 = module:GetSword(v96)

														if sword2 then
															local name = sword2.Name
															getgenv().Sword_Name = name
															module:EquipSwordTo(localPlayer.Character, getgenv().Sword_Name)
															function_2(getgenv().Sword_Name)
															localPlayer:SetAttribute("CurrentlyEquippedSword", getgenv().Sword_Name)
														end
													end

													str10 = str8
													local playExplosion = v91.PlayExplosion

													v91.PlayExplosion = function(arg, arg2, arg3, arg4, arg5, arg6, arg7)
														if str10 and str10 ~= "" then
															if arg7 and arg6 == localPlayer.Character then
																arg2 = str10
															end
														end

														return playExplosion(arg, arg2, arg3, arg4, arg5, arg6, arg7)
													end

													v88 = hookfunction(Shared.FindItems, function(arg, arg2, arg3, arg4, arg5)
														local ok, result = pcall(v88, arg, arg2, arg3, arg4, arg5)

														if string.find(tostring(arg3), "Abilit", 1, true) then
															ok = ok and type(result) == "table"
															if ok then
																return result
															end
															return {}
														end

														if ok and type(result) == "table" and #result > 0 then
															return result
														end

														if arg4 ~= nil then
															return { arg4 }
														end
														return {}
													end)

													local ItemInfo = require(ReplicatedStorage.Shared.ItemInfo)
													local client = require(ReplicatedStorage.Shared.Inventory).Client

													for k in tbl32, nil, nil do
														getgenv().Category = k
														local v97 = ShopController._virtualItems[k]

														if v97 then
															getgenv().Shop_Lists = v97
															ShopController._loadInventoryPage(k)

															while task.wait() do
																local voidGuardian = k ~= "Sword" or ShopController._virtualItems.Sword and ShopController._virtualItems.Sword["Witch's Curse"] and ShopController._virtualItems.Sword["Void Hammer"] and ShopController._virtualItems.Sword.Penguin and ShopController._virtualItems.Sword["Corrupted Fan"] and ShopController._virtualItems.Sword["Cyber Scythe"] and ShopController._virtualItems.Sword["Void Guardian"]

																if voidGuardian then
																	voidGuardian = k ~= "Explosion"

																	if not voidGuardian then
																		voidGuardian = ShopController._virtualItems.Explosion and ShopController._virtualItems.Explosion["Zap Burst"] and ShopController._virtualItems.Explosion["Zero Point Implosion"] and ShopController._virtualItems.Explosion["Zombie Annihilation"] and ShopController._virtualItems.Explosion["Beach Party"] and ShopController._virtualItems.Explosion["Bad Luck Explosion"] and ShopController._virtualItems.Explosion["Brutality Affection Explosion"] and ShopController._virtualItems.Explosion["Chrome Dracula"] and ShopController._virtualItems.Explosion["Coated Candy"] and ShopController._virtualItems.Explosion["Crystal Strawberry Explosion"] and ShopController._virtualItems.Explosion["Deathwarden Flame Explosion"] and ShopController._virtualItems.Explosion["Deathwarden Star Explosion"] and ShopController._virtualItems.Explosion["Divine Ruin Lore"]
																	end
																end

																if not voidGuardian then
																	continue
																end
																break
															end

															local tbl33 = {}

															for _, v98 in v97, nil, nil do
																table.insert(tbl33, v98)
															end

															for _, v98 in tbl33, nil, nil do
																if v98.Name ~= "Base Sword" and not v98.OwnsItem:Get() then
																	tbl22[v98] = {
																		OwnsItem = v98.OwnsItem:Get(),
																		Section = v98.Section,
																		ForceHide = v98.ForceHide,
																		Category = k,
																	}

																	local name = client:ItemToKey(k, v98.Item) or v98.Name
																	v98.InventoryKey = name
																	v98.Key = name
																	v98.OwnsItem:Set(true)
																	v98.Section = "Owned"
																	v98.ForceHide = false

																	if string.find(v98.Name, "Awakened") then
																		v98.ForceHide = true
																	end

																	v97[name] = v98
																	local v99 = ShopController._inventoryPages[k]

																	if v99 then
																		v99.MarkDirty(v98, false, true)
																	end
																end
															end
														end
													end

													task.defer(function()
														for _, v97 in favoriteSword, nil, nil do
															local favoriteState = InventoryController:GetFavoriteState("Sword", v97)

															if favoriteState then
																favoriteState:Set(true)
															end

															local v98 = nil

															for _, v99 in ShopController._virtualItems.Sword, nil, nil do
																if v99.Name == v97 then
																	v98 = v99
																	break
																else
																	v98 = nil
																end
															end

															if v98 then
																local favorited = v98.UI and v98.UI:FindFirstChild("Favorited")

																if favorited then
																	favorited.Visible = true
																end

																v98.IsFavorited = true
																v98._OriginalName_ = v98.Name_
																v98.Name_ = "#" .. v98.Name_
																local sword2 = ShopController._inventoryPages.Sword

																if sword2 then
																	sword2.MarkDirty(v98, false, true)
																end
															end
														end

														for _, v97 in favoriteExplosion, nil, nil do
															local favoriteState = InventoryController:GetFavoriteState("Explosion", v97)

															if favoriteState then
																favoriteState:Set(true)
															end

															local v98 = nil

															for _, v99 in ShopController._virtualItems.Explosion, nil, nil do
																if v99.Name == v97 then
																	v98 = v99
																	break
																else
																	v98 = nil
																end
															end

															if v98 then
																local favorited = v98.UI and v98.UI:FindFirstChild("Favorited")

																if favorited then
																	favorited.Visible = true
																end

																v98.IsFavorited = true
																v98._OriginalName_ = v98.Name_
																v98.Name_ = "#" .. v98.Name_
																local explosion = ShopController._inventoryPages.Explosion

																if explosion then
																	explosion.MarkDirty(v98, false, true)
																end
															end
														end
													end)

													local shop = localPlayer:WaitForChild("PlayerGui"):WaitForChild("Shop")
													local buyButton = shop.Holder.InfoBG.BuyButton
													local finisher = shop.Holder.InfoBG.Equips.Finisher

													tbl18["Unlock All"] = buyButton.Activated:Connect(function()
														local selectedItem = ShopController._selectedItem
														if not selectedItem then
															return
														end
														local type_ = selectedItem.type
														local name = selectedItem.name

														if type_ == "Sword" then
															local equipAccessory = shop.Holder.InfoBG.Equips.EquipAccessory
															local collection = require(replicatedInstances:WaitForChild("SwordAccessories")):GetCollection()

															local function fn33(arg, arg2)
																return require(ReplicatedStorage.Controllers.InventoryController):GetItem(arg, arg2)
															end

															local tbl33 = {}

															local function fn34(arg)
																if tbl33[arg] == nil then
																	tbl33[arg] = collection[arg]
																end
															end

															local function fn35(arg)
																return collection[arg] ~= nil
															end

															local function fn36()
																local selectedItem2 = ShopController._selectedItem
																if not selectedItem2 then
																	equipAccessory.Visible = false
																	return
																end

																if selectedItem2.type ~= "Sword" then
																	equipAccessory.Visible = false
																	return
																end
																local data3 = selectedItem2.data
																if not data3 then
																	equipAccessory.Visible = false
																	return
																end

																if not data3.AccessoryToggleable then
																	equipAccessory.Visible = false
																	return
																end

																if data3.AccessoryUnlockable then
																	local Sword = fn33("Sword", selectedItem2.name)
																	if not Sword then
																		equipAccessory.Visible = false
																		return
																	end

																	if not (Sword.HasAccessory and Sword.HasAccessory:Get()) then
																		equipAccessory.Visible = false
																		return
																	end
																end

																local name2 = selectedItem2.name
																if not (localPlayer:GetAttribute("CurrentlyEquippedSword") == name2) then
																	equipAccessory.Visible = false
																	return
																end
																fn34(selectedItem2.name)
																if tbl33[selectedItem2.name] == nil then
																	equipAccessory.Visible = false
																	return
																end

																if tbl17.Flags.Unlock_All then
																	equipAccessory.Visible = true
																else
																	equipAccessory.Visible = true
																end

																local v97 = fn35(selectedItem2.name)
																equipAccessory.HoverImage = "rbxassetid://14783051124"
																equipAccessory.ImageColor3 = Color3.new(1, 1, 1)
																equipAccessory.Image = v97 and "rbxassetid://15452502387" or "rbxassetid://15452544682"
																equipAccessory.Label.Text = v97 and "UNEQUIP ACCESSORY" or "EQUIP ACCESSORY"
															end

															local accessoryToggleable = selectedItem.data.AccessoryToggleable
															local v97 = fn35(selectedItem.name)

															if accessoryToggleable then
																task.defer(function()
																	equipAccessory.Visible = true
																	equipAccessory.ImageColor3 = Color3.new(1, 1, 1)
																	equipAccessory.Image = v97 and "rbxassetid://15452502387" or "rbxassetid://15452544682"
																	equipAccessory.Label.Text = v97 and "UNEQUIP ACCESSORY" or "EQUIP ACCESSORY"
																end)
															else
																equipAccessory.Visible = false
															end

															if selectedItem.data.HasFinisher then
																task.defer(function()
																	finisher.Visible = true
																	finisher.HoverImage = "rbxassetid://14783051124"
																	finisher.ImageColor3 = Color3.new(1, 1, 1)
																	local name2 = selectedItem.name

																	if localPlayer:GetAttribute("CurrentlyEquippedSword") == name2 then
																		local name3 = selectedItem.name

																		if getgenv().FinisherEquipped[name3] then
																			finisher.Image = "rbxassetid://15452502387"
																			finisher.Label.Text = "UNEQUIP"
																		else
																			finisher.Image = "rbxassetid://15452544682"
																			finisher.Label.Text = "EQUIP"
																		end
																	else
																		finisher.Visible = false
																	end
																end)
															end

															buyButton.PriceTag.TextLabel.Text = "Equipped"
															local sword2 = module:GetSword(name)
															local name2 = sword2.Name
															getgenv().Sword_Name = name2
															localPlayer:SetAttribute("CurrentlyEquippedSword", sword2.Name)
															module:EquipSwordTo(localPlayer.Character, sword2.Name)
															function_2(sword2.Name)

															for _, v98 in localPlayer.Character:GetChildren() do
																if v98:IsA("Model") and v98.Name ~= sword2.Name then
																	v98:Destroy()
																end
															end

															if table.find(favoriteSword, sword2.Name) then
																lastEquipped = sword2.Name
																fn30(favoriteSword, favoriteExplosion, lastEquipped)
															end

															local selectedItem2 = ShopController._selectedItem

															if selectedItem2 and selectedItem2.type == "Sword" then
																local data3 = selectedItem2.data

																if data3 and data3.HasFinisher then
																	finisher.Visible = true
																	finisher.HoverImage = "rbxassetid://14783051124"
																	finisher.ImageColor3 = Color3.new(1, 1, 1)

																	if localPlayer:GetAttribute("CurrentlyEquippedSword") == name then
																		if getgenv().FinisherEquipped[name] then
																			finisher.Image = "rbxassetid://15452502387"
																			finisher.Label.Text = "UNEQUIP"
																		else
																			finisher.Image = "rbxassetid://15452544682"
																			finisher.Label.Text = "EQUIP"
																		end
																	end
																else
																	finisher.Visible = false
																end
															else
																finisher.Visible = false
															end

															fn36()
														end

														if type_ == "Explosion" then
															buyButton.PriceTag.TextLabel.Text = "Equipped"
															str10 = name
															fn31(name)
															str8 = name

															if table.find(favoriteSword, name) then
																fn30(favoriteSword, favoriteExplosion, lastEquipped)
															end
														end
													end)

													for _, v97 in getconnections(favorite.Activated) do
														if v97 and v97.Function then
															v97:Disable()
														end
													end

													tbl18["Favorite Button Activated"] = favorite.Activated:Connect(function()
														local selectedItem = ShopController._selectedItem
														getgenv().Selected_Item = selectedItem
														if not selectedItem then
															return
														end

														if not ({ Sword = true, Explosion = true })[selectedItem.type] then
															return
														end
														local type_ = selectedItem.type
														local v97 = nil

														for _, v98 in ShopController._virtualItems[type_], nil, nil do
															if v98.Name == selectedItem.name then
																v97 = v98
																break
															else
																v97 = nil
															end
														end

														if not v97 then
															return
														end
														local favoriteState = InventoryController:GetFavoriteState(selectedItem.type, selectedItem.name)
														local isFavorited = not favoriteState:Get()
														favoriteState:Set(isFavorited)
														v97.IsFavorited = isFavorited

														if isFavorited then
															favorite.Image = "rbxassetid://15697987058"
															favorite.HoverImage = "rbxassetid://15697983062"
														else
															favorite.Image = "rbxassetid://15697981750"
															favorite.HoverImage = "rbxassetid://15697987058"
														end

														if isFavorited then
															v97._OriginalName_ = v97.Name_
															v97.Name_ = "#" .. v97.Name_
														elseif v97._OriginalName_ then
															v97.Name_ = v97._OriginalName_
														end

														local v98 = ShopController._inventoryPages[type_]

														if v98 then
															v98.MarkDirty(nil, false, true)
														end

														if selectedItem.type == "Sword" then
															if isFavorited then
																if not table.find(favoriteSword, selectedItem.name) then
																	table.insert(favoriteSword, selectedItem.name)
																end
															else
																for k, v99 in favoriteSword, nil, nil do
																	if v99 == selectedItem.name then
																		table.remove(favoriteSword, k)

																		if lastEquipped == selectedItem.name then
																			lastEquipped = nil
																		end

																		break
																	end
																end
															end
														end

														if selectedItem.type == "Explosion" then
															if isFavorited then
																if not table.find(favoriteExplosion, selectedItem.name) then
																	table.insert(favoriteExplosion, selectedItem.name)
																end
															else
																for k, v99 in favoriteExplosion, nil, nil do
																	if v99 == selectedItem.name then
																		table.remove(favoriteExplosion, k)
																		break
																	end
																end
															end
														end

														fn30(favoriteSword, favoriteExplosion, lastEquipped)
													end)

													local delete = shop.Holder.InfoBG.Delete
													local DeleteItemPromptController = require(ReplicatedStorage.Controllers.DeleteItemPromptController)

													tbl18["Shop Item Selected"] = ShopController.itemSelected:Connect(function()
														task.defer(function()
															local selectedItem = ShopController._selectedItem
															if not selectedItem then
																return
															end
															local name = selectedItem.name
															if not name then
																return
															end
															getgenv().Selected_Sword = name

															if selectedItem and (selectedItem.type == "Sword" and name ~= "Base Sword" or selectedItem.type == "Explosion" and name ~= "Explosion Normal") then
																delete.Visible = true
															end

															local attribute = localPlayer:GetAttribute("CurrentlyEquippedSword")

															if table.find(favoriteSword, selectedItem.name) then
																favorite.Image = "rbxassetid://15697987058"
																favorite.HoverImage = "rbxassetid://15697983062"
															end

															if table.find(favoriteExplosion, selectedItem.name) then
																favorite.Image = "rbxassetid://15697987058"
																favorite.HoverImage = "rbxassetid://15697983062"
															end

															if selectedItem.type == "Sword" then
																if name == attribute then
																	buyButton.PriceTag.TextLabel.Text = "Equipped"
																else
																	buyButton.PriceTag.TextLabel.Text = "Equip"

																	if n25 <= 7199 then
																		while true do
																		end
																	end
																end
															end

															if selectedItem.type == "Explosion" then
																if name == str8 then
																	buyButton.PriceTag.TextLabel.Text = "Equipped"
																else
																	buyButton.PriceTag.TextLabel.Text = "Equip"
																end
															end

															for k in tbl32, nil, nil do
																local v97 = ShopController._virtualItems[k]

																if v97 then
																	for _, v98 in v97, nil, nil do
																		if not v98.OwnsItem:Get() then
																			shop.Holder.InfoBG.Delete.Visible = false
																		end
																	end
																end
															end

															local selectedItem2 = ShopController._selectedItem

															if selectedItem2 and selectedItem2.type == "Sword" then
																local name2 = selectedItem2.name
																local data3 = selectedItem2.data

																if data3 and data3.HasFinisher then
																	finisher.Visible = true
																	finisher.HoverImage = "rbxassetid://14783051124"
																	finisher.ImageColor3 = Color3.new(1, 1, 1)

																	if localPlayer:GetAttribute("CurrentlyEquippedSword") == name2 then
																		if getgenv().FinisherEquipped[name2] then
																			finisher.Image = "rbxassetid://15452502387"
																			finisher.Label.Text = "UNEQUIP"
																		else
																			finisher.Image = "rbxassetid://15452544682"
																			finisher.Label.Text = "EQUIP"
																		end
																	end
																else
																	finisher.Visible = false
																end
															else
																finisher.Visible = false
															end
														end)
													end)

													for _, v97 in getconnections(finisher.Activated) do
														if v97 and v97.Function then
															v97:Disable()
														end
													end

													tbl18["Finisher Button Activated"] = finisher.Activated:Connect(function()
														local selectedItem = ShopController._selectedItem
														if not selectedItem then
															return
														end
														local name = selectedItem.name
														if selectedItem.type ~= "Sword" then
															return
														end

														if getgenv().FinisherEquipped[name] then
															local v97 = false
															getgenv().FinisherEquipped[name] = v97
															finisher.Image = "rbxassetid://15452544682"
															finisher.Label.Text = "EQUIP"
															local v98 = false
															getgenv().Selected_Finisher = v98
														else
															for k in getgenv().FinisherEquipped, nil, nil do
																local v97 = false
																getgenv().FinisherEquipped[k] = v97
															end

															getgenv().FinisherEquipped[name] = true
															getgenv().Selected_Finisher = name
															finisher.Image = "rbxassetid://15452502387"
															finisher.Label.Text = "UNEQUIP"
														end
													end)

													local client2 = require(ReplicatedStorage.Shared.Inventory).Client

													tbl18["Delete Button Activated"] = delete.Activated:Connect(function()
														local selectedItem = ShopController._selectedItem
														if not selectedItem then
															return
														end
														local type_ = selectedItem.type
														local name = selectedItem.name
														if not name then
															return
														end

														DeleteItemPromptController:PromptConfirmation({
															PromptType = "Single",
															Description = "Are you sure you want to delete x1 " .. name .. "? This cannot be undone.",
														}, function(arg)
															if not arg then
																return
															end

															if type_ == "Sword" and getgenv().Sword_Name == name then
																getgenv().Sword_Name = "Base Sword"
																local sword2 = module:GetSword("Base Sword")

																if sword2 then
																	module:EquipSwordTo(localPlayer.Character, sword2.Name)
																end

																if function_2 then
																	function_2(sword2.Name)
																end
															end

															local v97 = ShopController._virtualItems[type_]
															if not v97 then
																return
															end

															for k, v98 in v97, nil, nil do
																if v98.Name == name then
																	local v99 = ShopController._inventoryPages[type_]

																	if v99 and v99.Scroll then
																		v99.Scroll.RemoveInstance("Owned", v98)
																		v99.Scroll.RemoveInstance("Unowned", v98)
																	end

																	if v98.Trove then
																		v98.Trove:Destroy()
																	end

																	v97[k] = nil
																	break
																end
															end

															ShopController._selectedItem = nil
															buyButton.Visible = false
															shop.Holder.Favorite.Visible = false
															shop.Holder.InfoBG.Delete.Visible = false
															shop.Holder.InfoBG.Equips.EquipAccessory.Visible = false
															shop.Holder.InfoBG.Equips.Finisher.Visible = false
														end)
													end)

													local equipAccessory = shop.Holder.InfoBG.Equips.EquipAccessory
													local collection = require(replicatedInstances:WaitForChild("SwordAccessories")):GetCollection()

													local function fn33(arg, arg2)
														return require(ReplicatedStorage.Controllers.InventoryController):GetItem(arg, arg2)
													end

													local function fn34(arg)
														if typeof(arg) ~= "RBXScriptSignal" then
															return nil
														end
														local function_3 = nil

														for _, v97 in getconnections(arg) do
															function_3 = v97.Function
															v97:Disable()
														end

														return function_3
													end

													local tbl33 = {}

													local function fn35(arg)
														if tbl33[arg] == nil then
															tbl33[arg] = collection[arg]
														end
													end

													local function fn36(arg)
														return collection[arg] ~= nil
													end

													local function fn37(arg)
														fn35(arg)

														if fn36(arg) then
															collection[arg] = nil
														else
															collection[arg] = tbl33[arg]
														end

														task.defer(function()
															module:EquipSwordTo(localPlayer.Character or localPlayer.CharacterAdded:Wait(), arg)
														end)
													end

													local function fn38()
														local selectedItem = ShopController._selectedItem
														if not selectedItem then
															equipAccessory.Visible = false
															return
														end

														if selectedItem.type ~= "Sword" then
															equipAccessory.Visible = false
															return
														end
														local data3 = selectedItem.data
														if not data3 then
															equipAccessory.Visible = false
															return
														end

														if not data3.AccessoryToggleable then
															equipAccessory.Visible = false
															return
														end

														if data3.AccessoryUnlockable then
															local Sword = fn33("Sword", selectedItem.name)
															if not Sword then
																equipAccessory.Visible = false
																return
															end

															if not (Sword.HasAccessory and Sword.HasAccessory:Get()) then
																equipAccessory.Visible = false
																return
															end
														end

														local name = selectedItem.name
														if not (localPlayer:GetAttribute("CurrentlyEquippedSword") == name) then
															equipAccessory.Visible = false
															return
														end
														fn35(selectedItem.name)
														if tbl33[selectedItem.name] == nil then
															equipAccessory.Visible = false
															return
														end

														if tbl17.Flags.Unlock_All then
															equipAccessory.Visible = true
														else
															equipAccessory.Visible = true
														end

														local v97 = fn36(selectedItem.name)
														equipAccessory.HoverImage = "rbxassetid://14783051124"
														equipAccessory.ImageColor3 = Color3.new(1, 1, 1)
														equipAccessory.Image = v97 and "rbxassetid://15452502387" or "rbxassetid://15452544682"
														equipAccessory.Label.Text = v97 and "UNEQUIP ACCESSORY" or "EQUIP ACCESSORY"
													end

													localPlayer.PlayerGui.Shop.Holder.InfoBG.SecretUpgrade.Visible = false

													tbl18["Refresh Accessory Button"] = ShopController.itemSelected:Connect(function()
														task.defer(fn38)
													end)

													local v97 = fn34(equipAccessory.Activated)

													equipAccessory.Activated:Connect(function(...)
														local selectedItem = ShopController._selectedItem

														if not selectedItem or selectedItem.type ~= "Sword" then
															if v97 then
																return v97(...)
															end
															return
														end

														if not selectedItem.data or not selectedItem.data.AccessoryToggleable then
															if v97 then
																return v97(...)
															end
															return
														end

														fn37(selectedItem.name)
														fn38()
													end)

													local secretUpgrade = localPlayer.PlayerGui.Shop.Holder.InfoBG.SecretUpgrade
													local secretUpgrade2 = localPlayer.PlayerGui.SecretUpgrade

													tbl18["Secret Awaken Button"] = secretUpgrade.Activated:Connect(function()
														local selectedItem = ShopController._selectedItem
														if not selectedItem then
															return
														end
														local name = selectedItem.name
														if selectedItem.type ~= "Sword" then
															return
														end
														secretUpgrade2.Black.Visible = true
														secretUpgrade2.Main.Visible = true
														local swordIcon = Utils.Icons:GetSwordIcon("Awakened " .. name)
														secretUpgrade2.Main.template1.vector.Image = module:GetSword(name).Icon

														if not (n25 <= 7206) then
															secretUpgrade2.Main.template2.vector.Image = swordIcon
															secretUpgrade2.Main.template2.customs.c3.Visible = true
															local requirement = SecretAwakenData.Requirement
															local fill = secretUpgrade2.Main.Progress.Fill
															secretUpgrade2.Main.Progress.Progress.Text = requirement .. " / " .. requirement
															fill.Size = UDim2.fromScale(math.min(requirement / requirement, 1), 1)
															return
														end

														while true do
														end
													end)

													tbl18["Secret Awaken Button"] = secretUpgrade2.Main.Upgrade.Activated:Connect(function()
														local selectedItem = ShopController._selectedItem
														if not selectedItem then
															return
														end
														local type_ = selectedItem.type
														local name = selectedItem.name
														local v98 = ShopController._virtualItems[type_]

														if v98 then
															for k, v99 in v98, nil, nil do
																if v99.Name == name then
																	local v100 = ShopController._inventoryPages[type_]

																	if v100 and v100.Scroll then
																		v100.Scroll.RemoveInstance("Owned", v99)
																		v100.Scroll.RemoveInstance("Unowned", v99)
																	end

																	if v99.Trove then
																		v99.Trove:Destroy()
																	end

																	v98[k] = nil
																	break
																end
															end
														end

														local str11 = "Awakened " .. name

														for _, v99 in getgenv().Shop_Lists, nil, nil do
															getgenv().Values = v99

															if v99.Name == str11 then
																v99.ForceHide = false
																local sword2 = v99.Sword
																getgenv().Sword_Value = sword2
																local item = v99.Item
																v99.InventoryKey = client:ItemToKey(getgenv().Category, item) or v99.Name
																local inventoryKey = v99.InventoryKey
																getgenv().InventoryKey = inventoryKey
																break
															end
														end

														secretUpgrade.Visible = false
														secretUpgrade2.Black.Visible = false
														secretUpgrade2.Main.Visible = false

														ShopController:Select({
															type = "Sword",
															name = "Awakened " .. name,
															data = getgenv().Sword_Value,
															key = getgenv().InventoryKey,
														})

														ShopController:Open("Shop")
													end)

													tbl26 = {}
													tbl24 = {}

													for _, v98 in titleList:GetChildren() do
														if v98:IsA("ImageButton") or v98:IsA("Frame") then
															local v99 = v98:FindFirstChild("TextLabel")

															tbl26[v98] = {
																Name = v98.Name,
																Visible = v98.Visible,
																LabelText = v99 and v99.Text or nil,
																LabelColor = v99 and v99.TextColor3 or nil,
																LayoutOrder = v98.LayoutOrder,
															}
														end
													end

													for _, v98 in titleList:GetChildren() do
														if v98:IsA("ImageButton") or v98:IsA("Frame") then
															table.insert(tbl24, v98)
														end
													end

													table.sort(tbl24, function(arg, arg2)
														return arg.LayoutOrder < arg2.LayoutOrder
													end)

													for k, v98 in TitleData, nil, nil do
														local v99 = tbl24[k + 1]

														if v99 then
															local textLabel = v99:FindFirstChild("TextLabel")

															if textLabel then
																textLabel.Text = v98.Tag.Text
																textLabel.TextColor3 = v98.Tag.Color
															end

															v99.Name = v98.Name
															v99.Visible = true
															continue
														end

														break
													end

													for _, v98 in tbl24, nil, nil do
														if v98:IsA("ImageButton") then
															tbl18["Titles Row"] = v98.Activated:Connect(function()
																v90 = v98
																local n41 = v98.LayoutOrder - 1
																local v99 = TitleData[n41]

																if n41 == 0 then
																	tbl25 = nil
																else
																	tbl25 = { Text = v99.Tag.Text, Color = v99.Tag.Color }
																end

																for _, v100 in tbl24, nil, nil do
																	local selected = v100:FindFirstChild("Selected")

																	if selected then
																		selected.Visible = v100 == v90
																	end
																end
															end)
														end
													end

													if service.ChatVersion == Enum.ChatVersion.TextChatService then
														service.OnIncomingMessage = function(arg)
															local textSource = arg.TextSource

															if textSource and textSource.UserId == localPlayer.UserId then
																local textChatMessageProperties = Instance.new("TextChatMessageProperties")

																if tbl25 then
																	local text2 = tbl25.Text
																	local displayName = localPlayer.DisplayName
																	textChatMessageProperties.PrefixText = string.format("<font color=\"%s\">[%s]</font> <font color=\"%s\">%s</font>", fn32(tbl25.Color), text2, fn32(tbl25.Color), displayName)
																else
																	textChatMessageProperties.PrefixText = localPlayer.DisplayName
																end

																return textChatMessageProperties
															end
														end
													end

													local emoteWheel = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("EmoteWheel", 10)
													local holder = emoteWheel.Wheel.Holder
													local content = emoteWheel:WaitForChild("List", 10):WaitForChild("Content", 10)
													local children = ReplicatedStorage:WaitForChild("Misc", 10):WaitForChild("Emotes", 10):GetChildren()
													getgenv().Emotes_Datas = children
													tbl27 = {}

													for i = 1, 5 do
														tbl27[i] = {}

														for i2 = 1, 8 do
															local n41 = i2 + (i - 1) * 8
															local v98 = holder:FindFirstChild(tostring(i2))

															if v98 then
																tbl27[i][i2] = {
																	GlobalSlot = n41,
																	EmoteId = v98:GetAttribute("EmoteId"),
																	EmoteName = v98:GetAttribute("EmoteName"),
																	Icon = v98.Image,
																}
															end
														end
													end

													tbl28 = {}

													for _, v98 in localPlayer.PlayerGui.EmoteWheel.Menu.Content:GetChildren() do
														if v98:IsA("ImageButton") then
															local num = tonumber(v98.Name)

															if num then
																local vector = v98:FindFirstChild("Vector")
																local title = v98:FindFirstChild("Title")

																tbl28[num] = {
																	EmoteId = v98:GetAttribute("EmoteId"),
																	EmoteName = v98:GetAttribute("EmoteName"),
																	Icon = v98.Image,
																	GlobalSlot = v98:GetAttribute("GlobalSlot"),
																	VectorImage = vector and vector.Image or nil,
																	TitleText = title and title.Text or nil,
																}
															end
														end
													end

													local EmoteWheelController = require(ReplicatedStorage.Controllers.EmoteWheelController)

													local function fn39(arg)
														if not tbl17.Flags.Unlock_All then
															return
														end
														local n41 = arg + ((EmoteWheelController.page or 1) - 1) * 8
														local v98 = holder:FindFirstChild(tostring(arg))
														if not v98 then
															return
														end
														local attribute = v98:GetAttribute("EmoteId")
														local attribute2 = v98:GetAttribute("EmoteName")
														local image = v98.Image

														if not attribute or attribute == "" then
															data2[tostring(n41)] = nil
														else
															data2[tostring(n41)] = { EmoteId = attribute, EmoteName = attribute2, Icon = image }
														end

														fn29()
													end

													local n41 = 1

													for _, v98 in holder:GetChildren() do
														if v98 and v98:IsA("ImageButton") then
															local num = tonumber(v98.Name)

															tbl18["Emote Wheel Slot"] = v98.Activated:Connect(function()
																n41 = num
																fn39(num)
															end)
														end
													end

													local v98 = 1
													local content2 = localPlayer.PlayerGui.EmoteWheel.Menu.Content

													for _, v99 in content2:GetChildren() do
														if v99 and v99:IsA("ImageButton") then
															local num = tonumber(v99.Name)

															tbl18["Emote Wheel Slot Mobile"] = v99.Activated:Connect(function()
																v98 = num
																fn39(num)
															end)
														end
													end

													for _, v99 in holder:GetChildren() do
														if v99:IsA("ImageButton") then
															local global_slot = tonumber(v99.Name) + ((EmoteWheelController.page or 1) - 1) * 8
															local v100 = data2[tostring(global_slot)]

															if v100 then
																v99.Image = v100.Icon
																v99:SetAttribute("EmoteId", v100.EmoteId)
																v99:SetAttribute("EmoteName", v100.EmoteName)
																v99:SetAttribute("Icon", v100.Icon)
																local v101 = content2:FindFirstChild(tostring(v98))

																if v101 then
																	v101.Vector.Image = v100.Icon
																	v101.Title.Text = v100.EmoteName
																	v101:SetAttribute("EmoteId", v100.EmoteId)
																	v101:SetAttribute("EmoteName", v100.EmoteName)
																	fn39(v98)
																end
															else
															local v100 = children[global_slot]

															if v100 then
																v99.Image = v100:GetAttribute("Icon")
																v99:SetAttribute("EmoteId", v100.Name)
																v99:SetAttribute("EmoteName", v100:GetAttribute("EmoteName") or v100.Name)
																v99:SetAttribute("Icon", v100:GetAttribute("Icon"))
															end
														end
														end
													end

													tbl18["Emote Wheel Refresh"] = game:GetService("Players").LocalPlayer.CharacterAppearanceLoaded:Connect(function()
														local page = EmoteWheelController.page or 1

														for _, v99 in holder:GetChildren() do
															if v99:IsA("ImageButton") then
																local global_slot = tonumber(v99.Name) + (page - 1) * 8
																local v100 = data2[tostring(global_slot)]

																if v100 then
																	v99.Image = v100.Icon
																	v99:SetAttribute("EmoteId", v100.EmoteId)
																	v99:SetAttribute("EmoteName", v100.EmoteName)
																	v99:SetAttribute("Icon", v100.Icon)
																	local v101 = content2:FindFirstChild(tostring(v98))

																	if v101 then
																		v101.Vector.Image = v100.Icon
																		v101.Title.Text = v100.EmoteName
																		v101:SetAttribute("EmoteId", v100.EmoteId)
																		v101:SetAttribute("EmoteName", v100.EmoteName)
																		fn39(v98)
																	end
																else
																local v100 = children[global_slot]

																if v100 then
																	v99.Image = v100:GetAttribute("Icon")
																	v99:SetAttribute("EmoteId", v100.Name)
																	v99:SetAttribute("EmoteName", v100:GetAttribute("EmoteName") or v100.Name)
																	v99:SetAttribute("Icon", v100:GetAttribute("Icon"))
																end
															end
															end
														end
													end)

													local function fn40()
														if not tbl17.Flags.Unlock_All then
															return
														end
														local page = EmoteWheelController.page or 1

														for _, v99 in holder:GetChildren() do
															if v99:IsA("ImageButton") then
																local slot = tonumber(v99.Name)
																local v100 = data2[tostring(slot + (page - 1) * 8)]

																if v100 and v100.EmoteId and v100.Icon then
																	v99.Image = v100.Icon
																	v99:SetAttribute("EmoteId", v100.EmoteId)
																	v99:SetAttribute("EmoteName", v100.EmoteName or v100.EmoteId)
																	v99:SetAttribute("Icon", v100.Icon)
																	local v101 = content2:FindFirstChild(tostring(v98))

																	if v101 then
																		v101.Vector.Image = v100.Icon
																		v101.Title.Text = v100.EmoteName
																		v101:SetAttribute("EmoteId", v100.EmoteId)
																		v101:SetAttribute("EmoteName", v100.EmoteName)
																		fn39(v98)
																	end
																else
																local v100 = tbl27[page] and tbl27[page][slot]

																if v100 then
																	v99.Image = v100.Icon
																	v99:SetAttribute("EmoteId", v100.EmoteId)
																	v99:SetAttribute("EmoteName", v100.EmoteName)
																	v99:SetAttribute("Icon", v100.Icon)
																end
															end
															end
														end
													end

													local wheel = emoteWheel.Wheel

													for _, v99 in getconnections(wheel.Pages.Next.Activated) do
														if v99 and v99.Function then
															v99:Disable()
														end
													end

													for _, v99 in getconnections(wheel.Pages.Previous.Activated) do
														if v99 and v99.Function then
															v99:Disable()
														end
													end

													tbl18["Wheel.Pages.Next.Activated"] = wheel.Pages.Next.Activated:Connect(function()
														EmoteWheelController.page = EmoteWheelController.page % 5 + 1
														EmoteWheelController:updatePage()
														fn40()
													end)

													tbl18["Wheel.Pages.Previous.Activated"] = wheel.Pages.Previous.Activated:Connect(function()
														EmoteWheelController.page = EmoteWheelController.page <= 1 and 5 or EmoteWheelController.page - 1
														EmoteWheelController:updatePage()
														fn40()
													end)

													local pointer = emoteWheel.Wheel.Center.Pointer

													tbl18.Pointer = pointer:GetPropertyChangedSignal("Rotation"):Connect(function()
														local n42 = math.clamp(math.round((pointer.Rotation + 90) / 45), 1, 8)
														n41 = n42
														if not flag2 then
															return
														end
														fn39(n42)
													end)

													local localPlayer2 = game:GetService("Players").LocalPlayer
													local template = localPlayer2.PlayerGui.EmoteWheel.List.Content.UIGridLayout:FindFirstChild("TEMPLATE")
													local searchInput = localPlayer2.PlayerGui.EmoteWheel.List.SearchFrame.SearchBG.SearchInput
													local tbl34 = {}
													local folder = content:FindFirstChild("Folder")

													if folder then
														folder.Parent = ReplicatedStorage
													end

													local uiGridLayout = content:FindFirstChildWhichIsA("UIGridLayout")

													tbl23 = {
														LayoutCellPadding = uiGridLayout.CellPadding,
														LayoutCellSize = uiGridLayout.CellSize,
														FillDirectionMaxCells = uiGridLayout.FillDirectionMaxCells,
														SortOrder = uiGridLayout.SortOrder,
														ScrollingDirection = content.ScrollingDirection,
														AutomaticCanvasSize = content.AutomaticCanvasSize,
														TemplateVisible = template.Visible,
														Entries = {},
													}

													for _, v99 in content:GetChildren() do
														if v99:IsA("Frame") or v99:IsA("ImageButton") or v99:IsA("ImageLabel") then
															table.insert(tbl23.Entries, v99:Clone())
														end
													end

													uiGridLayout.CellPadding = UDim2.fromOffset(8, 8)
													uiGridLayout.CellSize = UDim2.fromScale(0.4, 0.4)
													uiGridLayout.FillDirectionMaxCells = 2
													uiGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
													content.ScrollingDirection = Enum.ScrollingDirection.Y
													content.AutomaticCanvasSize = Enum.AutomaticSize.Y

													table.sort(children, function(arg, arg2)
														local attribute = arg:GetAttribute("EmoteName") or arg.Name
														local attribute2 = arg2:GetAttribute("EmoteName") or arg2.Name
														local n42 = data[attribute] and 1 or 0
														local n43 = data[attribute2] and 1 or 0
														if n42 ~= n43 then
															return n42 > n43
														end
														return attribute < attribute2
													end)

													local v99 = 1

													for _, v100 in children, nil, nil do
														local attribute = v100:GetAttribute("EmoteName") or v100.Name

														if data[attribute] then
															local v101 = content2:FindFirstChild(tostring(v99))

															if v101 then
																local vector = v101:FindFirstChild("Vector")
																local title = v101:FindFirstChild("Title")

																if vector then
																	vector.Image = v100:GetAttribute("Icon")
																end

																if title then
																	title.Text = attribute
																end

																v101:SetAttribute("EmoteId", v100.Name)
																v101:SetAttribute("EmoteName", attribute)
																v99 += 1
																continue
															end
														else
															continue
														end

														break
													end

													local lock = localPlayer.PlayerGui.EmoteWheel.List.Content.UIGridLayout.TEMPLATE.Lock

													for k, v100 in children, nil, nil do
														local clone = template:Clone()
														clone.Name = "Emote_" .. k
														clone.LayoutOrder = k
														local clone2 = lock:Clone()
														clone2.Parent = clone
														local tbl35 = { "Emote1", "Emote2", "Emote3", "Emote4", "Emote5", "Emote6", "Emote7" }

														if table.find(tbl35, v100.Name) then
															clone2.Visible = true
														else
															clone2.Visible = false
														end

														local attribute = v100:GetAttribute("Icon")
														local attribute2 = v100:GetAttribute("EmoteName")
														local vector = clone:FindFirstChild("Vector")

														if vector then
															vector.Image = attribute
															vector.Size = UDim2.fromScale(0.9, 0.9)
															vector.SizeConstraint = Enum.SizeConstraint.RelativeYY
														end

														local itemName = clone:FindFirstChild("ItemName")

														if itemName then
															itemName.Text = attribute2
														end

														local favorite2 = clone:FindFirstChild("Favorite")

														if favorite2 then
															favorite2.Visible = true
														end

														local delete2 = clone:FindFirstChild("Delete")

														if delete2 then
															if table.find(tbl35, v100.Name) then
																delete2.Visible = false
															else
																delete2.Visible = true

																for _, v101 in getconnections(delete2.Activated) do
																	if v101 and v101.Function then
																		v101:Disable()
																	end
																end

																tbl18["Emotes Delete Prompt"] = delete2.Activated:Connect(function()
																	DeleteItemPromptController:PromptConfirmation({
																		PromptType = "Single",
																		Description = "Are you sure you want to delete x1 " .. attribute2 .. "? This cannot be undone.",
																	}, function(arg)
																		if arg then
																			clone:Destroy()
																		end
																	end)
																end)
															end
														end

														clone:SetAttribute("EmoteId", v100.Name)
														clone:SetAttribute("EmoteName", attribute2)
														table.insert(tbl34, clone)

														tbl18["Emote Entry"] = clone.Activated:Connect(function()
															local v101 = holder:FindFirstChild(tostring(n41))

															if v101 then
																v101.Image = attribute
																v101:SetAttribute("EmoteId", v100.Name)
																v101:SetAttribute("EmoteName", attribute2)
																fn39(n41)
																local v102 = content2:FindFirstChild(tostring(v98))

																if v102 then
																	v102.Vector.Image = attribute
																	v102.Title.Text = attribute2
																	v102:SetAttribute("EmoteId", v100.Name)
																	v102:SetAttribute("EmoteName", attribute2)
																	fn39(v98)
																end
															end
														end)

														tbl18["Hover Info Tip"] = clone.MouseEnter:Connect(function()
															localPlayer.PlayerGui.HoverInfo.Item.Visible = true
															local flag25 = table.find(tbl35, v100.Name) ~= nil
															local v101 = HoverInfoController
															local add = v101.Add
															local tbl36 = { IsCustom = false, Name = v100.Name }
															local v102 = "Description"
															local attribute3 = v100:GetAttribute("Description")
															tbl36[v102] = attribute3
															tbl36.TradeLock = flag25 and { Type = "Permanent" } or nil
															add(v101, clone, "Emote", tbl36)
														end)

														tbl18["Hover Info Tip Hide"] = clone.MouseLeave:Connect(function()
															localPlayer.PlayerGui.HoverInfo.Item.Visible = false
														end)

														tbl18["Hover Info Mobile"] = clone.InputBegan:Connect(function(input)
															if input.UserInputType == Enum.UserInputType.Touch then
																localPlayer.PlayerGui.HoverInfo.Item.Visible = true
																HoverInfoController:Add(clone, "Emote", { IsCustom = false, Name = v100.Name, Description = v100:GetAttribute("Description") })
															end
														end)

														tbl18["Hover Info Mobile End"] = clone.InputEnded:Connect(function(input)
															if input.UserInputType == Enum.UserInputType.Touch then
																localPlayer.PlayerGui.HoverInfo.Item.Visible = false
															end
														end)

														local favoriteState = InventoryController:GetFavoriteState("Emote", attribute2)

														if data[attribute2] then
															favoriteState:Set(true)
															favorite2.Image = "rbxassetid://15697987058"
															favorite2.HoverImage = "rbxassetid://15697983062"
														else
															favoriteState:Set(false)
															favorite2.Image = "rbxassetid://15697981750"
															favorite2.HoverImage = "rbxassetid://15697987058"
														end

														tbl18["Favorite Button"] = favorite2.Activated:Connect(function()
															local flag25 = not favoriteState:Get()
															favoriteState:Set(flag25)

															if flag25 then
																favorite2.Image = "rbxassetid://15697987058"
																favorite2.HoverImage = "rbxassetid://15697983062"
																data[attribute2] = true
															else
																favorite2.Image = "rbxassetid://15697981750"
																favorite2.HoverImage = "rbxassetid://15697987058"
																data[attribute2] = nil
															end

															fn28()

															table.sort(tbl34, function(arg, arg2)
																local attribute3 = arg:GetAttribute("EmoteName")
																local attribute4 = arg2:GetAttribute("EmoteName")
																local n42 = data[attribute3] and 1 or 0
																local n43 = data[attribute4] and 1 or 0
																if n42 ~= n43 then
																	return n42 > n43
																end
																return attribute3 < attribute4
															end)

															for k2, v101 in tbl34, nil, nil do
																v101.LayoutOrder = k2
															end
														end)

														clone.Parent = content
													end

													tbl18["SearchBox Text Change"] = searchInput:GetPropertyChangedSignal("Text"):Connect(function()
														local str11 = string.lower(searchInput.Text):gsub("^%s*(.-)%s*$", "%1")

														for _, v100 in tbl34, nil, nil do
															local v101 = string.lower(v100:GetAttribute("EmoteName") or "")
															v100.Visible = str11 == "" or string.find(v101, str11, 1, true)
														end
													end)

													for _, v100 in children, nil, nil do
														if v100:IsA("Animation") and v100:GetAttribute("EmoteName") then
															tbl20.storage[v100.Name] = v100
														end
													end

													EmoteController.Play = function(arg, arg2)
														tbl19.Play_Wheel_Emote_Animations(arg2)
													end

													local localPlayer3 = Players.LocalPlayer
													local deleteItems = v89:WaitForChild("Shop").Holder.DeleteItems

													local function fn41(arg, arg2)
														local v100 = ShopController._virtualItems[arg]
														if not v100 then
															return nil
														end

														for k, v101 in pairs(v100) do
															if v101 and (v101.Name == arg2 or k == arg2) then
																return v101
															end
														end

														return nil
													end

													local tbl35 = { Sword = {}, Explosion = {} }

													local function fn42(arg, arg2)
														if arg == "Sword" and getgenv().Sword_Name == arg2 then
															getgenv().Sword_Name = "Base Sword"
															getgenv().FinisherEquipped[arg2] = nil
															getgenv().Selected_Finisher = getgenv().FinisherEquipped["Base Sword"] and "Base Sword" or false
															local sword2 = module:GetSword("Base Sword")

															if sword2 then
																pcall(function()
																	module:EquipSwordTo(localPlayer3.Character, sword2.Name)
																end)

																if function_2 then
																	pcall(function()
																		function_2(sword2.Name)
																	end)
																end
															end
														elseif getgenv().FinisherEquipped then
															getgenv().FinisherEquipped[arg2] = nil
														end

														local v100 = fn41(arg, arg2)

														if v100 then
															v100.OwnsItem:Set(false)
															v100.Section = "Unowned"
															local v101 = ShopController._inventoryPages[arg]

															if v101 and v101.Scroll then
																pcall(function()
																	v101.Scroll.RemoveInstance("Owned", v100)
																end)

																pcall(function()
																	v101.Scroll.AddInstance("Unowned", v100)
																end)

																v101.MarkDirty(arg, false, true)
															end
														end

														tbl35[arg] = tbl35[arg] or {}
														tbl35[arg][arg2] = true
														ShopController._selectedItem = nil
													end

													local client3 = require(ReplicatedStorage.Shared.Inventory).Client

													local function fn43(arg, arg2)
														local ok, result = pcall(function()
															return client3:FindItemsWithKey(arg, arg2)
														end)

														return ok and result and #result > 0
													end

													local function fn44(arg)
														return arg == "Base Sword" or arg == "Explosion Normal"
													end

													local function fn45(arg)
														if not arg then
															return
														end

														pcall(function()
															arg.ForceHide = false
														end)

														pcall(function()
															arg.InDeleteMulti:Set(0)
														end)

														pcall(function()
															arg.Section = "Owned"
														end)

														local v100 = ShopController._inventoryPages[arg.type or arg.Type]
														arg.OwnsItem:Set(true)

														if v100 and v100.MarkDirty then
															pcall(function()
																v100.MarkDirty(arg, false, true)
															end)
														end
													end

													local function fn46()
														ShopController._multiDelete = nil

														pcall(function()
															ShopController:_updateMultiDeleteVisbility()
														end)

														pcall(function()
															ShopController:_updateMultiDelete()
														end)
													end

													local addToMultiDelete = ShopController._addToMultiDelete

													ShopController._addToMultiDelete = function(arg, arg2, arg3)
														if not tbl17.Flags.Unlock_All then
															return addToMultiDelete(arg, arg2, arg3)
														end

														if fn43(arg2, arg3) then
															return addToMultiDelete(arg, arg2, arg3)
														end

														if fn44(arg3) then
															return
														end

														if not arg._multiDelete or not arg._multiDelete[arg2] then
															return
														end
														local v100 = arg._multiDelete[arg2][arg3]
														if v100 and #v100 >= 1 then
															return
														end
														arg._multiDelete[arg2][arg3] = arg._multiDelete[arg2][arg3] or {}
														table.insert(arg._multiDelete[arg2][arg3], arg3)
														local v101 = arg._virtualItems[arg2] and arg._virtualItems[arg2][arg3]

														if v101 then
															if v101.InDeleteMulti then
																pcall(function()
																	v101.InDeleteMulti:Set(#arg._multiDelete[arg2][arg3])
																end)
															end

															pcall(function()
																v101.ForceHide = true
																local v102 = ShopController._inventoryPages[arg2]

																if v102 then
																	v102.MarkDirty(v101, false, true)
																end
															end)
														end

														arg:_updateMultiDelete()
													end

													local updateMultiDelete = ShopController._updateMultiDelete
													local scrollingFrame = shop.Holder.DeleteItems.List.ContentsCanvas.ScrollingFrame

													ShopController._updateMultiDelete = function(arg)
														if not tbl17.Flags.Unlock_All or not arg._multiDelete then
															return updateMultiDelete(arg)
														end

														for _, child in ipairs(scrollingFrame:GetChildren()) do
															if child:IsA("GuiObject") and child:GetAttribute("_FakeEntry") then
																local attribute = child:GetAttribute("_FakeType")
																local name = child.Name

																if not attribute or not arg._multiDelete[attribute] or not arg._multiDelete[attribute][name] or #arg._multiDelete[attribute][name] <= 0 then
																	child:Destroy()
																end
															end
														end

														for k, v100 in pairs(arg._multiDelete) do
															for k2, v101 in pairs(v100) do
																if not (#v101 <= 0) then
																	local v102 = scrollingFrame:FindFirstChild(k2)

																	if v102 and not v102:GetAttribute("_FakeEntry") then
																		v102 = nil
																	end

																	if not v102 then
																		local template2 = scrollingFrame:FindFirstChild("UIListLayout") and scrollingFrame.UIListLayout:FindFirstChild("Template")

																		if template2 then
																			local clone = template2:Clone()
																			clone.Name = k2
																			clone.Visible = true
																			clone:SetAttribute("_FakeEntry", true)
																			clone:SetAttribute("_FakeType", k)
																			clone:SetAttribute("InventoryType", k)

																			local function fn47()
																				if not arg._multiDelete or not arg._multiDelete[k] or not arg._multiDelete[k][k2] then
																					return
																				end
																				table.remove(arg._multiDelete[k][k2], 1)

																				if #arg._multiDelete[k][k2] <= 0 then
																					arg._multiDelete[k][k2] = nil
																					clone:Destroy()
																					fn45(arg._virtualItems[k] and arg._virtualItems[k][k2])
																				end

																				local v103 = arg._virtualItems[k] and arg._virtualItems[k][k2]

																				if v103 and v103.InDeleteMulti then
																					pcall(function()
																						v103.InDeleteMulti:Set(arg._multiDelete[k] and arg._multiDelete[k][k2] and #arg._multiDelete[k][k2] or 0)
																					end)
																				end

																				arg:_updateMultiDelete()
																			end

																			clone.Button.Activated:Connect(fn47)
																			clone.Button.Item.Activated:Connect(fn47)
																			clone.Parent = scrollingFrame
																			v102 = clone
																		end
																	end

																	if v102 then
																		local v103 = ItemInfo[k] and ItemInfo[k][k2]
																		v102.Button.Label.Text = v103 and v103.DisplayName or k2
																		v102.Button.Item.Label.Text = "x" .. #v101

																		if v103 and v103.Icon then
																			pcall(function()
																				v102.Button.Item.Vector.Image = v103.Icon
																			end)
																		end
																	end
																end
															end
														end

														updateMultiDelete(arg)
													end

													local function_3 = nil
													local function_4 = nil
													local delete2 = shop.Holder.DeleteItems.List.Buttons.Delete
													local cancel = shop.Holder.DeleteItems.List.Buttons.Cancel

													for _, v100 in getconnections(delete2.Activated) do
														if v100 and v100.Function then
															function_3 = v100.Function
															v100:Disable()
															break
														end
													end

													for _, v100 in getconnections(cancel.Activated) do
														if v100 and v100.Function then
															function_4 = v100.Function
															v100:Disable()
															break
														end
													end

													tbl18["Multi Delete Confirm"] = delete2.Activated:Connect(function()
														if not tbl17.Flags.Unlock_All or not ShopController._multiDelete then
															if function_3 then
																return function_3()
															end
															return
														end

														local tbl36 = {}
														local tbl37 = {}
														local v100 = 0
														local n42 = 0

														for k, v101 in pairs(ShopController._multiDelete) do
															for k2, v102 in pairs(v101) do
																if not (#v102 <= 0) then
																	if not fn43(k, k2) then
																		table.insert(tbl36, { type = k, name = k2 })
																		v100 += 1
																	else
																		tbl37[k] = tbl37[k] or {}

																		for _, v103 in ipairs(v102) do
																			table.insert(tbl37[k], v103)
																		end

																		n42 += #v102
																	end
																end
															end
														end

														if v100 + n42 == 0 then
															fn46()
															return
														end

														DeleteItemPromptController:PromptConfirmation({
															PromptType = "Single",
															Description = "Are you sure you want to delete x" .. v100 + n42 .. " items? This cannot be undone.",
														}, function(arg)
															if arg then
																for _, v101 in tbl36, nil, nil do
																	fn42(v101.type, v101.name)
																end

																buyButton.Visible = false
																shop.Holder.Favorite.Visible = false
																shop.Holder.InfoBG.Delete.Visible = false
																shop.Holder.InfoBG.Equips.EquipAccessory.Visible = false
																shop.Holder.InfoBG.Equips.Finisher.Visible = false
																fn46()
																ShopController._selectedItem = nil
															else
																for _, v101 in tbl36, nil, nil do
																	fn45(ShopController._virtualItems[v101.type] and ShopController._virtualItems[v101.type][v101.name])
																end
															end
														end)
													end)

													tbl18["Multi Delete Cancel"] = cancel.Activated:Connect(function()
														if not tbl17.Flags.Unlock_All then
															if function_4 then
																return function_4()
															end
															return
														end

														if ShopController._multiDelete then
															for k, v100 in pairs(ShopController._multiDelete) do
																for k2, v101 in pairs(v100) do
																	if #v101 > 0 then
																		fn45(ShopController._virtualItems[k] and ShopController._virtualItems[k][k2])

																		task.defer(function()
																			fn45(ShopController._virtualItems[k] and ShopController._virtualItems[k][k2])
																		end)
																	end
																end
															end
														end

														fn46()
													end)
												end)
											else
												if sword then
													local name = sword.Name
													getgenv().Sword_Name = name
													localPlayer:SetAttribute("CurrentlyEquippedSword", sword.Name)
													module:EquipSwordTo(localPlayer.Character, sword.Name)
													function_2(sword.Name)
												end

												str10 = ""
												local emoteWheel = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("EmoteWheel")
												local holder = emoteWheel.Wheel.Holder
												local content = emoteWheel:WaitForChild("List"):WaitForChild("Content")
												local template = game:GetService("Players").LocalPlayer.PlayerGui.EmoteWheel.List.Content.UIGridLayout:FindFirstChild("TEMPLATE")
												local tbl33 = {}
												local folder = ReplicatedStorage:FindFirstChild("Folder")

												if folder then
													folder.Parent = content
												end

												local uiGridLayout = content:FindFirstChildWhichIsA("UIGridLayout")

												if uiGridLayout then
													uiGridLayout.CellPadding = tbl23.LayoutCellPadding or UDim2.new(0, 8, 0, 8)
													uiGridLayout.CellSize = tbl23.LayoutCellSize or UDim2.new(0.400000006, 0, 0.400000006, 0)
													uiGridLayout.FillDirectionMaxCells = tbl23.FillDirectionMaxCells or 0
													uiGridLayout.SortOrder = tbl23.SortOrder or Enum.SortOrder.LayoutOrder
													content.ScrollingDirection = tbl23.ScrollingDirection or Enum.ScrollingDirection.Y
													content.AutomaticCanvasSize = tbl23.AutomaticCanvasSize or Enum.AutomaticSize.Y
												end

												template.Visible = tbl23.TemplateVisible

												for _, v96 in content:GetChildren() do
													if v96:IsA("Frame") or v96:IsA("ImageButton") or v96:IsA("ImageLabel") then
														v96:Destroy()
													end
												end

												if tbl23.Entries then
													for _, v96 in tbl23.Entries, nil, nil do
														v96:Clone().Parent = content
													end
												end

												table.clear(tbl33)
												local page = require(ReplicatedStorage.Controllers.EmoteWheelController).page or 1

												for _, v96 in holder:GetChildren() do
													if v96:IsA("ImageButton") then
														local num = tonumber(v96.Name)
														local v97 = tbl27[page] and tbl27[page][num]

														if v97 then
															v96.Image = v97.Icon
															v96:SetAttribute("EmoteId", v97.EmoteId)
															v96:SetAttribute("EmoteName", v97.EmoteName)
															v96:SetAttribute("Icon", v97.Icon)
															v96:SetAttribute("GlobalSlot", v97.GlobalSlot)
														end
													end
												end

												if tbl18["Emote Wheel Refresh"] then
													tbl18["Emote Wheel Refresh"]:Disconnect()
													tbl18["Emote Wheel Refresh"] = nil
												end

												for _, v96 in localPlayer.PlayerGui.EmoteWheel.Menu.Content:GetChildren() do
													if v96:IsA("ImageButton") then
														local v97 = tbl28[tonumber(v96.Name)]

														if v97 then
															v96.Image = v97.Icon
															v96:SetAttribute("EmoteId", v97.EmoteId)
															v96:SetAttribute("EmoteName", v97.EmoteName)
															v96:SetAttribute("Icon", v97.Icon)
															v96:SetAttribute("GlobalSlot", v97.GlobalSlot)
															local vector = v96:FindFirstChild("Vector")
															local title = v96:FindFirstChild("Title")

															if vector and v97.VectorImage then
																vector.Image = v97.VectorImage
															end

															if title and v97.TitleText then
																title.Text = v97.TitleText
															end
														end
													end
												end

												tbl24 = {}

												for _, v96 in titleList:GetChildren() do
													if v96:IsA("ImageButton") or v96:IsA("Frame") then
														table.insert(tbl24, v96)
													end
												end

												for _, v96 in tbl24, nil, nil do
													if v96 and tbl26[v96] then
														v96.Name = tbl26[v96].Name
														v96.Visible = tbl26[v96].Visible
														v96.LayoutOrder = tbl26[v96].LayoutOrder
														local textLabel = v96:FindFirstChild("TextLabel")

														if textLabel then
															textLabel.Text = tbl26[v96].LabelText
															textLabel.TextColor3 = tbl26[v96].LabelColor
														end

														local selected = v96:FindFirstChild("Selected")

														if selected then
															selected.Visible = false
														end
													end
												end

												if v88 then
													hookfunction(Shared.FindItems, v88)
												end

												local ShopController = require(ReplicatedStorage.Controllers.UI.ShopController)

												for k, v96 in tbl22, nil, nil do
													if k then
														k.OwnsItem:Set(v96.OwnsItem)
														k.Section = "Unowned"
														local v97 = ShopController._inventoryPages[v96.Category]

														if v97 and v97.MarkDirty then
															v97.MarkDirty(k, false, true)
														end
													end

													tbl22[k] = nil
												end

												localPlayer.PlayerGui.Shop.Holder.InfoBG.Delete.Visible = false
												local attribute = localPlayer:GetAttribute("CurrentlyEquippedSword")
												local selectedItem = ShopController._selectedItem
												if not selectedItem then
													return
												end
												local buyButton = localPlayer.PlayerGui.Shop.Holder.InfoBG.BuyButton

												if selectedItem.name == attribute then
													buyButton.PriceTag.TextLabel.Text = "Equipped"
												else
													buyButton.PriceTag.TextLabel.Text = "Equip"
												end

												if tbl18["Accessory Listener"] then
													tbl18["Accessory Listener"]:Disconnect()
													tbl18["Accessory Listener"] = nil
												end
											end
										end,
									})
								end
							end

							local tbl32

							do
								tbl18["Weapon Animation Fixer"] = localPlayer.CharacterAdded:Connect(function(character)
									for _, v96 in getconnections(character:GetAttributeChangedSignal("CurrentlyEquippedSword")) do
										if v96 then
											v96:Disable()
										end
									end

									tbl18["Weapon Attribute"] = character:GetAttributeChangedSignal("CurrentlyEquippedSword"):Connect(function()
										if not tbl17.Flags.Unlock_All then
											return
										end
										local attribute = character:GetAttribute("CurrentlyEquippedSword")
										local swordName = getgenv().Sword_Name

										if attribute ~= swordName then
											character:SetAttribute("CurrentlyEquippedSword", swordName)
										end

										if swordName then
											module:EquipSwordTo(character, swordName)
											function_2(swordName)
										end
									end)
								end)

								tbl18["Infinity Ball"] = ReplicatedStorage.Remotes.InfinityBall.OnClientEvent:Connect(function(arg, arg2)
									flag21 = arg2
								end)

								tbl18["Parry Animation Fix"] = ReplicatedStorage.Remotes.ParrySuccess.OnClientEvent:Connect(function()
									flag18 = true
									local humanoid = localPlayer.Character:FindFirstChild("Humanoid")

									if humanoid then
										for _, v96 in humanoid.Animator:GetPlayingAnimationTracks() do
											if v96.Name == "GrabParry" or v96.Name == "Grab" then
												v96:Stop(v96:GetAttribute("StopFadeTime"))
											end
										end
									end
								end)

								tbl18["Weapon Changer Event"] = ReplicatedStorage.Remotes.ParrySuccessAll.OnClientEvent:Connect(function(...)
									local tbl33 = { ... }
									local name = localPlayer.Name

									if tostring(tbl33[4]) == name then
										local sword2 = module:GetSword(localPlayer:GetAttribute("CurrentlyEquippedSword"))

										if sword2 and sword2.SlashName then
											tbl33[1] = sword2.SlashName
											tbl33[3] = sword2.Name
										end
									end

									return function_(unpack(tbl33))
								end)

								tbl32 = {}

								tbl19.Apply = function(arg, arg2)
									for k, v96 in arg2, nil, nil do
										arg[k] = v96
									end
								end

								tbl19.Billboard = function(arg, arg2)
									if arg == localPlayer then
										return
									end
									local head = (arg2 or arg.Character or arg.CharacterAdded:Wait()):WaitForChild("Head")
									local billboardGui = Instance.new("BillboardGui")

									tbl19.Apply(billboardGui, {
										Adornee = head,
										Size = UDim2.new(0, 200, 0, 50),
										StudsOffset = Vector3.new(0, 3, 0),
										AlwaysOnTop = true,
										Parent = head,
									})

									local textLabel = Instance.new("TextLabel")

									tbl19.Apply(textLabel, {
										Size = UDim2.new(1, 0, 1, 0),
										Text = "",
										TextColor3 = Color3.fromRGB(255, 255, 255),
										TextSize = 15,
										TextWrapped = false,
										BackgroundTransparency = 1,
										TextXAlignment = Enum.TextXAlignment.Center,
										TextYAlignment = Enum.TextYAlignment.Center,
										Parent = billboardGui,
									})

									tbl32[arg] = textLabel
								end

								do
									local tbl33 = {
										"Quad Jump",
										"Luck",
										"Reaper",
										"Misfortune",
										"Martyrdom",
										"Golden Ball",
										"Tact",
										"Scopophobia",
										"Bounty",
										"Qi-Charge",
										"Guardian Angel",
										"Virus",
									}

									local tbl34 = {
										["Guardian Angel"] = { ChargeAttr = "GuardianAngelParriesLeft", MaxCharges = 2 },
										["Quantum Arena"] = { ChargeAttr = "QuantumArenaCharge", MaxCharges = 3 },
										Necromancer = { ChargeAttr = "NecromancersLeft", MaxCharges = 3 },
										Blink = { ChargeAttr = "BlinkLeft", MaxCharges = 3 },
									}

									GetChargeInfo = function(arg, arg2)
										local v96 = tbl34[arg2]
										if not v96 then
											return nil
										end
										local playerFromCharacter = game.Players:GetPlayerFromCharacter(arg)
										local v97 = nil

										if arg:GetAttribute(v96.ChargeAttr) ~= nil then
											v97 = arg
										end

										if not (not v97 and playerFromCharacter and playerFromCharacter:GetAttribute(v96.ChargeAttr) ~= nil) then
											playerFromCharacter = v97
										end

										if not playerFromCharacter then
											local abilities = arg:FindFirstChild("Abilities")

											if abilities and abilities:GetAttribute(v96.ChargeAttr) ~= nil then
												playerFromCharacter = abilities
											end
										end

										playerFromCharacter = playerFromCharacter or arg
										local attribute = playerFromCharacter:GetAttribute(v96.ChargeAttr) or 0
										local maxCharges = v96.MaxCharges or 2

										if v96.MaxChargesAttr then
											maxCharges = playerFromCharacter:GetAttribute(v96.MaxChargesAttr) or maxCharges
										end

										local n41 = nil

										if v96.NextUseAttr then
											local attribute2 = playerFromCharacter:GetAttribute(v96.NextUseAttr)
											n41 = nil

											if attribute2 then
												local n42 = attribute2 - workspace:GetServerTimeNow()
												n41 = nil

												if n42 > 0 then
													n41 = tick() + n42
												end
											end
										end

										return { Charges = attribute, MaxCharges = maxCharges, CDEnd = n41 }
									end

									local tbl35 = {}
									local tbl36 = {}
									local tbl37 = {}
									local tbl38 = {}
									local tbl39 = {}
									local Abilities = require(game:GetService("ReplicatedStorage").Shared.Abilities)
									local tbl40 = {}
									local tbl41 = {}

									tbl18["Dribble Event Monitor"] = workspace.Alive.DescendantAdded:Connect(function(descendant)
										if descendant.Name ~= "DRIBBLE_IMMUNITY" then
											return
										end
										local model = descendant:FindFirstAncestorOfClass("Model")
										local playerFromCharacter = model and Players:GetPlayerFromCharacter(model)
										if not playerFromCharacter then
											return
										end

										if tbl40[playerFromCharacter] == nil then
											tbl40[playerFromCharacter] = 3
										end

										tbl40[playerFromCharacter] = math.max(tbl40[playerFromCharacter] - 1, 0)
										local v96 = Abilities.getAbilityCooldown(playerFromCharacter, "Dribble")

										if v96 and v96 > 0 then
											tbl41[playerFromCharacter] = tbl41[playerFromCharacter] or {}
											table.insert(tbl41[playerFromCharacter], workspace:GetServerTimeNow() + v96)
										end
									end)

									local tbl42 = {}
									local tbl43 = {}

									tbl18["Dragon Spirit Event Monitor"] = workspace.Runtime.ChildAdded:Connect(function(child)
										if child.Name ~= "GUARDIAN_DRAGON" then
											return
										end

										for _, v96 in Players:GetPlayers() do
											if v96:GetAttribute("EquippedAbility") == "Dragon Spirit" then
												if tbl42[v96] == nil then
													tbl42[v96] = 3
												end

												tbl42[v96] = math.max(tbl42[v96] - 1, 0)
												local v97 = Abilities.getAbilityCooldown(v96, "Dragon Spirit")

												if v97 and v97 > 0 then
													local serverTimeNow = workspace:GetServerTimeNow()

													if not tbl43[v96] or tbl43[v96] <= serverTimeNow then
														tbl43[v96] = serverTimeNow + v97 - 1
													end
												end
											end
										end
									end)

									local tbl44 = {}

									right:Create_Toggle({
										name = "Ability ESP",
										flag = "Ability_ESP",
										callback = function(arg)
											if arg then
												tbl18["Ability ESP"] = RunService.Heartbeat:Connect(function()
													local alive = workspace.Alive
													local dataAbilities = ReplicatedStorage.Misc.DataAbilities

													for k, v96 in tbl41, nil, nil do
														if tbl40[k] and tbl40[k] < 3 then
															local serverTimeNow = workspace:GetServerTimeNow()

															for i = #v96, 1, -1 do
																if v96[i] <= serverTimeNow then
																	tbl40[k] = math.min(tbl40[k] + 1, 3)
																	table.remove(v96, i)
																end
															end
														end
													end

													for k, v96 in tbl43, nil, nil do
														if tbl42[k] and tbl42[k] < 3 then
															local serverTimeNow = workspace:GetServerTimeNow()

															if v96 <= serverTimeNow then
																tbl42[k] = math.min(tbl42[k] + 1, 3)

																if tbl42[k] < 3 then
																	tbl43[k] = serverTimeNow + Abilities.getAbilityCooldown(k, "Dragon Spirit")
																else
																	tbl43[k] = nil
																end
															end
														end
													end

													for _, v96 in Players:GetPlayers() do
														if v96 and v96 ~= localPlayer and v96.Character then
															local attribute = v96.Character:GetAttribute("AbilityActive") or false
															local flag25 = tbl39[v96]

															if flag25 == nil then
																flag25 = false
															end

															local attribute2, v97, parent, abilityImage, attribute3, attribute4, upgrades, n41, flag26, v98, flag27, v99, str10, n42, v100, v101, n43, v102, n44, v103, n45, v104, n46, character, v105, n47, v106, v107, n48, flag28

															if attribute == flag25 then
																attribute2 = v96:GetAttribute("EquippedAbility")
																v97 = tbl32[v96]

																if v97 then
																	parent = v97.Parent
																	abilityImage = parent:FindFirstChild("AbilityImage")

																	if v96.Character.Parent == alive then
																		v97.Visible = true

																		if attribute2 then
																			attribute3 = dataAbilities:FindFirstChild(attribute2)
																			attribute4 = attribute3 and attribute3:GetAttribute("Icon")
																			attribute3 = attribute3 and attribute3:GetAttribute("Icon1")
																			upgrades = v96:FindFirstChild("Upgrades")
																			upgrades = upgrades and upgrades:FindFirstChild(attribute2)
																			upgrades = upgrades and upgrades.Value
																			n41 = upgrades or 0

																			if 0 < n41 then
																				flag26 = attribute3 and attribute3 ~= ""

																				if flag26 then
																					attribute4 = attribute3
																				end
																			end

																			v98 = tbl36[v96]
																			flag27 = not v96.Character:GetAttribute("AbilityActive") and not v98
																			v99 = tbl34[attribute2]

																			if table.find(tbl33, attribute2) then
																				str10 = "Passive"
																			elseif attribute2 == "Dribble" then
																				n42 = tbl40[v96] or 3
																				str10 = string.format("%d/%d Uses", n42, 3)
																				v100 = tbl41[v96]
																				v101 = v100 and v100[1]

																				if v101 then
																					n43 = v100[1] - workspace:GetServerTimeNow()

																					if n43 > 0 then
																						str10 ..= string.format(" (%.1fs)", n43)
																					end
																				end
																			elseif attribute2 == "Dragon Spirit" then
																				v102 = tbl42[v96]
																				n44 = v102 or 3
																				str10 = string.format("%d/%d Charges", n44, 3)
																				v103 = tbl43[v96]

																				if v103 then
																					n45 = v103 - workspace:GetServerTimeNow()

																					if n45 > 0 then
																						str10 ..= string.format(" (%.1fs)", n45)
																					end
																				end
																			elseif v99 then
																				v104 = GetChargeInfo(v96.Character, attribute2)

																				if v104 then
																					str10 = string.format("%d/%d Charges", v104.Charges, v104.MaxCharges)

																					if v104.CDEnd then
																						n46 = v104.CDEnd - workspace:GetServerTimeNow()

																						if 0 < n46 then
																							str10 ..= string.format(" (%.1fs)", n46)
																						end
																					end
																				else
																					str10 = "Charged"
																				end
																			else
																				character = v96.Character

																				if character:GetAttribute("AbilityActive") then
																					v105 = tbl37[v96]

																					if v105 then
																						n47 = v105 - workspace:GetServerTimeNow()

																						if n47 > 0 then
																							str10 = string.format("ACTIVE %.1fs", n47)
																						else
																							str10 = "No Active CD"
																						end
																					else
																						v106 = tbl35[v96]
																						str10 = ""

																						if v106 then
																							str10 = string.format("ACTIVE %.1fs", workspace:GetServerTimeNow() - v106)
																						end
																					end
																				else
																					v107 = tbl36[v96]

																					if v107 then
																						n48 = v107 - workspace:GetServerTimeNow()

																						if n48 > 0 then
																							str10 = string.format("%.1fs", n48)
																						else
																							tbl36[v96] = nil
																							str10 = "Ready"
																						end
																					else
																						str10 = ""

																						if flag27 then
																							str10 = "Ready"
																						end
																					end
																				end
																			end

																			v97.Text = v96.DisplayName .. " [" .. attribute2 .. " | " .. str10 .. "]"

																			if not abilityImage then
																				abilityImage = Instance.new("ImageLabel")
																				abilityImage.Name = "AbilityImage"
																				abilityImage.BackgroundTransparency = 1
																				abilityImage.Size = UDim2.new(0, 30, 0, 30)
																				abilityImage.Parent = parent
																				abilityImage.Position = UDim2.new(0.5, -30, 0, 0)
																			end

																			abilityImage.Position = UDim2.new(0.5, -15, 0, -v97.TextBounds.Y)
																			flag28 = attribute4 and attribute4 ~= ""

																			if flag28 then
																				abilityImage.Image = attribute4
																				abilityImage.Visible = true
																			else
																				abilityImage.Visible = false
																			end
																		else
																			v97.Visible = false
																			v97.Text = v96.DisplayName

																			if abilityImage then
																				abilityImage.Visible = false
																			end
																		end
																	else
																		v97.Visible = false

																		if abilityImage then
																			abilityImage.Visible = false
																		end
																	end
																end
															else
																v96:GetAttribute("EquippedAbility")

																if attribute then
																	local attribute5 = v96:GetAttribute("EquippedAbility")

																	if not attribute5 then
																		tbl39[v96] = attribute
																	else
																		local v108 = Abilities.getAbilityCooldown(v96, attribute5)
																		local serverTimeNow = workspace:GetServerTimeNow()
																		tbl35[v96] = serverTimeNow
																		tbl44[v96] = attribute5
																		local v109 = tbl38[attribute5]

																		if v109 then
																			tbl37[v96] = serverTimeNow + v109
																		else
																			tbl37[v96] = nil
																		end

																		if v108 and v108 > 0 then
																			tbl36[v96] = serverTimeNow + v108
																			tbl39[v96] = attribute
																			attribute2 = v96:GetAttribute("EquippedAbility")
																			v97 = tbl32[v96]

																			if v97 then
																				parent = v97.Parent
																				abilityImage = parent:FindFirstChild("AbilityImage")

																				if v96.Character.Parent == alive then
																					v97.Visible = true

																					if attribute2 then
																						attribute3 = dataAbilities:FindFirstChild(attribute2)
																						attribute4 = attribute3 and attribute3:GetAttribute("Icon")
																						attribute3 = attribute3 and attribute3:GetAttribute("Icon1")
																						upgrades = v96:FindFirstChild("Upgrades")
																						upgrades = upgrades and upgrades:FindFirstChild(attribute2)
																						upgrades = upgrades and upgrades.Value
																						n41 = upgrades or 0

																						if 0 < n41 then
																							flag26 = attribute3 and attribute3 ~= ""

																							if flag26 then
																								attribute4 = attribute3
																							end
																						end

																						v98 = tbl36[v96]
																						flag27 = not v96.Character:GetAttribute("AbilityActive") and not v98
																						v99 = tbl34[attribute2]

																						if table.find(tbl33, attribute2) then
																							str10 = "Passive"
																						elseif attribute2 == "Dribble" then
																							n42 = tbl40[v96] or 3
																							str10 = string.format("%d/%d Uses", n42, 3)
																							v100 = tbl41[v96]
																							v101 = v100 and v100[1]

																							if v101 then
																								n43 = v100[1] - workspace:GetServerTimeNow()

																								if n43 > 0 then
																									str10 ..= string.format(" (%.1fs)", n43)
																								end
																							end
																						elseif attribute2 == "Dragon Spirit" then
																							v102 = tbl42[v96]
																							n44 = v102 or 3
																							str10 = string.format("%d/%d Charges", n44, 3)
																							v103 = tbl43[v96]

																							if v103 then
																								n45 = v103 - workspace:GetServerTimeNow()

																								if n45 > 0 then
																									str10 ..= string.format(" (%.1fs)", n45)
																								end
																							end
																						elseif v99 then
																							v104 = GetChargeInfo(v96.Character, attribute2)

																							if v104 then
																								str10 = string.format("%d/%d Charges", v104.Charges, v104.MaxCharges)

																								if v104.CDEnd then
																									n46 = v104.CDEnd - workspace:GetServerTimeNow()

																									if 0 < n46 then
																										str10 ..= string.format(" (%.1fs)", n46)
																									end
																								end
																							else
																								str10 = "Charged"
																							end
																						else
																							character = v96.Character

																							if character:GetAttribute("AbilityActive") then
																								v105 = tbl37[v96]

																								if v105 then
																									n47 = v105 - workspace:GetServerTimeNow()

																									if n47 > 0 then
																										str10 = string.format("ACTIVE %.1fs", n47)
																									else
																										str10 = "No Active CD"
																									end
																								else
																									v106 = tbl35[v96]
																									str10 = ""

																									if v106 then
																										str10 = string.format("ACTIVE %.1fs", workspace:GetServerTimeNow() - v106)
																									end
																								end
																							else
																								v107 = tbl36[v96]

																								if v107 then
																									n48 = v107 - workspace:GetServerTimeNow()

																									if n48 > 0 then
																										str10 = string.format("%.1fs", n48)
																									else
																										tbl36[v96] = nil
																										str10 = "Ready"
																									end
																								else
																									str10 = ""

																									if flag27 then
																										str10 = "Ready"
																									end
																								end
																							end
																						end

																						v97.Text = v96.DisplayName .. " [" .. attribute2 .. " | " .. str10 .. "]"

																						if not abilityImage then
																							abilityImage = Instance.new("ImageLabel")
																							abilityImage.Name = "AbilityImage"
																							abilityImage.BackgroundTransparency = 1
																							abilityImage.Size = UDim2.new(0, 30, 0, 30)
																							abilityImage.Parent = parent
																							abilityImage.Position = UDim2.new(0.5, -30, 0, 0)
																						end

																						abilityImage.Position = UDim2.new(0.5, -15, 0, -v97.TextBounds.Y)
																						flag28 = attribute4 and attribute4 ~= ""

																						if flag28 then
																							abilityImage.Image = attribute4
																							abilityImage.Visible = true
																						else
																							abilityImage.Visible = false
																						end
																					else
																						v97.Visible = false
																						v97.Text = v96.DisplayName

																						if abilityImage then
																							abilityImage.Visible = false
																						end
																					end
																				else
																					v97.Visible = false

																					if abilityImage then
																						abilityImage.Visible = false
																					end
																				end
																			end
																		else
																			tbl39[v96] = attribute
																			attribute2 = v96:GetAttribute("EquippedAbility")
																			v97 = tbl32[v96]

																			if v97 then
																				parent = v97.Parent
																				abilityImage = parent:FindFirstChild("AbilityImage")

																				if v96.Character.Parent == alive then
																					v97.Visible = true

																					if attribute2 then
																						attribute3 = dataAbilities:FindFirstChild(attribute2)
																						attribute4 = attribute3 and attribute3:GetAttribute("Icon")
																						attribute3 = attribute3 and attribute3:GetAttribute("Icon1")
																						upgrades = v96:FindFirstChild("Upgrades")
																						upgrades = upgrades and upgrades:FindFirstChild(attribute2)
																						upgrades = upgrades and upgrades.Value
																						n41 = upgrades or 0

																						if 0 < n41 then
																							flag26 = attribute3 and attribute3 ~= ""

																							if flag26 then
																								attribute4 = attribute3
																							end
																						end

																						v98 = tbl36[v96]
																						flag27 = not v96.Character:GetAttribute("AbilityActive") and not v98
																						v99 = tbl34[attribute2]

																						if table.find(tbl33, attribute2) then
																							str10 = "Passive"
																						elseif attribute2 == "Dribble" then
																							n42 = tbl40[v96] or 3
																							str10 = string.format("%d/%d Uses", n42, 3)
																							v100 = tbl41[v96]
																							v101 = v100 and v100[1]

																							if v101 then
																								n43 = v100[1] - workspace:GetServerTimeNow()

																								if n43 > 0 then
																									str10 ..= string.format(" (%.1fs)", n43)
																								end
																							end
																						elseif attribute2 == "Dragon Spirit" then
																							v102 = tbl42[v96]
																							n44 = v102 or 3
																							str10 = string.format("%d/%d Charges", n44, 3)
																							v103 = tbl43[v96]

																							if v103 then
																								n45 = v103 - workspace:GetServerTimeNow()

																								if n45 > 0 then
																									str10 ..= string.format(" (%.1fs)", n45)
																								end
																							end
																						elseif v99 then
																							v104 = GetChargeInfo(v96.Character, attribute2)

																							if v104 then
																								str10 = string.format("%d/%d Charges", v104.Charges, v104.MaxCharges)

																								if v104.CDEnd then
																									n46 = v104.CDEnd - workspace:GetServerTimeNow()

																									if 0 < n46 then
																										str10 ..= string.format(" (%.1fs)", n46)
																									end
																								end
																							else
																								str10 = "Charged"
																							end
																						else
																							character = v96.Character

																							if character:GetAttribute("AbilityActive") then
																								v105 = tbl37[v96]

																								if v105 then
																									n47 = v105 - workspace:GetServerTimeNow()

																									if n47 > 0 then
																										str10 = string.format("ACTIVE %.1fs", n47)
																									else
																										str10 = "No Active CD"
																									end
																								else
																									v106 = tbl35[v96]
																									str10 = ""

																									if v106 then
																										str10 = string.format("ACTIVE %.1fs", workspace:GetServerTimeNow() - v106)
																									end
																								end
																							else
																								v107 = tbl36[v96]

																								if v107 then
																									n48 = v107 - workspace:GetServerTimeNow()

																									if n48 > 0 then
																										str10 = string.format("%.1fs", n48)
																									else
																										tbl36[v96] = nil
																										str10 = "Ready"
																									end
																								else
																									str10 = ""

																									if flag27 then
																										str10 = "Ready"
																									end
																								end
																							end
																						end

																						v97.Text = v96.DisplayName .. " [" .. attribute2 .. " | " .. str10 .. "]"

																						if not abilityImage then
																							abilityImage = Instance.new("ImageLabel")
																							abilityImage.Name = "AbilityImage"
																							abilityImage.BackgroundTransparency = 1
																							abilityImage.Size = UDim2.new(0, 30, 0, 30)
																							abilityImage.Parent = parent
																							abilityImage.Position = UDim2.new(0.5, -30, 0, 0)
																						end

																						abilityImage.Position = UDim2.new(0.5, -15, 0, -v97.TextBounds.Y)
																						flag28 = attribute4 and attribute4 ~= ""

																						if flag28 then
																							abilityImage.Image = attribute4
																							abilityImage.Visible = true
																						else
																							abilityImage.Visible = false
																						end
																					else
																						v97.Visible = false
																						v97.Text = v96.DisplayName

																						if abilityImage then
																							abilityImage.Visible = false
																						end
																					end
																				else
																					v97.Visible = false

																					if abilityImage then
																						abilityImage.Visible = false
																					end
																				end
																			end
																		end
																	end
																else
																	local v108 = tbl35[v96]
																	local v109 = tbl44[v96]

																	if v108 and v109 then
																		local n49 = workspace:GetServerTimeNow() - v108
																		local v110 = tbl38[v109]

																		if v110 then
																			tbl38[v109] = (v110 + n49) / 2
																		else
																			tbl38[v109] = n49
																		end
																	end

																	tbl35[v96] = nil
																	tbl37[v96] = nil
																	tbl44[v96] = nil
																	tbl39[v96] = attribute
																	attribute2 = v96:GetAttribute("EquippedAbility")
																	v97 = tbl32[v96]

																	if v97 then
																		parent = v97.Parent
																		abilityImage = parent:FindFirstChild("AbilityImage")

																		if v96.Character.Parent == alive then
																			v97.Visible = true

																			if attribute2 then
																				attribute3 = dataAbilities:FindFirstChild(attribute2)
																				attribute4 = attribute3 and attribute3:GetAttribute("Icon")
																				attribute3 = attribute3 and attribute3:GetAttribute("Icon1")
																				upgrades = v96:FindFirstChild("Upgrades")
																				upgrades = upgrades and upgrades:FindFirstChild(attribute2)
																				upgrades = upgrades and upgrades.Value
																				n41 = upgrades or 0

																				if 0 < n41 then
																					flag26 = attribute3 and attribute3 ~= ""

																					if flag26 then
																						attribute4 = attribute3
																					end
																				end

																				v98 = tbl36[v96]
																				flag27 = not v96.Character:GetAttribute("AbilityActive") and not v98
																				v99 = tbl34[attribute2]

																				if table.find(tbl33, attribute2) then
																					str10 = "Passive"
																				elseif attribute2 == "Dribble" then
																					n42 = tbl40[v96] or 3
																					str10 = string.format("%d/%d Uses", n42, 3)
																					v100 = tbl41[v96]
																					v101 = v100 and v100[1]

																					if v101 then
																						n43 = v100[1] - workspace:GetServerTimeNow()

																						if n43 > 0 then
																							str10 ..= string.format(" (%.1fs)", n43)
																						end
																					end
																				elseif attribute2 == "Dragon Spirit" then
																					v102 = tbl42[v96]
																					n44 = v102 or 3
																					str10 = string.format("%d/%d Charges", n44, 3)
																					v103 = tbl43[v96]

																					if v103 then
																						n45 = v103 - workspace:GetServerTimeNow()

																						if n45 > 0 then
																							str10 ..= string.format(" (%.1fs)", n45)
																						end
																					end
																				elseif v99 then
																					v104 = GetChargeInfo(v96.Character, attribute2)

																					if v104 then
																						str10 = string.format("%d/%d Charges", v104.Charges, v104.MaxCharges)

																						if v104.CDEnd then
																							n46 = v104.CDEnd - workspace:GetServerTimeNow()

																							if 0 < n46 then
																								str10 ..= string.format(" (%.1fs)", n46)
																							end
																						end
																					else
																						str10 = "Charged"
																					end
																				else
																					character = v96.Character

																					if character:GetAttribute("AbilityActive") then
																						v105 = tbl37[v96]

																						if v105 then
																							n47 = v105 - workspace:GetServerTimeNow()

																							if n47 > 0 then
																								str10 = string.format("ACTIVE %.1fs", n47)
																							else
																								str10 = "No Active CD"
																							end
																						else
																							v106 = tbl35[v96]
																							str10 = ""

																							if v106 then
																								str10 = string.format("ACTIVE %.1fs", workspace:GetServerTimeNow() - v106)
																							end
																						end
																					else
																						v107 = tbl36[v96]

																						if v107 then
																							n48 = v107 - workspace:GetServerTimeNow()

																							if n48 > 0 then
																								str10 = string.format("%.1fs", n48)
																							else
																								tbl36[v96] = nil
																								str10 = "Ready"
																							end
																						else
																							str10 = ""

																							if flag27 then
																								str10 = "Ready"
																							end
																						end
																					end
																				end

																				v97.Text = v96.DisplayName .. " [" .. attribute2 .. " | " .. str10 .. "]"

																				if not abilityImage then
																					abilityImage = Instance.new("ImageLabel")
																					abilityImage.Name = "AbilityImage"
																					abilityImage.BackgroundTransparency = 1
																					abilityImage.Size = UDim2.new(0, 30, 0, 30)
																					abilityImage.Parent = parent
																					abilityImage.Position = UDim2.new(0.5, -30, 0, 0)
																				end

																				abilityImage.Position = UDim2.new(0.5, -15, 0, -v97.TextBounds.Y)
																				flag28 = attribute4 and attribute4 ~= ""

																				if flag28 then
																					abilityImage.Image = attribute4
																					abilityImage.Visible = true
																				else
																					abilityImage.Visible = false
																				end
																			else
																				v97.Visible = false
																				v97.Text = v96.DisplayName

																				if abilityImage then
																					abilityImage.Visible = false
																				end
																			end
																		else
																			v97.Visible = false

																			if abilityImage then
																				abilityImage.Visible = false
																			end
																		end
																	end
																end
															end
														end
													end
												end)
											else
												for _, v96 in tbl32, nil, nil do
													v96.Visible = false
													local abilityImage = v96.Parent:FindFirstChild("AbilityImage")

													if abilityImage then
														abilityImage.Visible = false
													end
												end

												if tbl18["Ability ESP"] then
													tbl18["Ability ESP"]:Disconnect()
													tbl18["Ability ESP"] = nil
												end
											end
										end,
									})
								end
							end

							do
								do
									local v96

									do
										v96 = nil

										do
											local v97 = nil

											tbl19.Default_Avatar = function()
												if v97 then
													return v97
												end

												local ok, result = pcall(function()
													return Players:GetHumanoidDescriptionFromUserId(localPlayer.UserId)
												end)

												if ok and result then
													v97 = result
												end

												return v97
											end
										end
									end

									tbl19.Weld_Accessory = function(arg, arg2)
										local handle = arg:FindFirstChild("Handle")
										if not handle then
											return
										end
										local attachment = handle:FindFirstChildOfClass("Attachment")
										if not attachment then
											return
										end
										local v97 = arg2:FindFirstChild(attachment.Name, true)

										if not v97 then
											if not flag3 then
												return
											end
											return
										end

										local weld = Instance.new("Weld")
										weld.Name = "AccessoryWeld"
										weld.Part0 = handle
										weld.Part1 = v97.Parent
										weld.C0 = attachment.CFrame
										weld.C1 = v97.CFrame
										weld.Parent = handle
										handle.Anchored = false
									end

									tbl19.Apply_Avatar = function(parent)
										local humanoid = parent:WaitForChild("Humanoid")
										if parent:GetAttribute("Applied") == v96 then
											return
										end
										parent:SetAttribute("Applied", v96)

										local ok, result = pcall(function()
											return Players:GetHumanoidDescriptionFromUserId(v96)
										end)

										if not ok or not result then
											parent:SetAttribute("Applied", nil)
											return
										end

										local function fn33(arg)
											if arg:IsA("MeshPart") then
												return arg.MeshId
											end
											local specialMesh = arg:FindFirstChildOfClass("SpecialMesh")
											return specialMesh and specialMesh.MeshId or ""
										end

										local attribute = localPlayer:GetAttribute("CurrentlyEquippedSword")

										for _, v97 in parent:GetChildren() do
											if v97:IsA("Accessory") then
												if v97 ~= attribute then
													v97:Destroy()
												end
											elseif v97:IsA("Shirt") or v97:IsA("Pants") or v97:IsA("ShirtGraphic") or v97:IsA("BodyColors") or v97:IsA("CharacterMesh") then
												v97:Destroy()
											end
										end

										local ok2, result2 = pcall(function()
											return Players:CreateHumanoidModelFromDescription(result, humanoid.RigType)
										end)

										if not ok2 or not result2 then
											parent:SetAttribute("Applied", nil)
											return
										end

										local function fn34(arg, parent2)
											for _, child in ipairs(arg:GetChildren()) do
												if child:IsA("Attachment") then
													local v97 = parent2:FindFirstChild(child.Name)

													if v97 then
														v97.CFrame = child.CFrame
														v97.Position = child.Position
														v97.Orientation = child.Orientation
														v97.Axis = child.Axis
														v97.SecondaryAxis = child.SecondaryAxis
													else
														child:Clone().Parent = parent2
													end
												end
											end
										end

										for _, v97 in result2:GetChildren() do
											if v97:IsA("BasePart") and v97.Name ~= "HumanoidRootPart" then
												local v98 = parent:FindFirstChild(v97.Name)

												if v98 then
													if fn33(v97) ~= fn33(v98) then
														local specialMesh = v98:FindFirstChildOfClass("SpecialMesh")

														if specialMesh then
															specialMesh:Destroy()
														end

														local specialMesh2 = v97:FindFirstChildOfClass("SpecialMesh")

														if specialMesh2 then
															specialMesh2:Clone().Parent = v98
														end

														if v97:IsA("MeshPart") and v98:IsA("MeshPart") then
															v98.MeshId = v97.MeshId
															v98.TextureID = v97.TextureID
															fn34(v97, v98)
														end
													end
												end
											elseif v97:IsA("CharacterMesh") then
												v97:Clone().Parent = parent
											end
										end

										for _, v97 in result2:GetChildren() do
											if v97:IsA("Shirt") or v97:IsA("Pants") or v97:IsA("ShirtGraphic") or v97:IsA("BodyColors") then
												v97:Clone().Parent = parent
											elseif v97:IsA("Accessory") then
												local clone = v97:Clone()
												humanoid:AddAccessory(clone)
												tbl19.Weld_Accessory(clone, parent)
											end
										end

										local head = parent:FindFirstChild("Head")
										local head2 = result2:FindFirstChild("Head")

										if head and head2 then
											local decal = head:FindFirstChildOfClass("Decal")
											local decal2 = head2:FindFirstChildOfClass("Decal")

											if decal2 then
												if decal then
													decal.Texture = decal2.Texture
												else
													decal2:Clone().Parent = head
												end
											elseif decal then
												decal:Destroy()
											end
										end

										result2:Destroy()
									end

									do
										local Appearance = v95:Create_Section("Appearance", "left")

										Appearance:Create_Toggle({
											name = "Avatar Changer",
											flag = "Avatar_Changer",
											callback = function(arg)
												if arg then
													if v96 then
														tbl19.Apply_Avatar(localPlayer.Character or localPlayer.CharacterAdded:Wait())

														tbl18["Kill Feed Manager"] = localPlayer.PlayerGui.KillFeed.Frame.ChildAdded:Connect(function(child)
															local holder = child:FindFirstChild("Holder")
															if not holder then
																return
															end
															holder.Left.Vector.Image = "rbxthumb://type=AvatarHeadShot&id=" .. v96 .. "&w=100&h=100"
														end)
													end

													tbl18["Avatar Changer"] = localPlayer.CharacterAppearanceLoaded:Connect(function()
														tbl19.Apply_Avatar(localPlayer.Character or localPlayer.CharacterAdded:Wait())
													end)
												else
													local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
													character:SetAttribute("Applied", nil)
													local v97 = tbl19.Default_Avatar()

													if v97 then
														local ok, result = pcall(function()
															return Players:CreateHumanoidModelFromDescription(v97, character.Humanoid.RigType)
														end)

														if ok and result then
															local tbl33 = {}

															for _, v98 in result:GetChildren() do
																if v98:IsA("Accessory") then
																	table.insert(tbl33, v98:Clone())
																end
															end

															for _, v98 in character:GetChildren() do
																if v98:IsA("Shirt") or v98:IsA("Pants") or v98:IsA("ShirtGraphic") or v98:IsA("Accessory") or v98:IsA("BodyColors") or v98:IsA("CharacterMesh") then
																	v98:Destroy()
																end
															end

															local function fn33(arg2)
																if arg2:IsA("MeshPart") then
																	return arg2.MeshId
																end
																local specialMesh = arg2:FindFirstChildOfClass("SpecialMesh")
																return specialMesh and specialMesh.MeshId or ""
															end

															for _, v98 in result:GetChildren() do
																if v98:IsA("BasePart") and v98.Name ~= "HumanoidRootPart" then
																	local v99 = character:FindFirstChild(v98.Name)

																	if v99 then
																		if fn33(v98) ~= fn33(v99) then
																			local specialMesh = v99:FindFirstChildOfClass("SpecialMesh")

																			if specialMesh then
																				specialMesh:Destroy()
																			end

																			local specialMesh2 = v98:FindFirstChildOfClass("SpecialMesh")

																			if specialMesh2 then
																				specialMesh2:Clone().Parent = v99
																			end

																			if v98:IsA("MeshPart") and v99:IsA("MeshPart") then
																				v99.MeshId = v98.MeshId
																				v99.TextureID = v98.TextureID
																				v99.Size = v98.Size
																			end
																		end
																	end
																elseif v98:IsA("CharacterMesh") then
																	v98:Clone().Parent = character
																end
															end

															for _, v98 in result:GetChildren() do
																if v98:IsA("Shirt") or v98:IsA("Pants") or v98:IsA("ShirtGraphic") or v98:IsA("BodyColors") then
																	v98:Clone().Parent = character
																end
															end

															for _, v98 in tbl33, nil, nil do
																v98.Parent = character
																local handle = v98:FindFirstChild("Handle")

																if handle then
																	local attachment = handle:FindFirstChildWhichIsA("Attachment", true)

																	if attachment then
																		local v99 = character:FindFirstChild(attachment.Name, true)

																		if v99 then
																			local weld = Instance.new("Weld")
																			weld.Part0 = handle
																			weld.Part1 = v99.Parent
																			weld.C0 = attachment.CFrame
																			weld.C1 = v99.CFrame
																			weld.Parent = handle
																		end
																	end
																end
															end

															result:Destroy()
														end
													end

													if tbl18["Avatar Changer"] then
														if true then
															tbl18["Avatar Changer"]:Disconnect()
															tbl18["Avatar Changer"] = nil
														else
															while true do
															end
														end
													end

													if tbl18["Kill Feed Manager"] then
														tbl18["Kill Feed Manager"]:Disconnect()
														tbl18["Kill Feed Manager"] = nil
													end
												end
											end,
										})

										Appearance:Create_TextBox({
											name = "",
											placeholder = "...",
											default = "",
											flag = "Avatar_Saver",
											callback = function(arg)
												if not arg or arg == "" then
													localPlayer.Character:SetAttribute("Applied", nil)
													return
												end
												local num = tonumber(arg)

												if not num then
													local ok

													repeat
														task.wait()

														ok, num = pcall(function()
															return Players:GetUserIdFromNameAsync(arg)
														end)
													until ok
												end

												v96 = num

												if tbl17.Flags.Avatar_Changer then
													tbl19.Apply_Avatar(localPlayer.Character)

													tbl18["Kill Feed Manager"] = localPlayer.PlayerGui.KillFeed.Frame.ChildAdded:Connect(function(child)
														local holder = child:FindFirstChild("Holder")
														if not holder then
															return
														end
														holder.Left.Vector.Image = "rbxthumb://type=AvatarHeadShot&id=" .. v96 .. "&w=100&h=100"
													end)
												end
											end,
										})
									end

									tbl18["Encrypted Clone Detection"] = workspace.Alive.ChildAdded:Connect(function(child)
										if child.Name:find("ENCRYPTED CLONE", 1, true) then
											if tbl17.Flags.Avatar_Changer then
												local ok, result = pcall(function()
													return Players:GetHumanoidDescriptionFromUserId(v96)
												end)

												if ok and result then
													local ok2, result2 = pcall(function()
														return Players:CreateHumanoidModelFromDescription(result, child.Humanoid.RigType)
													end)

													if ok2 and result2 then
														tbl19.Apply_Avatar(child)
													end
												end
											end
										end
									end)
								end

								do
									local tbl33 = {}
									local FFlags = v95:Create_Section("FFlags", "right")

									FFlags:Create_Toggle({
										name = "FFlags",
										flag = "FFlags_Toggle",
										callback = function(arg)
											if not arg then
												if next(tbl33) == nil then
													return
												end

												for k, v96 in tbl33, nil, nil do
													if getfflag(k) then
														setfflag(k, v96)
													end
												end

												table.clear(tbl33)
											end
										end,
									})

									FFlags:Create_TextBox({
										name = "",
										placeholder = "...",
										default = "",
										flag = "FFlags_Saver",
										callback = function(arg)
											if not tbl17.Flags.FFlags_Toggle then
												return
											end

											if arg == "" then
												return
											end
											local n41 = 0

											for match, match2 in arg:gmatch("\"([^\"]+)\"%s*:%s*([^,%}%]]+)") do
												local str10 = match2:gsub("^%s+", ""):gsub("%s+$", "")

												if str10 == "true" then
													str10 = "True"
												elseif str10 == "false" then
													str10 = "False"
												elseif str10:match("^\".*\"$") then
													str10 = str10:sub(2, -2)
												end

												local str11 = match:gsub("^DFInt", ""):gsub("^DFFlag", ""):gsub("^FString", ""):gsub("^FLog", ""):gsub("^FFlag", ""):gsub("^DFint", ""):gsub("^FInt", "")

												if getfflag(str11) then
													if tbl33[str11] == nil then
														tbl33[str11] = tostring(getfflag(str11))
													end

													setfflag(str11, tostring(str10))
													n41 += 1
												elseif getfflag(match) then
													if tbl33[match] == nil then
														tbl33[match] = tostring(getfflag(match))
													end

													setfflag(match, tostring(str10))
													n41 += 1
												end
											end

											tbl17:Notify(("Applied %d FFlags."):format(n41), 5)
										end,
									})
								end
							end

							do
								local Devices = v95:Create_Section("Devices", "left")

								Devices:Create_Toggle({
									name = "Auto Rejoin",
									flag = "Device_Spoofer_Toggle",
									callback = function(deviceSpooferToggle)
										tbl17.Flags.Device_Spoofer_Toggle = deviceSpooferToggle

										if deviceSpooferToggle then
											if tbl17.Flags.Device_Saved ~= "" then
												tbl17:Notify("Apply Device Spoofer by rejoin", 5)
											end
										end
									end,
								})

								Devices:Create_Dropdown({
									name = "Device",
									options = { "PC", "Mobile", "Console" },
									default = "PC",
									flag = "Device_Spoofer_Saver",
									callback = function(deviceSaved)
										if deviceSaved == "Mobile" then
											deviceSaved = "Phone"
										end

										tbl17.Flags.Device_Saved = deviceSaved

										if writefile then
											writefile("Aries/Device_Spoofer_Device.txt", deviceSaved)
											writefile("Aries/air2.txt", "loadstring(game:HttpGet(\"https://gist.githubusercontent.com/Strvstys/7c189e78a6bc2d2b5eb013a7c1f25685/raw/b2a6dd94d98df3e1b74e791cce1765815cda95b1/tz.luau\"))()")
										end

										if tbl17.Flags.Device_Spoofer_Toggle then
											game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
										end

										pcall(queue_on_teleport, "loadstring(readfile(\"Aries/air2.txt\"))()")
									end,
								})
							end

							local v96

							do
								v96 = tbl17:Create_Tab({
									name = "Protection",
									section_name = "Settings",
									icon = "shield-half",
								})

								do
									local left = v96:Create_Section("left")

									left:Create_Toggle({
										name = "Cooldown Protection",
										flag = "Cooldown_Protection",
										callback = function(cooldownProtection)
											getgenv().Cooldown_Protection = cooldownProtection
										end,
									})

									left:Create_Toggle({
										name = "Phantom Protection",
										flag = "Phantom_Detection",
										callback = function(phantomDetection)
											tbl17.Flags.Phantom_Detection = phantomDetection
											local parryAccuracy = tbl17.Flags.Parry_Accuracy

											if phantomDetection then
												n40 = 0.8 + (parryAccuracy - 1) * 0.024747474747474751
												v92:SetValue(90)
												v94:SetValue(0)
											else
												n40 = 0.8 + (parryAccuracy - 1) * 0.0030303030303030303
											end
										end,
									})
								end
							end

							do
								local right2 = v96:Create_Section("right")

								right2:Create_Toggle({
									name = "Auto Ability",
									flag = "Auto_Ability",
									callback = function(autoAbility)
										getgenv().Auto_Ability = autoAbility
									end,
								})

								right2:Create_Toggle({
									name = "Dribble Preclick",
									flag = "Dribble_Preclick",
									callback = function(arg)
										if arg then
											local now3 = 0

											tbl18["Dribble Monitor"] = workspace.Alive.DescendantAdded:Connect(function(descendant)
												if descendant.Name == "DRIBBLE_IMMUNITY" then
													if descendant.Parent == localPlayer.Character then
														return
													end
													now3 = tick()
												end
											end)

											local function fn33(character)
												if tbl18["Dribble Highlight"] then
													tbl18["Dribble Highlight"]:Disconnect()
													tbl18["Dribble Highlight"] = nil
												end

												tbl18["Dribble Highlight"] = character.DescendantAdded:Connect(function(descendant)
													if descendant.Name == "FAKE_HIGHLIGHT" then
														if tbl17.Flags.Auto_Parry and arg and tick() - now3 <= 1 and not tbl19.Is_Curved() then
															tbl19.Play_Animation()
															tbl19.Parry(tbl17.Flags.Parry_Type)
														end
													end
												end)
											end

											if localPlayer.Character then
												fn33(localPlayer.Character)
											end

											tbl18["Character Added"] = localPlayer.CharacterAdded:Connect(fn33)
										else
											if tbl18["Dribble Monitor"] then
												tbl18["Dribble Monitor"]:Disconnect()
												tbl18["Dribble Monitor"] = nil
											end

											if tbl18["Dribble Highlight"] then
												tbl18["Dribble Highlight"]:Disconnect()
												tbl18["Dribble Highlight"] = nil
											end

											if tbl18["Character Added"] then
												tbl18["Character Added"]:Disconnect()
												tbl18["Character Added"] = nil
											end
										end
									end,
								})
							end

							v96:Create_Section("Movements", "left"):Create_Toggle({
								name = "Anti Double Jump",
								flag = "Anti_Double_Jump",
								callback = function(arg)
									local ContextActionService = game:GetService("ContextActionService")

									if arg then
										local humanoid = (localPlayer.Character or localPlayer.CharacterAdded:Wait()):WaitForChild("Humanoid")
										local flag25 = false
										local flag26 = false

										tbl18["Anti Double Jump State"] = humanoid.StateChanged:Connect(function(old, new)
											if new == Enum.HumanoidStateType.Jumping then
												flag25 = true

												if n25 >= 7225 then
													while true do
													end
												end
											elseif new == Enum.HumanoidStateType.Landed or new == Enum.HumanoidStateType.Running then
												flag25 = false
												flag26 = false
											end
										end)

										tbl18["Anti Double Jump Input"] = UserInputService.InputBegan:Connect(function(input, gameProcessed)
											if gameProcessed then
												return
											end

											if input.KeyCode == Enum.KeyCode.Space and flag25 and not flag26 then
												flag26 = true
												humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
											end
										end)
									else
										if tbl18["Anti Double Jump State"] then
											tbl18["Anti Double Jump State"]:Disconnect()
											tbl18["Anti Double Jump State"] = nil
										end

										if tbl18["Anti Double Jump Input"] then
											tbl18["Anti Double Jump Input"]:Disconnect()
											tbl18["Anti Double Jump Input"] = nil
										end

										ContextActionService:UnbindAction("BlockAirJump")
									end
								end,
							})

							tbl18["Infinity Ball"] = ReplicatedStorage.Remotes.InfinityBall.OnClientEvent:Connect(function(arg, arg2)
								flag21 = arg2
							end)

							tbl18["Parry Animation Fix"] = ReplicatedStorage.Remotes.ParrySuccess.OnClientEvent:Connect(function()
								flag18 = true
								local humanoid = localPlayer.Character:FindFirstChild("Humanoid")

								if humanoid then
									for _, v97 in humanoid.Animator:GetPlayingAnimationTracks() do
										if v97.Name == "GrabParry" or v97.Name == "Grab" then
											v97:Stop(v97:GetAttribute("StopFadeTime"))
										end
									end
								end
							end)

							tbl18["Keybinds Parry Types"] = UserInputService.InputBegan:Connect(function(input, gameProcessed)
								if gameProcessed then
									return
								end
								local keyCode = input.KeyCode
								local parryType

								if str9 == "1469854796877140161" then
									parryType = nil

									if keyCode == Enum.KeyCode.One then
										parryType = tbl17.Flags.Parry_Type == "Backwards" and "Camera" or "Backwards"
									end

									if keyCode == Enum.KeyCode.Two then
										parryType = tbl17.Flags.Parry_Type == "Dot Pointer" and "Camera" or "Dot Pointer"
									end

									if keyCode == Enum.KeyCode.Three then
										parryType = tbl17.Flags.Parry_Type == "Dot" and "Camera" or "Dot"
									end

									if keyCode == Enum.KeyCode.Four then
										parryType = tbl17.Flags.Parry_Type == "FFA" and "Camera" or "FFA"
									end
								else
									local flag25 = keyCode == Enum.KeyCode.Z or keyCode == Enum.KeyCode.One
									parryType = nil

									if flag25 then
										parryType = tbl17.Flags.Parry_Type == "Backwards" and "Camera" or "Backwards"
									end

									if keyCode == Enum.KeyCode.X or keyCode == Enum.KeyCode.Two then
										parryType = tbl17.Flags.Parry_Type == "Dot Pointer" and "Camera" or "Dot Pointer"
									end

									if keyCode == Enum.KeyCode.C or keyCode == Enum.KeyCode.Three then
										parryType = tbl17.Flags.Parry_Type == "Dot" and "Camera" or "Dot"
									end

									if keyCode == Enum.KeyCode.Four then
										parryType = tbl17.Flags.Parry_Type == "FFA" and "Camera" or "FFA"
									end
								end

								if parryType then
									tbl17.Flags.Parry_Type = parryType
									v93:SetValue(tbl17.Flags.Parry_Type)

									if tbl17.Flags.Auto_Parry_Notification then
										tbl17:Notify("Parry Type = " .. tostring(tbl17.Flags.Parry_Type), 3)
									end
								end
							end)

							tbl18["Is Curved Event"] = ReplicatedStorage.Remotes.ParrySuccessAll.OnClientEvent:Connect(function(arg, arg2)
								local primaryPart = localPlayer.Character.PrimaryPart

								for _, v97 in tbl19.Get_Balls(), nil, nil do
									if not v97 then
										return
									end
									local zoomies = v97:FindFirstChild("zoomies")
									if not zoomies then
										return
									end
									local magnitude = zoomies.VectorVelocity.Magnitude
									local position

									if v97 == v87 and v86 then
										position = v86
									else
										position = v97.Position
									end

									local magnitude2 = (localPlayer.Character.PrimaryPart.Position - position).Magnitude
									local v98 = (localPlayer.Character.PrimaryPart.Position - position).Unit:Dot(zoomies.VectorVelocity.Unit)
									local v99 = "Data Ping"
									local value = game:GetService("Stats").Network.ServerStatsItem[v99]:GetValue()
									local n41 = math.min(magnitude / 100, 40)
									local n42 = magnitude2 / magnitude - value / 1000
									local flag25 = magnitude > 100
									local n43 = 40 * math.max(v98, 0)
									local n44 = 15 - math.min(magnitude2 / 1000, 15) + n43 + n41

									if flag25 and n42 > value / 10 then
										n44 = math.max(n44 - 15, 15)
									end

									if arg2 ~= primaryPart and magnitude2 > n44 then
										tbl21.Curving = tick()
									end
								end
							end)

							ReplicatedStorage.Remotes.Phantom.OnClientEvent:Connect(function(arg, arg2)
								if arg2.Name == localPlayer.Name then
									flag24 = true

									task.delay(0.35, function()
										flag24 = false
									end)
								end
							end)

							tbl18["Phantom Detection"] = workspace.Runtime.ChildAdded:Connect(function(child)
								local name = child.Name

								if tbl17.Flags.Phantom_Detection and (name == "maxTransmission" or name == "transmissionpart") then
									local weldConstraint = child:FindFirstChildWhichIsA("WeldConstraint")

									if weldConstraint then
										local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()

										if character and weldConstraint.Part1 and weldConstraint.Part1:IsDescendantOf(character) then
											local v97 = tbl19.Client_Ball()

											if v97 and v97:GetAttribute("highlighted") then
												flag24 = true

												task.delay(0.35, function()
													flag24 = false
												end)
											end

											weldConstraint:Destroy()

											if v97 then
												local v98 = character:FindFirstChild("Humanoid")
												local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
												local flag25 = false
												local flag26 = false
												local now3 = os.clock()

												tbl18["Phantom Loop"] = RunService.Heartbeat:Connect(function()
													if not v97 or not v97.Parent then
														return
													end

													if not v97:GetAttribute("highlighted") then
														if tbl18["Phantom Loop"] then
															tbl18["Phantom Loop"]:Disconnect()
														end

														if v98 then
															task.delay(5, function()
																flag24 = false
															end)
														end

														v97 = nil
														return
													end

													if v98 and humanoidRootPart and v97 then
														if not flag25 then
															flag25 = true
															now3 = os.clock()
														end

														if flag25 and not flag26 and os.clock() - now3 >= 0.1 then
															flag26 = true
															local abilities = character:FindFirstChild("Abilities")

															if abilities then
																local flag27 = false

																for _, v99 in {
																	"Calming Deflection",
																	"Raging Deflection",
																	"Rapture",
																	"Aerodynamic Slash",
																	"Forcefield",
																	"Infinity",
																	"Fracture",
																	"Invisibility",
																	"Singularity",
																	"Ninja Dash",
																	"Phantom",
																	"Quantum Arena",
																}, nil, nil do
																	local v100 = abilities:FindFirstChild(v99)
																	if v100 and v100.Enabled then
																		flag27 = true
																		break
																	end
																end

																if flag27 then
																	if getgenv().Parry_Cooldown.Offset.Y < 0.5 then
																		ReplicatedStorage.Remotes.AbilityButtonPress:Fire()
																	end
																end
															end
														end
													end
												end)

												task.delay(3, function()
													if tbl18["Phantom Loop"] and tbl18["Phantom Loop"].Connected then
														tbl18["Phantom Loop"]:Disconnect()
														v97 = nil
														flag24 = false
													end
												end)
											end
										end
									end
								end
							end)

							workspace.Runtime.ChildAdded:Connect(function(child)
								if child.Name == "Tornado" then
									now2 = tick()

									tbl18["Tornado Time"] = child:GetAttributeChangedSignal("TornadoTime"):Connect(function()
										now2 = tick()
									end)

									tbl18["Tornado Destroying"] = child.Destroying:Connect(function()
										now2 = nil
									end)
								end
							end)

							workspace.Balls.ChildAdded:Connect(function(child)
								if child:GetAttribute("realBall") then
									getgenv().Time_View = 5
									n33 = 0
									n34 = 5
									n32 = 0
									n35 = 0
									n36 = 5
									n37 = 0
									Real_Count = 0
									FirstHitIsReal = false
									flag19 = false
									FirstHit = nil
									flag20 = nil

									tbl18["Target Connection"] = child:GetAttributeChangedSignal("target"):Connect(function()
										flag22 = false
									end)

									tbl18["Target Destroying"] = child.Destroying:Connect(function()
										if tbl18["Target Connection"] then
											tbl18["Target Connection"]:Disconnect()
											tbl18["Target Connection"] = nil
										end
									end)
								end
							end)

							tbl18["Ball Added"] = ReplicatedStorage.Remotes.BallAdded.OnClientEvent:Connect(function()
								Color_Applied = false
								getgenv().Time_View = 5
								n33 = 0
								n34 = 5
								n32 = 0
								n35 = 0
								n36 = 5
								n37 = 0
								Real_Count = 0
								FirstHitIsReal = false
								flag19 = false
								FirstHit = nil
								flag20 = nil
								Last_Parry2 = 0
							end)

							tbl18["Ball Removed"] = workspace.Balls.ChildRemoved:Connect(function()
								Color_Applied = false
								getgenv().Time_View = 5
								n33 = 0
								n34 = 5
								n32 = 0
								n35 = 0
								n36 = 5
								n37 = 0
								Real_Count = 0
								FirstHitIsReal = false
								flag19 = false
								FirstHit = nil
								flag20 = nil
								Last_Parry2 = 0
								Last_FFA_Target = nil
							end)

							tbl18["Finisher Connection"] = ReplicatedStorage.Remotes.Killed.OnClientEvent:Connect(function()
								if not workspace.ShowdownActive.Value then
									return
								end

								for _, v97 in workspace.Alive:GetChildren() do
									if v97 == localPlayer.Name then
										continue
									end
									local n41 = (localPlayer.Character.HumanoidRootPart.Position + v97.HumanoidRootPart.Position) / 2
									local cframe = CFrame.new(n41, n41 + (localPlayer.Character.HumanoidRootPart.Position - v97.HumanoidRootPart.Position).Unit)
									if not getgenv().Selected_Finisher then
										return
									end
									local character = localPlayer.Character
									local v98 = workspace
									local getServerTimeNow = v98.GetServerTimeNow
									FinishersController:PlayFinisher(getgenv().Selected_Finisher, character, v97, cframe, getServerTimeNow(v98))
								end
							end)

							task.spawn(function()
								for _, v97 in Players:GetPlayers() do
									if v97 ~= localPlayer then
										tbl19.Billboard(v97)
									end

									v97.CharacterAdded:Connect(function(character)
										tbl19.Billboard(v97, character)
									end)
								end

								Players.PlayerAdded:Connect(function(player)
									if player ~= localPlayer then
										player.CharacterAdded:Connect(function(character)
											tbl19.Billboard(player, character)
										end)
									end
								end)

								Players.PlayerRemoving:Connect(function(player)
									tbl32[player] = nil
								end)
							end)

							if byteUi then
								for _, v97 in tbl18, nil, nil do
									v97:Disconnect()
								end

								for _, v97 in tbl31, nil, nil do
									v97:Disconnect()
								end

								byteUi:Destroy()
							end

							return
						end

						while true do
						end
					end
				end
			end
		end
	end


end

