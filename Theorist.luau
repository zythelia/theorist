-- src/shared/Main.luau

local VersionInfo = {
    Version = "1.0.0",
}

local LibraryInfo = {
    Author = "JAVENCIER",
    Contributors = {
        "JAVENCIER",
    },
    Description = "A math library for Roblox, made by JAVENCIER.",
}

local RunService = game:GetService("RunService")

local Main = {}

function Main.Init()
    print("Theorist is RUNNING on version: " .. VersionInfo.Version)
    print(LibraryInfo)
end

function Main.GetVersion()
    return VersionInfo.Version
end

function Main.GetInfo()
    return LibraryInfo
end

function Main.GetAll()
    return {
        Version = VersionInfo.Version,
        Information = LibraryInfo,
    }
end

function Main.GetAuthor()
    return LibraryInfo.Author
end

function Main.GetContributors()
    return LibraryInfo.Contributors
end

function Main.Factorial(N)
    if typeof(N) ~= "number" or N < 0 or N % 1 ~= 0 then
        error(string.format("Invalid input: %s. Please provide a non-negative integer.", tostring(N)))
    end
    local Result = 1
    for I = 2, N do
        Result *= I
    end
    return Result
end

function Main.UpDown(Object, Amplitude, Frequency)
    local Original = Object:IsA("GuiObject") and Object.Position or Object.CFrame
    if RunService:IsRunning() then
        RunService.Heartbeat:Connect(function()
            local Sin = math.sin(tick() * Frequency) * Amplitude
            if Object:IsA("GuiObject") then
                Object.Position = Original + UDim2.new(0, 0, Sin, 0)
            else
                Object.CFrame = Original * CFrame.new(0, Sin, 0)
            end
        end)
    end
end

function Main.LeftRight(Object, Amplitude, Frequency)
    local Original = Object:IsA("GuiObject") and Object.Position or Object.CFrame
    if RunService:IsRunning() then
        RunService.Heartbeat:Connect(function()
            local Sin = math.sin(tick() * Frequency) * Amplitude
            if Object:IsA("GuiObject") then
                Object.Position = Original + UDim2.new(Sin, 0, 0, 0)
            else
                Object.CFrame = Original * CFrame.new(Sin, 0, 0)
            end
        end)
    end
end

function Main.E()
    return 2.718281828459045
end

function Main.EUx(N)
    return 2.718281828459045 * N
end

function Main.EUd(N)
    return 2.718281828459045 / N
end

function Main.Exp(N)
    return math.exp(N)
end

function Main.Clamp(N, Min, Max)
    return math.max(Min, math.min(N, Max))
end

function Main.Round(N, DecimalPlaces)
    local Factor = 10 ^ (DecimalPlaces or 0)
    return math.floor(N * Factor + 0.5) / Factor
end

function Main.Lerp(A, B, T)
    return A + (B - A) * T
end

function Main.InverseLerp(A, B, V)
    return (V - A) / (B - A)
end

function Main.Remap(Value, InMin, InMax, OutMin, OutMax)
    return (Value - InMin) / (InMax - InMin) * (OutMax - OutMin) + OutMin
end

function Main.IsEven(N)
    return N % 2 == 0
end

function Main.IsOdd(N)
    return N % 2 == 1
end

function Main.IsPrime(N)
    if N < 2 then return false end
    for I = 2, math.floor(math.sqrt(N)) do
        if N % I == 0 then return false end
    end
    return true
end

function Main.GCD(A, B)
    while B ~= 0 do
        A, B = B, A % B
    end
    return A
end

function Main.LCM(A, B)
    return math.abs(A * B) / Main.GCD(A, B)
end

function Main.Sign(N)
    return N > 0 and 1 or (N < 0 and -1 or 0)
end

function Main.Distance2D(X1, Y1, X2, Y2)
    return math.sqrt((X2 - X1)^2 + (Y2 - Y1)^2)
end

function Main.Distance3D(X1, Y1, Z1, X2, Y2, Z2)
    return math.sqrt((X2 - X1)^2 + (Y2 - Y1)^2 + (Z2 - Z1)^2)
end

function Main.Hypotenuse(A, B)
    return math.sqrt(A^2 + B^2)
end

function Main.RandomRange(Min, Max)
    return math.random() * (Max - Min) + Min
end

function Main.CoinFlip()
    return math.random(0, 1) == 1
end

