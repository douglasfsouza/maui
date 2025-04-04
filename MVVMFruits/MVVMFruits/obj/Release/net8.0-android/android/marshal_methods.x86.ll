; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [110 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [220 x i32] [
	i32 38948123, ; 0: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 42244203, ; 1: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 102
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 48
	i32 83839681, ; 5: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 117431740, ; 6: System.Runtime.InteropServices => 0x6ffddbc => 98
	i32 136584136, ; 7: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 8: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 165246403, ; 9: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 53
	i32 182336117, ; 10: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 71
	i32 205061960, ; 11: System.ComponentModel => 0xc38ff48 => 83
	i32 317674968, ; 12: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 13: Xamarin.AndroidX.Activity.dll => 0x13031348 => 49
	i32 321963286, ; 14: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 342366114, ; 15: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 60
	i32 379916513, ; 16: System.Threading.Thread.dll => 0x16a510e1 => 102
	i32 385762202, ; 17: System.Memory.dll => 0x16fe439a => 90
	i32 395744057, ; 18: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 19: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 20: System.Collections => 0x1a61054f => 80
	i32 450948140, ; 21: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 59
	i32 469710990, ; 22: System.dll => 0x1bff388e => 105
	i32 489220957, ; 23: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 24: System.ObjectModel => 0x1dbae811 => 95
	i32 513247710, ; 25: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 43
	i32 538707440, ; 26: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 27: Microsoft.Extensions.Logging => 0x20216150 => 40
	i32 625139736, ; 28: MVVMFruits.dll => 0x2542e018 => 77
	i32 627609679, ; 29: Xamarin.AndroidX.CustomView => 0x2568904f => 57
	i32 627931235, ; 30: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 672442732, ; 31: System.Collections.Concurrent => 0x2814a96c => 78
	i32 759454413, ; 32: System.Net.Requests => 0x2d445acd => 93
	i32 775507847, ; 33: System.IO.Compression => 0x2e394f87 => 87
	i32 777317022, ; 34: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 35: Microsoft.Extensions.Options => 0x2f0980eb => 42
	i32 823281589, ; 36: System.Private.Uri.dll => 0x311247b5 => 96
	i32 830298997, ; 37: System.IO.Compression.Brotli => 0x317d5b75 => 86
	i32 869139383, ; 38: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 880668424, ; 39: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 904024072, ; 40: System.ComponentModel.Primitives.dll => 0x35e25008 => 81
	i32 918734561, ; 41: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 961460050, ; 42: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 967690846, ; 43: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 60
	i32 990727110, ; 44: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992768348, ; 45: System.Collections.dll => 0x3b2c715c => 80
	i32 1012816738, ; 46: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 70
	i32 1028951442, ; 47: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 39
	i32 1035644815, ; 48: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 50
	i32 1043950537, ; 49: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 50: System.Linq.Expressions.dll => 0x3e444eb4 => 88
	i32 1052210849, ; 51: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 62
	i32 1082857460, ; 52: System.ComponentModel.TypeConverter => 0x408b17f4 => 82
	i32 1084122840, ; 53: Xamarin.Kotlin.StdLib => 0x409e66d8 => 75
	i32 1098259244, ; 54: System => 0x41761b2c => 105
	i32 1108272742, ; 55: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 56: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 57: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 58: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 59: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 67
	i32 1214827643, ; 60: CommunityToolkit.Mvvm => 0x4868cc7b => 35
	i32 1260983243, ; 61: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 62: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 58
	i32 1308624726, ; 63: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1324164729, ; 64: System.Linq => 0x4eed2679 => 89
	i32 1336711579, ; 65: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1373134921, ; 66: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 67: Xamarin.AndroidX.SavedState => 0x52114ed3 => 70
	i32 1406073936, ; 68: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 54
	i32 1430672901, ; 69: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 70: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 71: System.IO.Compression.dll => 0x57261233 => 87
	i32 1469204771, ; 72: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 51
	i32 1470490898, ; 73: Microsoft.Extensions.Primitives => 0x57a5e912 => 43
	i32 1480492111, ; 74: System.IO.Compression.Brotli.dll => 0x583e844f => 86
	i32 1526286932, ; 75: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 76: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 101
	i32 1622152042, ; 77: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 64
	i32 1624863272, ; 78: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 73
	i32 1636350590, ; 79: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 56
	i32 1639515021, ; 80: System.Net.Http.dll => 0x61b9038d => 91
	i32 1639986890, ; 81: System.Text.RegularExpressions => 0x61c036ca => 101
	i32 1657153582, ; 82: System.Runtime => 0x62c6282e => 99
	i32 1658251792, ; 83: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 74
	i32 1677501392, ; 84: System.Net.Primitives.dll => 0x63fca3d0 => 92
	i32 1679769178, ; 85: System.Security.Cryptography => 0x641f3e5a => 100
	i32 1729485958, ; 86: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 52
	i32 1743415430, ; 87: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1766324549, ; 88: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 71
	i32 1770582343, ; 89: Microsoft.Extensions.Logging.dll => 0x6988f147 => 40
	i32 1780572499, ; 90: Mono.Android.Runtime.dll => 0x6a216153 => 108
	i32 1782862114, ; 91: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 92: Xamarin.AndroidX.Fragment => 0x6a96652d => 59
	i32 1793755602, ; 93: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 94: Xamarin.AndroidX.Loader => 0x6bcd3296 => 64
	i32 1813058853, ; 95: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 75
	i32 1813201214, ; 96: Xamarin.Google.Android.Material => 0x6c13413e => 74
	i32 1818569960, ; 97: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 68
	i32 1828688058, ; 98: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 41
	i32 1853025655, ; 99: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 100: System.Linq.Expressions => 0x6ec71a65 => 88
	i32 1875935024, ; 101: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 102: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1910275211, ; 103: System.Collections.NonGeneric.dll => 0x71dc7c8b => 79
	i32 1953182387, ; 104: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1968388702, ; 105: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 36
	i32 2003115576, ; 106: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 107: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 62
	i32 2045470958, ; 108: System.Private.Xml => 0x79eb68ee => 97
	i32 2055257422, ; 109: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 61
	i32 2066184531, ; 110: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2079903147, ; 111: System.Runtime.dll => 0x7bf8cdab => 99
	i32 2090596640, ; 112: System.Numerics.Vectors => 0x7c9bf920 => 94
	i32 2127167465, ; 113: System.Console => 0x7ec9ffe9 => 84
	i32 2159891885, ; 114: Microsoft.Maui => 0x80bd55ad => 46
	i32 2169148018, ; 115: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 116: Microsoft.Extensions.Options.dll => 0x820d22b3 => 42
	i32 2192057212, ; 117: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 41
	i32 2193016926, ; 118: System.ObjectModel.dll => 0x82b6c85e => 95
	i32 2201107256, ; 119: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 76
	i32 2201231467, ; 120: System.Net.Http => 0x8334206b => 91
	i32 2207618523, ; 121: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 122: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 37
	i32 2279755925, ; 123: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 69
	i32 2303942373, ; 124: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 125: System.Private.CoreLib.dll => 0x896b7878 => 106
	i32 2353062107, ; 126: System.Net.Primitives => 0x8c40e0db => 92
	i32 2366048013, ; 127: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
	i32 2368005991, ; 128: System.Xml.ReaderWriter.dll => 0x8d24e767 => 104
	i32 2371007202, ; 129: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 36
	i32 2395872292, ; 130: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 131: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 132: System.Console.dll => 0x912896e5 => 84
	i32 2475788418, ; 133: Java.Interop.dll => 0x93918882 => 107
	i32 2480646305, ; 134: Microsoft.Maui.Controls => 0x93dba8a1 => 44
	i32 2503351294, ; 135: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2550873716, ; 136: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2576534780, ; 137: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2593496499, ; 138: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 139: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 76
	i32 2617129537, ; 140: System.Private.Xml.dll => 0x9bfe3a41 => 97
	i32 2620871830, ; 141: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 56
	i32 2626831493, ; 142: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2732626843, ; 143: Xamarin.AndroidX.Activity => 0xa2e0939b => 49
	i32 2737747696, ; 144: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 51
	i32 2740698338, ; 145: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 146: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 147: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 45
	i32 2764765095, ; 148: Microsoft.Maui.dll => 0xa4caf7a7 => 46
	i32 2778768386, ; 149: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 72
	i32 2785988530, ; 150: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 151: Microsoft.Maui.Graphics => 0xa7008e0b => 48
	i32 2810250172, ; 152: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 54
	i32 2853208004, ; 153: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 72
	i32 2861189240, ; 154: Microsoft.Maui.Essentials => 0xaa8a4878 => 47
	i32 2909740682, ; 155: System.Private.CoreLib => 0xad6f1e8a => 106
	i32 2916838712, ; 156: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 73
	i32 2919462931, ; 157: System.Numerics.Vectors.dll => 0xae037813 => 94
	i32 2959614098, ; 158: System.ComponentModel.dll => 0xb0682092 => 83
	i32 2978675010, ; 159: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 58
	i32 3038032645, ; 160: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 161: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 162: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 65
	i32 3059408633, ; 163: Mono.Android.Runtime => 0xb65adef9 => 108
	i32 3059793426, ; 164: System.ComponentModel.Primitives => 0xb660be12 => 81
	i32 3178803400, ; 165: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 66
	i32 3220365878, ; 166: System.Threading => 0xbff2e236 => 103
	i32 3258312781, ; 167: Xamarin.AndroidX.CardView => 0xc235e84d => 52
	i32 3275238778, ; 168: MVVMFruits => 0xc3382d7a => 77
	i32 3305363605, ; 169: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 170: System.Net.Requests.dll => 0xc5b097e4 => 93
	i32 3317135071, ; 171: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 57
	i32 3346324047, ; 172: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 67
	i32 3357674450, ; 173: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3362522851, ; 174: Xamarin.AndroidX.Core => 0xc86c06e3 => 55
	i32 3366347497, ; 175: Java.Interop => 0xc8a662e9 => 107
	i32 3374999561, ; 176: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 69
	i32 3381016424, ; 177: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 178: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 38
	i32 3458724246, ; 179: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3471940407, ; 180: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 82
	i32 3476120550, ; 181: Mono.Android => 0xcf3163e6 => 109
	i32 3484440000, ; 182: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3580758918, ; 183: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 184: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3608519521, ; 185: System.Linq.dll => 0xd715a361 => 89
	i32 3641597786, ; 186: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 61
	i32 3643446276, ; 187: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 188: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 66
	i32 3657292374, ; 189: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 37
	i32 3672681054, ; 190: Mono.Android.dll => 0xdae8aa5e => 109
	i32 3724971120, ; 191: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 65
	i32 3748608112, ; 192: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 85
	i32 3751619990, ; 193: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3786282454, ; 194: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 53
	i32 3792276235, ; 195: System.Collections.NonGeneric => 0xe2098b0b => 79
	i32 3823082795, ; 196: System.Security.Cryptography.dll => 0xe3df9d2b => 100
	i32 3841636137, ; 197: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 39
	i32 3849253459, ; 198: System.Runtime.InteropServices.dll => 0xe56ef253 => 98
	i32 3896106733, ; 199: System.Collections.Concurrent.dll => 0xe839deed => 78
	i32 3896760992, ; 200: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 55
	i32 3920221145, ; 201: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3928044579, ; 202: System.Xml.ReaderWriter => 0xea213423 => 104
	i32 3931092270, ; 203: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 68
	i32 3955647286, ; 204: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 50
	i32 4025784931, ; 205: System.Memory => 0xeff49a63 => 90
	i32 4046471985, ; 206: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 45
	i32 4073602200, ; 207: System.Threading.dll => 0xf2ce3c98 => 103
	i32 4091086043, ; 208: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 209: Microsoft.Maui.Essentials.dll => 0xf40add04 => 47
	i32 4100113165, ; 210: System.Private.Uri => 0xf462c30d => 96
	i32 4103439459, ; 211: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 212: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 38
	i32 4150914736, ; 213: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 214: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 63
	i32 4213026141, ; 215: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 85
	i32 4249188766, ; 216: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4271975918, ; 217: Microsoft.Maui.Controls.dll => 0xfea12dee => 44
	i32 4274623895, ; 218: CommunityToolkit.Mvvm.dll => 0xfec99597 => 35
	i32 4292120959 ; 219: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 63
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [220 x i32] [
	i32 0, ; 0
	i32 9, ; 1
	i32 102, ; 2
	i32 33, ; 3
	i32 48, ; 4
	i32 17, ; 5
	i32 98, ; 6
	i32 32, ; 7
	i32 25, ; 8
	i32 53, ; 9
	i32 71, ; 10
	i32 83, ; 11
	i32 30, ; 12
	i32 49, ; 13
	i32 8, ; 14
	i32 60, ; 15
	i32 102, ; 16
	i32 90, ; 17
	i32 34, ; 18
	i32 28, ; 19
	i32 80, ; 20
	i32 59, ; 21
	i32 105, ; 22
	i32 6, ; 23
	i32 95, ; 24
	i32 43, ; 25
	i32 27, ; 26
	i32 40, ; 27
	i32 77, ; 28
	i32 57, ; 29
	i32 19, ; 30
	i32 78, ; 31
	i32 93, ; 32
	i32 87, ; 33
	i32 25, ; 34
	i32 42, ; 35
	i32 96, ; 36
	i32 86, ; 37
	i32 10, ; 38
	i32 24, ; 39
	i32 81, ; 40
	i32 21, ; 41
	i32 14, ; 42
	i32 60, ; 43
	i32 23, ; 44
	i32 80, ; 45
	i32 70, ; 46
	i32 39, ; 47
	i32 50, ; 48
	i32 4, ; 49
	i32 88, ; 50
	i32 62, ; 51
	i32 82, ; 52
	i32 75, ; 53
	i32 105, ; 54
	i32 26, ; 55
	i32 20, ; 56
	i32 16, ; 57
	i32 22, ; 58
	i32 67, ; 59
	i32 35, ; 60
	i32 2, ; 61
	i32 58, ; 62
	i32 11, ; 63
	i32 89, ; 64
	i32 31, ; 65
	i32 32, ; 66
	i32 70, ; 67
	i32 54, ; 68
	i32 0, ; 69
	i32 6, ; 70
	i32 87, ; 71
	i32 51, ; 72
	i32 43, ; 73
	i32 86, ; 74
	i32 30, ; 75
	i32 101, ; 76
	i32 64, ; 77
	i32 73, ; 78
	i32 56, ; 79
	i32 91, ; 80
	i32 101, ; 81
	i32 99, ; 82
	i32 74, ; 83
	i32 92, ; 84
	i32 100, ; 85
	i32 52, ; 86
	i32 1, ; 87
	i32 71, ; 88
	i32 40, ; 89
	i32 108, ; 90
	i32 17, ; 91
	i32 59, ; 92
	i32 9, ; 93
	i32 64, ; 94
	i32 75, ; 95
	i32 74, ; 96
	i32 68, ; 97
	i32 41, ; 98
	i32 26, ; 99
	i32 88, ; 100
	i32 8, ; 101
	i32 2, ; 102
	i32 79, ; 103
	i32 13, ; 104
	i32 36, ; 105
	i32 5, ; 106
	i32 62, ; 107
	i32 97, ; 108
	i32 61, ; 109
	i32 4, ; 110
	i32 99, ; 111
	i32 94, ; 112
	i32 84, ; 113
	i32 46, ; 114
	i32 12, ; 115
	i32 42, ; 116
	i32 41, ; 117
	i32 95, ; 118
	i32 76, ; 119
	i32 91, ; 120
	i32 14, ; 121
	i32 37, ; 122
	i32 69, ; 123
	i32 18, ; 124
	i32 106, ; 125
	i32 92, ; 126
	i32 12, ; 127
	i32 104, ; 128
	i32 36, ; 129
	i32 13, ; 130
	i32 10, ; 131
	i32 84, ; 132
	i32 107, ; 133
	i32 44, ; 134
	i32 16, ; 135
	i32 11, ; 136
	i32 15, ; 137
	i32 20, ; 138
	i32 76, ; 139
	i32 97, ; 140
	i32 56, ; 141
	i32 15, ; 142
	i32 49, ; 143
	i32 51, ; 144
	i32 1, ; 145
	i32 21, ; 146
	i32 45, ; 147
	i32 46, ; 148
	i32 72, ; 149
	i32 27, ; 150
	i32 48, ; 151
	i32 54, ; 152
	i32 72, ; 153
	i32 47, ; 154
	i32 106, ; 155
	i32 73, ; 156
	i32 94, ; 157
	i32 83, ; 158
	i32 58, ; 159
	i32 34, ; 160
	i32 7, ; 161
	i32 65, ; 162
	i32 108, ; 163
	i32 81, ; 164
	i32 66, ; 165
	i32 103, ; 166
	i32 52, ; 167
	i32 77, ; 168
	i32 7, ; 169
	i32 93, ; 170
	i32 57, ; 171
	i32 67, ; 172
	i32 24, ; 173
	i32 55, ; 174
	i32 107, ; 175
	i32 69, ; 176
	i32 3, ; 177
	i32 38, ; 178
	i32 22, ; 179
	i32 82, ; 180
	i32 109, ; 181
	i32 23, ; 182
	i32 31, ; 183
	i32 33, ; 184
	i32 89, ; 185
	i32 61, ; 186
	i32 28, ; 187
	i32 66, ; 188
	i32 37, ; 189
	i32 109, ; 190
	i32 65, ; 191
	i32 85, ; 192
	i32 3, ; 193
	i32 53, ; 194
	i32 79, ; 195
	i32 100, ; 196
	i32 39, ; 197
	i32 98, ; 198
	i32 78, ; 199
	i32 55, ; 200
	i32 19, ; 201
	i32 104, ; 202
	i32 68, ; 203
	i32 50, ; 204
	i32 90, ; 205
	i32 45, ; 206
	i32 103, ; 207
	i32 5, ; 208
	i32 47, ; 209
	i32 96, ; 210
	i32 29, ; 211
	i32 38, ; 212
	i32 29, ; 213
	i32 63, ; 214
	i32 85, ; 215
	i32 18, ; 216
	i32 44, ; 217
	i32 35, ; 218
	i32 63 ; 219
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