function Main.RandomSign()
    return Main.CoinFlip() and 1 or -1
end

function Main.RandomInt(Min, Max)
    return math.random(Min, Max)
end

function Main.Average(...)
    local Sum, Count = 0, 0
    for _, V in ipairs({...}) do
        Sum += V
        Count += 1
    end
    return Count > 0 and Sum / Count or 0
end

function Main.Median(List)
    if #List == 0 then return nil end
    table.sort(List)
    local Mid = math.floor(#List / 2)
    if #List % 2 == 0 then
        return (List[Mid] + List[Mid + 1]) / 2
    else
        return List[Mid + 1]
    end
end

function Main.Mode(List)
    if #List == 0 then return nil end
    local Counts = {}
    for _, V in ipairs(List) do
        Counts[V] = (Counts[V] or 0) + 1
    end
    local Max, ModeValue = 0, nil
    for K, V in pairs(Counts) do
        if V > Max then
            Max, ModeValue = V, K
        end
    end
    return ModeValue
end

function Main.ToRadians(Degrees)
    return Degrees * (math.pi / 180)
end

function Main.ToDegrees(Radians)
    return Radians * (180 / math.pi)
end

function Main.NormalizeAngle(Angle)
    return (Angle + 180) % 360 - 180
end

function Main.MapToUnitCircle(X, Y)
    local Length = math.sqrt(X^2 + Y^2)
    if Length == 0 then return 0, 0 end
    return X / Length, Y / Length
end

function Main.Sin(Deg)
    return math.sin(Main.ToRadians(Deg))
end

function Main.Cos(Deg)
    return math.cos(Main.ToRadians(Deg))
end

function Main.Tan(Deg)
    return math.tan(Main.ToRadians(Deg))
end

function Main.ASin(Val)
    return Main.ToDegrees(math.asin(Val))
end

function Main.ACos(Val)
    return Main.ToDegrees(math.acos(Val))
end

function Main.ATan2(Y, X)
    return Main.ToDegrees(math.atan(Y, X))
end

function Main.Log(N, Base)
    return math.log(N) / math.log(Base or math.exp(1))
end

function Main.Pow(A, B)
    return A^B
end

function Main.Sqrt(N)
    return math.sqrt(N)
end

function Main.SmoothStep(Edge0, Edge1, X)
    local T = Main.Clamp((X - Edge0) / (Edge1 - Edge0), 0, 1)
    return T * T * (3 - 2 * T)
end

function Main.SmootherStep(Edge0, Edge1, X)
    local T = Main.Clamp((X - Edge0) / (Edge1 - Edge0), 0, 1)
    return T^3 * (T * (6 * T - 15) + 10)
end

function Main.CosLerp(A, B, T)
    local T2 = (1 - math.cos(T * math.pi)) / 2
    return A * (1 - T2) + B * T2
end

function Main.Bounce(T)
    return math.abs(math.sin(6.28 * (T + 1)^2))
end

function Main.PingPong(T, Length)
    T = T % (2 * Length)
    return Length - math.abs(T - Length)
end

function Main.Binomial(N, K)
    return Main.Factorial(N) / (Main.Factorial(K) * Main.Factorial(N - K))
end

function Main.Fibonacci(N)
    if N == 0 then return 0 end
    local A, B = 0, 1
    for _ = 2, N do
        A, B = B, A + B
    end
    return B
end

function Main.IsPerfectSquare(N)
    local Root = math.sqrt(N)
    return Root == math.floor(Root)
end

function Main.IsPowerOfTwo(N)
    if N <= 0 then return false end
    return math.floor(math.log(N) / math.log(2) + 0.5) == math.log(N) / math.log(2)
end

function Main.Add(...)
    local Result = 0
    for _, Value in ipairs({...}) do
        Result += Value
    end
    return Result
end

function Main.Subtract(...)
    local Args = {...}
    if #Args == 0 then return 0 end
    local Result = Args[1]
    for I = 2, #Args do
        Result -= Args[I]
    end
    return Result
end

function Main.Multiply(...)
    local Result = 1
    for _, Value in ipairs({...}) do
        Result *= Value
    end
    return Result
end

function Main.Divide(...)
    local Args = {...}
    if #Args == 0 then return 0 end
    local Result = Args[1]
    for I = 2, #Args do
        if Args[I] == 0 then
            error("Division by zero.")
        end
        Result /= Args[I]
    end
    return Result
end

return Main