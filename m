Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794893254;
	b=3M94FmbqIJrcP0ppBo/pu+QhuX74ff3yQcJMuqI3Z4vmOSlsUVGEy8QB4bmG49fwyxhZ
	 4YSG23mAo8GGDcLI0Q/K5PoTXkXiBkhcYqOtqDRY0wYkUXJd99mqRbv+PSTUNEvVbvQhy
	 DmiozlLZtPDLweEHfsCsP/C5mVf3j2n8IJHxs91cR2LUGDVjE16tdOYsLf6Kb6vBDeTW+
	 mAaOMULfHIJB3zuLja+HZlnJ9TSR7S+X2IBhHVLIlhlCQTkO5UNbinpmpBRl6lqnD/zz+
	 zeEB63Efe8VHU9TEhz0zQYlqOBJ7fgXgfp0X8hiNu4KndSeSJXySSmXKQ6YLkakjc+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5AjG1WsQJd7dLH00mmAOhXTkdFUExvghIpJvORFfiCo=;
	b=y2oAdnfYdHXur9OmNcdzdhjfC/i0AQ1YtwBO7CHirdFHk4JnxS9AT2uvBtDMwBs1YVAQ
	 6BTd5bUtpviBG6rP612YZ10Eda6eFVZnfJXeCf1/xftCcV941p3tfbrv2YAmAcvMoeIK1
	 njaAMLYOHfw2pxQ1EdbaK3Xa1P1e+fn04VgDOdYn/BiVHF/YRUkkneg9xlu4TdMEoP/UA
	 DKRZeemBnQKlQPIEJ8oWAvCykACIYGuwfbzKGF36lf+WtqGJVCq9wOGJciZz0IPvnVvRD
	 V34l5SSzn33NeLFjVXtIW3+lqCsu3uRQYq3wemZSYbg9HCkhbLoALgYGQ9FfHAYIzsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxr1Bf0t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65506606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65506606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxr1Bf0t
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a070755c8cso2285383b3a.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:27:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794893253; cv=none;
        d=google.com; s=arc-20260327;
        b=cEQ/9BwS6GqBrfAwKtj25863CXbE325t2NQjwQdQvSjaoVRP08gkvL2Nj8bWub9MmQ
         ZtCPfn/8781BuF5Wpff3My9rLWUpd97gptDmtBSqIM4FO2+MP5AwNu7q1/JWNYPiTP/B
         GINZ9rVr1czRpoYszb0boo/6V5dM9fjIqFa9NXXrC98B6GYC1qgRU5Rg/3siZXXCR0PH
         cmbAxzOD0aMUrgV5a31jLOxjR/Mt79ju4K4YjGlVg3SiTyA0CaWA0kgS7l2BxakBSl76
         +bObQbqH5ftfQH8+NHohONTD9sIIgtPl9kNUb0e1IgXvzr/1nE7trJC2foSZRLQxWWI6
         awDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5AjG1WsQJd7dLH00mmAOhXTkdFUExvghIpJvORFfiCo=;
        fh=Snj+SHcbfB1axW5wzY6L0IFg9uopfE2Lm/IVzsec0W0=;
        b=J6GBeIIdYXHGDrhEhbxnxoPT9Q2uHMjIzxp/RN1vh/nJoyWt0qZO5PxS7MV2Wet5PL
         4VlxkUb4Sn/i/NSbQBwOBMMAo+4bDeZUifMqNcBF9FvInu5bU2fITGkSp2OG3CQT18oG
         /H4DIvfLVgXqVqWHe7m7dH0ow+BMocmjaoxUTL9ODG+cw26Exw9rQQ9fPZezbFrpId9x
         b+06cx/T1R/jn5bsfLfDZ/EDiHzFNt8HxcixS39XrPJK7yNGF9RsayLC1jWHiO2/KkBE
         kMF0hG0LGtpq7YvkppNKP2iBWi2vRNHu8zzQFstFhIqtij2Hd5jnQw5hmYY8lB8Fqdux
         j1Uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794893253; x=1795498053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5AjG1WsQJd7dLH00mmAOhXTkdFUExvghIpJvORFfiCo=;
        b=oxr1Bf0tO7VJUukF9o+g4rXe2WNUeQE0bJPGslzFQWI77067pfKH2G5E0YdXZIuOA2
         swZskL/kmqqe05wPgSrznMKTLRR4a9us5RfB0UpJiYyIHLgnGM4RfCI9NnBC4YJYkPXl
         6LYvdhR3y4wYvbQe+ETn92WtorRS4vNror/+DOVjPYosJhZbskPAfoyXCDXuq6XhwCmz
         VE8sCDkrecdidxNqC1a6sM0s9CtrjX6ZxlyuMO38Fn4eiu6Zr7iBopVC1mGrpb2zAPKG
         605z6raBAs72usAVEsc/C3pflSaiGU6bbS4NDfpUNvCJ+kqCdMYpgevzBE8fWrIv6Ylo
         wlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893253; x=1795498053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5AjG1WsQJd7dLH00mmAOhXTkdFUExvghIpJvORFfiCo=;
        b=e6l91Ezhx/Qkp1WVPgE+4BKJXM6Ev2miAGoR8ulxKUGGDu/RnkXh6KDBln+LjTYtjE
         iZyxP4gSilbaLCAu5gDCtLpwa5ixmdqtUjXzNBvMq9mHOxn+obftJab1NL45y8p5jFIZ
         GCNpr/UyfaZxezSdCnhXin+J31ViiCGQdJ7Iog1bPOfJNnAPwS8rz9syfXMizdoYC4WO
         yKURzxtGWT1PsjsD5P8VOgfBSTRjOPrM1kngV85xt22jhZkHtW1zDmcg2ZtiVaBazJ3q
         er1mwURQUCdWZPUhr+VloCvGJ7U+yDne47MfY7SbYuzFYsptQVc1dxHZ9DE3LiNBhtH4
         cKvw==
X-Forwarded-Encrypted: i=1; AL+hErGB5ccmIm38F22BOXYBGrtrs7Ph8djgkGqWhEo64XDBzt4p0UN6K6fApxQFD8IGuRcNYv2QLt4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1JB4Dv1RvGeX9mTt7JuO6ct9bnNuQgWKVZDMA7pYsWVbPl06V
	/IjXn+92E3DublDF9PfXgNoZ73W9HMyfLSTrT5e6flD0J5cubikjLfAL/TAZMRj/e2sKoEM3n8r
	CzxKlRyREE1E/FAYuSd0DD08CQtQU+N19Ow==
X-Gm-Gg: AYBFou2af9Mui0ODZPLzHcgNsmp6sV6k0xHh998uOZdNtUg/FrHVH+3+/ZE1Fir22c4
	XEU4zYqH1T6jxDtYs5BETILKJSt6+MnUxV8VatrM6HoI776W9QekGi1oke8TC48dxi5YzsUN49d
	0lQbyjSD5zpGjVie1bG5sdig5GpuCwSVpotMYt4LyNayXwHwEKL3PmRkbCd42Z6gNSA44YpStaz
	XGYMCjEicO6C/qZRAyU2Kwwt/vIMBAMf9J/eNzW48uAS48n4kaD20aql91xXBks2ylHGMInPiFM
	FGxMm/1lqz4mlb5BzTNvqK7ssKSwyutzsaTRDDRiYFH17Ef7ziis5PqW8pJy32bqQVAIhhpusb1
	XjhP3ibvoN2CdbB5CO4MNgC1IPnkB3oXSBGVIRL5XN8UuHj/CUalMlLiMdTjA/FWuUwBT14xfG4
	BVMVuKPjmOYA+JUOSny4Y818MhjQKc2FHeHuAfFbBYOB5dCjBoEB0=
X-Received: by 2002:a05:6a20:e68c:b0:3e2:8c04:5f57 with SMTP id
 adf61e73a8af0-3f7a8eea551mr12352578637.73.1794893252373; Mon, 16 Nov 2026
 21:27:32 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116200110.uc9UewDJ-lkp@intel.com>
In-Reply-To: <20261116200110.uc9UewDJ-lkp@intel.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 16 Nov 2026 21:27:20 -0800
X-Gm-Features: AclHuK-o-ufato1wMwaeO0P3WlD1NBVmhVJl1b_GDG2L0c-FGUbNsu8x_d_aVRM
Message-ID: <CAADnVQK=Y1CY=m0gGegLB-jm9S1cUcEcKUuNx33PT2W-tdMCuw@mail.gmail.com>
Subject: Re: [bpf-next:for-next] BUILD REGRESSION 8835113107b2cf75df33a71e265cdeec5d5d13e0
To: kernel test robot <lkp@intel.com>, Maciej Fijalkowski <maciejromanfijalkowski@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Network Development <netdev@vger.kernel.org>
Cc: BPF build status <bpf@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maciej,

I suspect bot complains about netdev too.
Pls silence it and probably do another stable branch, so we can
silence both netdev and bpf.

Thanks!

On Mon, Nov 16, 2026 at 4:02=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next=
.git for-next
> branch HEAD: 8835113107b2cf75df33a71e265cdeec5d5d13e0  resolve_btfids: Do=
n't list -EBUSY next to -EINPROGRESS
>
> Unverified Error/Warning (likely false positive, kindly check if interest=
ed):
>
>     https://lore.kernel.org/oe-kbuild/202611140904.io658Rze-lkp@intel.com
>     https://lore.kernel.org/oe-kbuild/202611141124.V0t6dlFo-lkp@intel.com
>
>     Makefile:14: excluding xskxceiver, bpftool not installed or not worki=
ng
>     Makefile:239: excluding xdp_hw_metadata, bpftool not installed or not=
 working
>
> Error/Warning ids grouped by kconfigs:
>
> recent_errors
> |-- arm64-allnoconfig-bpf
> |   |-- Makefile:excluding-xdp_hw_metadata-bpftool-not-installed-or-not-w=
orking
> |   `-- Makefile:excluding-xskxceiver-bpftool-not-installed-or-not-workin=
g
> |-- i386-allnoconfig-bpf
> |   |-- Makefile:excluding-xdp_hw_metadata-bpftool-not-installed-or-not-w=
orking
> |   `-- Makefile:excluding-xskxceiver-bpftool-not-installed-or-not-workin=
g
> |-- powerpc64-allnoconfig-bpf
> |   |-- Makefile:excluding-xdp_hw_metadata-bpftool-not-installed-or-not-w=
orking
> |   `-- Makefile:excluding-xskxceiver-bpftool-not-installed-or-not-workin=
g
> |-- riscv-allnoconfig-bpf
> |   |-- Makefile:excluding-xdp_hw_metadata-bpftool-not-installed-or-not-w=
orking
> |   `-- Makefile:excluding-xskxceiver-bpftool-not-installed-or-not-workin=
g
> |-- s390-allnoconfig-bpf
> |   |-- Makefile:excluding-xdp_hw_metadata-bpftool-not-installed-or-not-w=
orking
> |   `-- Makefile:excluding-xskxceiver-bpftool-not-installed-or-not-workin=
g
> `-- x86_64-allnoconfig-bpf
>     |-- Makefile:excluding-xdp_hw_metadata-bpftool-not-installed-or-not-w=
orking
>     `-- Makefile:excluding-xskxceiver-bpftool-not-installed-or-not-workin=
g
>
> elapsed time: 918m
>
> configs tested: 587
> configs skipped: 4
>
> tested configs:
> alpha                              allnoconfig    gcc-16.2.0
> alpha                             allyesconfig    gcc-16.2.0
> alpha                                defconfig    gcc-16.2.0
> alpha                 randconfig-2000-20261115    gcc-14.4.0
> alpha                 randconfig-2000-20261115    gcc-8.5.0
> alpha                 randconfig-2001-20261115    gcc-16.2.0
> alpha                 randconfig-2001-20261115    gcc-8.5.0
> alpha                 randconfig-2200-20261115    gcc-8.5.0  smatch
> alpha                randconfig-r2100-20261115    gcc-8.5.0  cocci
> alpha                randconfig-r2102-20261115    gcc-8.5.0  cocci
> alpha                randconfig-r2103-20261115    gcc-8.5.0  cocci
> alpha                randconfig-r2105-20261115    gcc-8.5.0  cocci
> alpha                randconfig-r2108-20261115    gcc-10.5.0 cocci
> alpha                randconfig-r2109-20261115    gcc-8.5.0  cocci
> alpha                randconfig-r2301-20261115    gcc-10.5.0 sparse
> alpha                randconfig-r2302-20261115    gcc-12.5.0 sparse
> alpha                randconfig-r2305-20261115    gcc-9.5.0  sparse
> alpha                randconfig-r2306-20261115    gcc-8.5.0  sparse
> alpha                randconfig-r2308-20261115    gcc-8.5.0  sparse
> alpha                randconfig-r2311-20261115    gcc-9.5.0  sparse
> arc                               allmodconfig    clang-24
> arc                                allnoconfig    gcc-16.2.0
> arc                               allyesconfig    clang-24
> arc                                  defconfig    gcc-16.2.0
> arc                   randconfig-1000-20261116    gcc-8.5.0
> arc                   randconfig-1001-20261116    gcc-8.5.0
> arc                   randconfig-2000-20261115    gcc-8.5.0
> arc                   randconfig-2001-20261115    gcc-16.2.0
> arc                   randconfig-2001-20261115    gcc-8.5.0
> arc                   randconfig-2002-20261115    gcc-14.4.0
> arc                   randconfig-2002-20261115    gcc-8.5.0
> arc                   randconfig-2003-20261115    gcc-16.2.0
> arc                   randconfig-2003-20261115    gcc-8.5.0
> arc                   randconfig-2004-20261115    gcc-8.5.0
> arc                   randconfig-2005-20261115    gcc-8.5.0
> arc                   randconfig-2200-20261115    gcc-16.2.0 smatch
> arc                  randconfig-r2100-20261115    gcc-8.5.0  cocci
> arc                  randconfig-r2101-20261115    gcc-8.5.0  cocci
> arc                  randconfig-r2103-20261115    gcc-8.5.0  cocci
> arc                  randconfig-r2105-20261115    gcc-11.5.0 cocci
> arc                  randconfig-r2108-20261115    gcc-13.5.0 cocci
> arc                  randconfig-r2305-20261115    gcc-9.5.0  sparse
> arc                  randconfig-r2308-20261115    gcc-9.5.0  sparse
> arc                  randconfig-r2310-20261115    gcc-8.5.0  sparse
> arc                  randconfig-r2311-20261115    gcc-11.5.0 sparse
> arm                                allnoconfig    gcc-16.2.0
> arm                               allyesconfig    clang-24
> arm                          at91_dt_defconfig    gcc-16.2.0
> arm                      davinci_all_defconfig    gcc-16.2.0
> arm                                  defconfig    gcc-16.2.0
> arm                           gemini_defconfig    clang-24
> arm                        imx_v4_v5_defconfig    clang-24
> arm                           moxart_defconfig    clang-24
> arm                             mps2_defconfig    clang-24
> arm                        multi_v4t_defconfig    clang-24
> arm                              mxs_defconfig    clang-17
> arm                         neponset_defconfig    gcc-16.2.0
> arm                          orion5x_defconfig    gcc-16.2.0
> arm                              pxa_defconfig    gcc-14
> arm                   randconfig-1000-20261116    gcc-8.5.0
> arm                   randconfig-1001-20261116    gcc-8.5.0
> arm                   randconfig-1002-20261116    gcc-8.5.0
> arm                   randconfig-1003-20261116    gcc-8.5.0
> arm                   randconfig-2000-20261115    clang-24
> arm                   randconfig-2001-20261115    clang-24
> arm                   randconfig-2001-20261115    gcc-10.5.0
> arm                   randconfig-2002-20261115    clang-24
> arm                   randconfig-2002-20261115    gcc-8.5.0
> arm                   randconfig-2200-20261115    clang-17   smatch
> arm                  randconfig-r2100-20261115    gcc-11.5.0 cocci
> arm                  randconfig-r2101-20261115    gcc-8.5.0  cocci
> arm                  randconfig-r2102-20261115    gcc-10.5.0 cocci
> arm                  randconfig-r2104-20261115    gcc-8.5.0  cocci
> arm                  randconfig-r2106-20261115    gcc-8.5.0  cocci
> arm                  randconfig-r2110-20261115    gcc-8.5.0  cocci
> arm                  randconfig-r2111-20261115    clang-24   cocci
> arm                  randconfig-r2301-20261115    clang-22   sparse
> arm                  randconfig-r2306-20261115    gcc-11.5.0 sparse
> arm                  randconfig-r2309-20261115    gcc-10.5.0 sparse
> arm                         realview_defconfig    clang-17
> arm                            tegra_defconfig    gcc-16.2.0
> arm                         vexpress_defconfig    clang-24
> arm64                             allmodconfig    clang-24
> arm64                              allnoconfig    gcc-16.2.0
> arm64                                defconfig    gcc-16.2.0
> arm64                 randconfig-1000-20261116    gcc-10.5.0
> arm64                 randconfig-1001-20261116    gcc-10.5.0
> arm64                 randconfig-1002-20261116    gcc-10.5.0
> arm64                 randconfig-1003-20261116    gcc-10.5.0
> arm64                 randconfig-2000-20261115    clang-24
> arm64                 randconfig-2000-20261115    gcc-13.5.0
> arm64                 randconfig-2001-20261115    clang-22
> arm64                 randconfig-2001-20261115    clang-24
> arm64                 randconfig-2002-20261115    clang-24
> arm64                 randconfig-2002-20261115    gcc-8.5.0
> arm64                 randconfig-2200-20261115    gcc-15.3.0 smatch
> arm64                randconfig-r2102-20261115    gcc-11.5.0 cocci
> arm64                randconfig-r2102-20261115    gcc-14     cocci
> arm64                randconfig-r2106-20261115    gcc-13.5.0 cocci
> arm64                randconfig-r2107-20261115    gcc-8.5.0  cocci
> arm64                randconfig-r2108-20261115    gcc-8.5.0  cocci
> arm64                randconfig-r2110-20261115    gcc-11.5.0 cocci
> arm64                randconfig-r2110-20261115    gcc-8.5.0  cocci
> arm64                randconfig-r2303-20261115    gcc-9.5.0  sparse
> arm64                randconfig-r2304-20261115    gcc-13.5.0 sparse
> arm64                randconfig-r2306-20261115    clang-20   sparse
> arm64                randconfig-r2307-20261115    clang-20   sparse
> arm64                randconfig-r2307-20261115    gcc-9.5.0  sparse
> csky                              allmodconfig    gcc-16.2.0
> csky                               allnoconfig    gcc-16.2.0
> csky                                 defconfig    gcc-16.2.0
> csky                  randconfig-1000-20261116    gcc-10.5.0
> csky                  randconfig-1001-20261116    gcc-10.5.0
> csky                  randconfig-2000-20261115    gcc-14.4.0
> csky                  randconfig-2001-20261115    gcc-12.5.0
> csky                  randconfig-2001-20261115    gcc-14.4.0
> csky                  randconfig-2200-20261115    gcc-12.5.0 smatch
> csky                 randconfig-r2103-20261115    gcc-13.5.0 cocci
> csky                 randconfig-r2104-20261115    gcc-8.5.0  cocci
> csky                 randconfig-r2106-20261115    gcc-16.2.0 cocci
> csky                 randconfig-r2109-20261115    gcc-13.5.0 cocci
> csky                 randconfig-r2109-20261115    gcc-8.5.0  cocci
> csky                 randconfig-r2301-20261115    gcc-8.5.0  sparse
> hexagon                           allmodconfig    gcc-16.2.0
> hexagon                            allnoconfig    gcc-16.2.0
> hexagon                              defconfig    gcc-16.2.0
> hexagon               randconfig-1000-20261116    clang-17
> hexagon               randconfig-1001-20261116    clang-17
> hexagon               randconfig-2000-20261115    clang-24
> hexagon               randconfig-2000-20261115    gcc-14.4.0
> hexagon               randconfig-2001-20261115    clang-24
> hexagon               randconfig-2001-20261115    gcc-14.4.0
> hexagon               randconfig-2200-20261115    clang-24   smatch
> hexagon              randconfig-r2101-20261115    gcc-9.5.0  cocci
> hexagon              randconfig-r2102-20261115    gcc-9.5.0  cocci
> hexagon              randconfig-r2104-20261115    gcc-11.5.0 cocci
> hexagon              randconfig-r2106-20261115    clang-24   cocci
> hexagon              randconfig-r2109-20261115    gcc-8.5.0  cocci
> hexagon              randconfig-r2110-20261115    gcc-10.5.0 cocci
> hexagon              randconfig-r2307-20261115    clang-24   sparse
> hexagon              randconfig-r2310-20261115    clang-20   sparse
> i386                              allmodconfig    clang-22
> i386                               allnoconfig    gcc-16.2.0
> i386        buildonly-randconfig-1000-20261116    gcc-14
> i386        buildonly-randconfig-1001-20261116    gcc-14
> i386        buildonly-randconfig-1002-20261116    gcc-14
> i386        buildonly-randconfig-1003-20261116    gcc-14
> i386        buildonly-randconfig-1004-20261116    gcc-14
> i386        buildonly-randconfig-1005-20261116    gcc-14
> i386                                 defconfig    gcc-16.2.0
> i386                  randconfig-1000-20261116    gcc-14
> i386                  randconfig-1001-20261116    gcc-14
> i386                  randconfig-1002-20261116    gcc-14
> i386                  randconfig-1003-20261116    gcc-14
> i386                  randconfig-1004-20261116    gcc-14
> i386                  randconfig-1005-20261116    gcc-14
> i386                  randconfig-1006-20261116    gcc-14
> i386                  randconfig-2000-20261115    gcc-14
> i386                  randconfig-2001-20261115    gcc-14
> i386                  randconfig-2002-20261115    gcc-12
> i386                  randconfig-2002-20261115    gcc-14
> i386                  randconfig-2003-20261115    clang-22
> i386                  randconfig-2003-20261115    gcc-14
> i386                  randconfig-2004-20261115    gcc-14
> i386                  randconfig-2005-20261115    gcc-12
> i386                  randconfig-2005-20261115    gcc-14
> i386                  randconfig-2100-20261115    clang-22   cocci
> i386                  randconfig-2100-20261115    gcc-14     cocci
> i386                  randconfig-2101-20261115    clang-22   cocci
> i386                  randconfig-2101-20261115    gcc-14     cocci
> i386                  randconfig-2102-20261115    clang-22   cocci
> i386                  randconfig-2102-20261115    gcc-14     cocci
> i386                  randconfig-2103-20261115    gcc-14     cocci
> i386                  randconfig-2104-20261115    gcc-14     cocci
> i386                  randconfig-2105-20261115    gcc-14     cocci
> i386                  randconfig-2200-20261115    gcc-14     smatch
> i386                  randconfig-2300-20261115    clang-22   sparse
> i386                  randconfig-2301-20261115    clang-22   sparse
> i386                  randconfig-2301-20261115    gcc-14     sparse
> i386                  randconfig-2302-20261115    clang-22   sparse
> i386                 randconfig-r2100-20261115    gcc-14     cocci
> i386                 randconfig-r2101-20261115    gcc-11.5.0 cocci
> i386                 randconfig-r2108-20261115    gcc-13.5.0 cocci
> i386                 randconfig-r2111-20261115    gcc-10.5.0 cocci
> i386                 randconfig-r2300-20261115    gcc-8.5.0  sparse
> i386                 randconfig-r2301-20261115    clang-22   sparse
> i386                 randconfig-r2304-20261115    gcc-14     sparse
> i386                 randconfig-r2304-20261115    gcc-8.5.0  sparse
> i386                 randconfig-r2306-20261115    gcc-14     sparse
> i386                 randconfig-r2306-20261115    gcc-9.5.0  sparse
> i386                 randconfig-r2307-20261115    clang-22   sparse
> i386                 randconfig-r2309-20261115    gcc-8.5.0  sparse
> i386                 randconfig-r2311-20261115    clang-20   sparse
> i386                 randconfig-r2311-20261115    clang-22   sparse
> loongarch                         allmodconfig    clang-24
> loongarch                          allnoconfig    gcc-16.2.0
> loongarch                            defconfig    clang-24
> loongarch             randconfig-1000-20261116    clang-17
> loongarch             randconfig-1001-20261116    clang-17
> loongarch             randconfig-2000-20261115    gcc-16.2.0
> loongarch             randconfig-2000-20261115    gcc-8.5.0
> loongarch             randconfig-2001-20261115    clang-20
> loongarch             randconfig-2001-20261115    gcc-8.5.0
> loongarch             randconfig-2200-20261115    gcc-16.2.0 smatch
> loongarch            randconfig-r2100-20261115    clang-24   cocci
> loongarch            randconfig-r2104-20261115    clang-24   cocci
> loongarch            randconfig-r2309-20261115    gcc-11.5.0 sparse
> m68k                              allmodconfig    gcc-16.2.0
> m68k                               allnoconfig    gcc-16.2.0
> m68k                              allyesconfig    clang-24
> m68k                                 defconfig    clang-24
> m68k                        m5208evb_defconfig    clang-17
> m68k                        m5249evb_defconfig    gcc-14
> m68k                         m5272c3_defconfig    gcc-14
> m68k                        m5282evb_defconfig    gcc-14
> m68k                        m5329evb_defconfig    clang-17
> m68k                  randconfig-2000-20261115    gcc-15.3.0
> m68k                  randconfig-2000-20261115    gcc-8.5.0
> m68k                  randconfig-2001-20261115    gcc-8.5.0
> m68k                  randconfig-2200-20261115    gcc-8.5.0  smatch
> m68k                  randconfig-2200-20261116    gcc-14.4.0 smatch
> m68k                 randconfig-r2102-20261115    gcc-8.5.0  cocci
> m68k                 randconfig-r2105-20261115    gcc-8.5.0  cocci
> m68k                 randconfig-r2106-20261115    gcc-10.5.0 cocci
> m68k                 randconfig-r2109-20261115    gcc-15.3.0 cocci
> m68k                 randconfig-r2111-20261115    gcc-16.2.0 cocci
> m68k                 randconfig-r2111-20261115    gcc-8.5.0  cocci
> m68k                 randconfig-r2302-20261115    gcc-8.5.0  sparse
> m68k                 randconfig-r2303-20261115    gcc-10.5.0 sparse
> m68k                 randconfig-r2303-20261115    gcc-9.5.0  sparse
> m68k                 randconfig-r2306-20261115    gcc-8.5.0  sparse
> m68k                 randconfig-r2310-20261115    gcc-15.3.0 sparse
> microblaze                         allnoconfig    gcc-16.2.0
> microblaze                        allyesconfig    gcc-16.2.0
> microblaze                           defconfig    clang-24
> microblaze            randconfig-2000-20261115    gcc-10.5.0
> microblaze            randconfig-2000-20261115    gcc-8.5.0
> microblaze            randconfig-2001-20261115    gcc-16.2.0
> microblaze            randconfig-2001-20261115    gcc-8.5.0
> microblaze            randconfig-2200-20261115    gcc-12.5.0 smatch
> microblaze           randconfig-r2101-20261115    gcc-15.3.0 cocci
> microblaze           randconfig-r2104-20261115    gcc-8.5.0  cocci
> microblaze           randconfig-r2108-20261115    gcc-16.2.0 cocci
> microblaze           randconfig-r2109-20261115    gcc-10.5.0 cocci
> microblaze           randconfig-r2301-20261115    gcc-8.5.0  sparse
> microblaze           randconfig-r2303-20261115    gcc-10.5.0 sparse
> microblaze           randconfig-r2306-20261115    gcc-8.5.0  sparse
> microblaze           randconfig-r2308-20261115    gcc-8.5.0  sparse
> mips                              allmodconfig    gcc-16.2.0
> mips                               allnoconfig    gcc-16.2.0
> mips                              allyesconfig    gcc-16.2.0
> mips                           ath79_defconfig    gcc-16.2.0
> mips                   cavium_octeon_defconfig    clang-17
> mips                 econet_en751221_defconfig    gcc-16.2.0
> mips                            ip27_defconfig    gcc-14
> mips                            ip28_defconfig    clang-24
> mips                            jazz_defconfig    gcc-14
> mips                  randconfig-2000-20261115    clang-17
> mips                  randconfig-2000-20261115    gcc-10.5.0
> mips                  randconfig-2001-20261115    clang-20
> mips                  randconfig-2001-20261115    gcc-10.5.0
> mips                  randconfig-2002-20261115    clang-24
> mips                  randconfig-2002-20261115    gcc-10.5.0
> mips                  randconfig-2200-20261115    clang-24   smatch
> mips                 randconfig-r2100-20261115    gcc-9.5.0  cocci
> mips                 randconfig-r2111-20261115    gcc-8.5.0  cocci
> mips                 randconfig-r2300-20261115    clang-24   sparse
> mips                 randconfig-r2306-20261115    gcc-11.5.0 sparse
> mips                            rs90_defconfig    gcc-16.2.0
> nios2                             allmodconfig    clang-20
> nios2                              allnoconfig    clang-24
> nios2                                defconfig    clang-24
> nios2                 randconfig-1000-20261116    clang-17
> nios2                 randconfig-1001-20261116    clang-17
> nios2                 randconfig-2000-20261115    gcc-8.5.0
> nios2                 randconfig-2001-20261115    gcc-8.5.0
> nios2                 randconfig-2200-20261115    gcc-11.5.0 smatch
> nios2                randconfig-r2103-20261115    gcc-11.5.0 cocci
> nios2                randconfig-r2103-20261115    gcc-14     cocci
> nios2                randconfig-r2106-20261115    gcc-11.5.0 cocci
> nios2                randconfig-r2107-20261115    gcc-10.5.0 cocci
> nios2                randconfig-r2110-20261115    gcc-13.5.0 cocci
> nios2                randconfig-r2300-20261115    gcc-13.5.0 sparse
> nios2                randconfig-r2307-20261115    gcc-11.5.0 sparse
> nios2                randconfig-r2307-20261115    gcc-8.5.0  sparse
> nios2                randconfig-r2309-20261115    gcc-9.5.0  sparse
> nios2                randconfig-r2310-20261115    gcc-11.5.0 sparse
> openrisc                          allmodconfig    clang-20
> openrisc                           allnoconfig    clang-24
> openrisc          de0_nano_multicore_defconfig    gcc-16.2.0
> openrisc                             defconfig    gcc-16.2.0
> openrisc              randconfig-2000-20261115    gcc-10.5.0
> openrisc              randconfig-2001-20261115    gcc-10.5.0
> openrisc              randconfig-2001-20261115    gcc-12.5.0
> openrisc              randconfig-2002-20261115    gcc-10.5.0
> openrisc              randconfig-2200-20261115    gcc-12.5.0 smatch
> openrisc             randconfig-r2103-20261115    gcc-15.3.0 cocci
> openrisc             randconfig-r2104-20261115    gcc-9.5.0  cocci
> openrisc             randconfig-r2105-20261115    gcc-8.5.0  cocci
> openrisc             randconfig-r2107-20261115    gcc-11.5.0 cocci
> openrisc             randconfig-r2305-20261115    gcc-16.2.0 sparse
> openrisc             randconfig-r2308-20261115    clang-20   sparse
> openrisc             randconfig-r2309-20261115    gcc-11.5.0 sparse
> openrisc             randconfig-r2310-20261115    gcc-9.5.0  sparse
> parisc                            allmodconfig    gcc-16.2.0
> parisc                             allnoconfig    clang-24
> parisc                            allyesconfig    clang-17
> parisc                               defconfig    gcc-16.2.0
> parisc                randconfig-1000-20261116    gcc-16.2.0
> parisc                randconfig-1001-20261116    gcc-16.2.0
> parisc                randconfig-2000-20261115    gcc-8.5.0
> parisc                randconfig-2001-20261115    gcc-14.4.0
> parisc                randconfig-2001-20261115    gcc-8.5.0
> parisc                randconfig-2200-20261115    gcc-10.5.0 smatch
> parisc               randconfig-r2101-20261115    gcc-13.5.0 cocci
> parisc               randconfig-r2102-20261115    gcc-8.5.0  cocci
> parisc               randconfig-r2103-20261115    gcc-9.5.0  cocci
> parisc               randconfig-r2105-20261115    gcc-14     cocci
> parisc               randconfig-r2106-20261115    gcc-15.3.0 cocci
> parisc               randconfig-r2108-20261115    gcc-8.5.0  cocci
> parisc               randconfig-r2300-20261115    gcc-9.5.0  sparse
> parisc               randconfig-r2301-20261115    gcc-13.5.0 sparse
> parisc               randconfig-r2302-20261115    gcc-13.5.0 sparse
> parisc               randconfig-r2305-20261115    gcc-10.5.0 sparse
> parisc               randconfig-r2308-20261115    gcc-11.5.0 sparse
> parisc               randconfig-r2309-20261115    clang-20   sparse
> parisc64                             defconfig    clang-24
> powerpc                           allmodconfig    gcc-16.2.0
> powerpc                            allnoconfig    clang-24
> powerpc                        eiger_defconfig    clang-17
> powerpc                       ep88xc_defconfig    clang-24
> powerpc                     gamecube_defconfig    clang-24
> powerpc                        holly_defconfig    clang-24
> powerpc                   iss476-smp_defconfig    gcc-16.2.0
> powerpc                  linkstation_defconfig    gcc-16.2.0
> powerpc                   mpc885_ads_defconfig    clang-24
> powerpc                     mvme5100_defconfig    clang-24
> powerpc                      powernv_defconfig    clang-24
> powerpc                       ppc44x_defconfig    gcc-16.2.0
> powerpc               randconfig-1000-20261116    gcc-16.2.0
> powerpc               randconfig-1001-20261116    gcc-16.2.0
> powerpc               randconfig-2000-20261115    gcc-15.3.0
> powerpc               randconfig-2000-20261115    gcc-8.5.0
> powerpc               randconfig-2001-20261115    gcc-8.5.0
> powerpc               randconfig-2001-20261115    gcc-9.5.0
> powerpc               randconfig-2002-20261115    clang-24
> powerpc               randconfig-2002-20261115    gcc-8.5.0
> powerpc               randconfig-2200-20261115    clang-17   smatch
> powerpc              randconfig-r2107-20261115    gcc-15.3.0 cocci
> powerpc              randconfig-r2302-20261115    gcc-9.5.0  sparse
> powerpc              randconfig-r2303-20261115    gcc-13.5.0 sparse
> powerpc              randconfig-r2309-20261115    gcc-8.5.0  sparse
> powerpc              randconfig-r2311-20261115    gcc-14.4.0 sparse
> powerpc                     sam440ep_defconfig    clang-24
> powerpc                      stx_gp3_defconfig    clang-24
> powerpc                      tqm5200_defconfig    gcc-16.2.0
> powerpc                         warp_defconfig    clang-24
> powerpc64             randconfig-1000-20261116    gcc-16.2.0
> powerpc64             randconfig-1001-20261116    gcc-16.2.0
> powerpc64             randconfig-2000-20261115    gcc-13.5.0
> powerpc64             randconfig-2000-20261115    gcc-8.5.0
> powerpc64             randconfig-2001-20261115    gcc-8.5.0
> powerpc64             randconfig-2002-20261115    gcc-8.5.0
> powerpc64             randconfig-2200-20261115    clang-24   smatch
> powerpc64            randconfig-r2100-20261115    gcc-15.3.0 cocci
> powerpc64            randconfig-r2104-20261115    gcc-15.3.0 cocci
> powerpc64            randconfig-r2108-20261115    gcc-15.3.0 cocci
> powerpc64            randconfig-r2111-20261115    gcc-8.5.0  cocci
> riscv                             allmodconfig    clang-24
> riscv                              allnoconfig    clang-24
> riscv                             allyesconfig    clang-24
> riscv                                defconfig    gcc-16.2.0
> riscv                 randconfig-1000-20261116    clang-17
> riscv                 randconfig-1001-20261116    clang-17
> riscv                 randconfig-2000-20261115    clang-20
> riscv                 randconfig-2000-20261115    gcc-8.5.0
> riscv                 randconfig-2001-20261115    gcc-8.5.0
> riscv                 randconfig-2002-20261115    gcc-11.5.0
> riscv                 randconfig-2002-20261115    gcc-8.5.0
> riscv                 randconfig-2003-20261115    gcc-8.5.0
> riscv                 randconfig-2004-20261115    gcc-15.3.0
> riscv                 randconfig-2004-20261115    gcc-8.5.0
> riscv                 randconfig-2005-20261115    gcc-8.5.0
> riscv                 randconfig-2005-20261115    gcc-9.5.0
> riscv                 randconfig-2200-20261115    clang-24   smatch
> riscv                randconfig-r2104-20261115    gcc-9.5.0  cocci
> riscv                randconfig-r2107-20261115    gcc-13.5.0 cocci
> riscv                randconfig-r2108-20261115    gcc-11.5.0 cocci
> riscv                randconfig-r2110-20261115    gcc-15.3.0 cocci
> riscv                randconfig-r2110-20261115    gcc-8.5.0  cocci
> riscv                randconfig-r2305-20261115    gcc-8.5.0  sparse
> s390                              allmodconfig    clang-17
> s390                               allnoconfig    clang-24
> s390                              allyesconfig    gcc-16.2.0
> s390                                 defconfig    gcc-16.2.0
> s390                  randconfig-1000-20261116    clang-17
> s390                  randconfig-1001-20261116    clang-17
> s390                  randconfig-2000-20261115    gcc-11.5.0
> s390                  randconfig-2000-20261115    gcc-13.5.0
> s390                  randconfig-2001-20261115    clang-17
> s390                  randconfig-2001-20261115    gcc-13.5.0
> s390                  randconfig-2002-20261115    clang-24
> s390                  randconfig-2002-20261115    gcc-13.5.0
> s390                  randconfig-2003-20261115    clang-24
> s390                  randconfig-2003-20261115    gcc-13.5.0
> s390                  randconfig-2004-20261115    gcc-13.5.0
> s390                  randconfig-2004-20261115    gcc-8.5.0
> s390                  randconfig-2005-20261115    gcc-13.5.0
> s390                  randconfig-2200-20261115    clang-24   smatch
> s390                 randconfig-r2104-20261115    gcc-8.5.0  cocci
> s390                 randconfig-r2301-20261115    gcc-9.5.0  sparse
> s390                 randconfig-r2307-20261115    gcc-8.5.0  sparse
> s390                 randconfig-r2311-20261115    gcc-8.5.0  sparse
> sh                                allmodconfig    gcc-16.2.0
> sh                                 allnoconfig    clang-24
> sh                                allyesconfig    clang-17
> sh                         apsh4ad0a_defconfig    gcc-16.2.0
> sh                                   defconfig    gcc-14
> sh                              espt_defconfig    gcc-16.2.0
> sh                    randconfig-1000-20261116    clang-17
> sh                    randconfig-1001-20261116    clang-17
> sh                    randconfig-2000-20261115    gcc-10.5.0
> sh                    randconfig-2000-20261115    gcc-12.5.0
> sh                    randconfig-2001-20261115    gcc-12.5.0
> sh                    randconfig-2002-20261115    gcc-10.5.0
> sh                    randconfig-2002-20261115    gcc-12.5.0
> sh                    randconfig-2003-20261115    gcc-12.5.0
> sh                    randconfig-2003-20261115    gcc-16.2.0
> sh                    randconfig-2004-20261115    gcc-10.5.0
> sh                    randconfig-2004-20261115    gcc-12.5.0
> sh                    randconfig-2005-20261115    gcc-12.5.0
> sh                    randconfig-2200-20261115    gcc-16.2.0 smatch
> sh                   randconfig-r2102-20261115    gcc-8.5.0  cocci
> sh                   randconfig-r2105-20261115    gcc-9.5.0  cocci
> sh                   randconfig-r2107-20261115    gcc-16.2.0 cocci
> sh                   randconfig-r2304-20261115    gcc-8.5.0  sparse
> sh                   randconfig-r2309-20261115    gcc-8.5.0  sparse
> sh                           sdk7786_defconfig    clang-17
> sh                            se7206_defconfig    clang-17
> sh                    sh7724_generic_defconfig    gcc-14
> sh                               ul2_defconfig    gcc-16.2.0
> sparc                              allnoconfig    clang-24
> sparc                                defconfig    gcc-16.2.0
> sparc                 randconfig-1000-20261116    gcc-16.2.0
> sparc                 randconfig-1001-20261116    gcc-16.2.0
> sparc                 randconfig-2000-20261115    clang-24
> sparc                 randconfig-2000-20261115    gcc-8.5.0
> sparc                 randconfig-2001-20261115    clang-24
> sparc                 randconfig-2001-20261115    gcc-8.5.0
> sparc                 randconfig-2200-20261115    gcc-16.2.0 smatch
> sparc                randconfig-r2101-20261115    gcc-8.5.0  cocci
> sparc                randconfig-r2102-20261115    gcc-15.3.0 cocci
> sparc                randconfig-r2103-20261115    gcc-8.5.0  cocci
> sparc                randconfig-r2105-20261115    gcc-16.2.0 cocci
> sparc                randconfig-r2106-20261115    gcc-8.5.0  cocci
> sparc                randconfig-r2302-20261115    gcc-10.5.0 sparse
> sparc                randconfig-r2308-20261115    gcc-16.2.0 sparse
> sparc                randconfig-r2310-20261115    gcc-8.5.0  sparse
> sparc                randconfig-r2311-20261115    gcc-11.5.0 sparse
> sparc64                           allmodconfig    clang-20
> sparc64                              defconfig    gcc-14
> sparc64               randconfig-1000-20261116    gcc-16.2.0
> sparc64               randconfig-1001-20261116    gcc-16.2.0
> sparc64               randconfig-2000-20261115    clang-24
> sparc64               randconfig-2000-20261115    gcc-15.3.0
> sparc64               randconfig-2001-20261115    clang-24
> sparc64               randconfig-2001-20261115    gcc-9.5.0
> sparc64               randconfig-2200-20261115    gcc-13.5.0 smatch
> sparc64              randconfig-r2100-20261115    gcc-8.5.0  cocci
> sparc64              randconfig-r2101-20261115    gcc-9.5.0  cocci
> sparc64              randconfig-r2107-20261115    clang-22   cocci
> sparc64              randconfig-r2109-20261115    clang-20   cocci
> sparc64              randconfig-r2300-20261115    gcc-8.5.0  sparse
> sparc64              randconfig-r2303-20261115    gcc-8.5.0  sparse
> sparc64              randconfig-r2304-20261115    gcc-10.5.0 sparse
> sparc64              randconfig-r2311-20261115    gcc-8.5.0  sparse
> um                                allmodconfig    clang-17
> um                                 allnoconfig    clang-24
> um                                allyesconfig    gcc-16.2.0
> um                                   defconfig    gcc-14
> um                              i386_defconfig    gcc-14
> um                              i386_defconfig    gcc-14
> um                    randconfig-1000-20261116    gcc-16.2.0
> um                    randconfig-1001-20261116    gcc-16.2.0
> um                    randconfig-2000-20261115    clang-24
> um                    randconfig-2000-20261115    gcc-14
> um                    randconfig-2001-20261115    clang-24
> um                    randconfig-2200-20261115    clang-24   smatch
> um                   randconfig-r2100-20261115    gcc-14     cocci
> um                   randconfig-r2104-20261115    gcc-14     cocci
> um                   randconfig-r2107-20261115    gcc-14     cocci
> um                   randconfig-r2108-20261115    gcc-14     cocci
> um                   randconfig-r2109-20261115    gcc-11.5.0 cocci
> um                   randconfig-r2109-20261115    gcc-16.2.0 cocci
> um                   randconfig-r2110-20261115    gcc-16.2.0 cocci
> um                   randconfig-r2111-20261115    gcc-11.5.0 cocci
> um                   randconfig-r2111-20261115    gcc-15.3.0 cocci
> um                   randconfig-r2304-20261115    clang-24   sparse
> um                   randconfig-r2307-20261115    gcc-11.5.0 sparse
> um                   randconfig-r2308-20261115    gcc-11.5.0 sparse
> um                   randconfig-r2310-20261115    gcc-11.5.0 sparse
> um                            x86_64_defconfig    gcc-14
> x86_64                             allnoconfig    clang-24
> x86_64                            allyesconfig    clang-22
> x86_64      buildonly-randconfig-1000-20261116    gcc-14
> x86_64      buildonly-randconfig-1001-20261116    gcc-14
> x86_64      buildonly-randconfig-1002-20261116    gcc-14
> x86_64      buildonly-randconfig-1003-20261116    gcc-14
> x86_64      buildonly-randconfig-1004-20261116    gcc-14
> x86_64      buildonly-randconfig-1005-20261116    gcc-14
> x86_64                               defconfig    gcc-14
> x86_64                                   kexec    clang-22
> x86_64                randconfig-1000-20261116    gcc-14
> x86_64                randconfig-1001-20261116    gcc-14
> x86_64                randconfig-1002-20261116    gcc-14
> x86_64                randconfig-1003-20261116    gcc-14
> x86_64                randconfig-1004-20261116    gcc-14
> x86_64                randconfig-1005-20261116    gcc-14
> x86_64                randconfig-1006-20261116    clang-22
> x86_64                randconfig-1007-20261116    clang-22
> x86_64                randconfig-1008-20261116    clang-22
> x86_64                randconfig-1009-20261116    clang-22
> x86_64                randconfig-1010-20261116    clang-22
> x86_64                randconfig-1011-20261116    clang-22
> x86_64                randconfig-1012-20261116    clang-22
> x86_64                randconfig-1013-20261116    clang-22
> x86_64                randconfig-1014-20261116    clang-22
> x86_64                randconfig-1015-20261116    clang-22
> x86_64                randconfig-1016-20261116    clang-22
> x86_64                randconfig-1017-20261116    clang-22
> x86_64                randconfig-2000-20261115    gcc-14
> x86_64                randconfig-2001-20261115    gcc-14
> x86_64                randconfig-2002-20261115    gcc-14
> x86_64                randconfig-2003-20261115    clang-22
> x86_64                randconfig-2003-20261115    gcc-14
> x86_64                randconfig-2004-20261115    clang-22
> x86_64                randconfig-2004-20261115    gcc-14
> x86_64                randconfig-2005-20261115    gcc-14
> x86_64                randconfig-2100-20261115    clang-22   cocci
> x86_64                randconfig-2101-20261115    clang-22   cocci
> x86_64                randconfig-2102-20261115    clang-22   cocci
> x86_64                randconfig-2102-20261115    gcc-14     cocci
> x86_64                randconfig-2103-20261115    clang-22   cocci
> x86_64                randconfig-2104-20261115    clang-22   cocci
> x86_64                randconfig-2104-20261115    gcc-14     cocci
> x86_64                randconfig-2105-20261115    clang-22   cocci
> x86_64                randconfig-2105-20261115    gcc-14     cocci
> x86_64                randconfig-2200-20261115    clang-22   smatch
> x86_64                randconfig-2300-20261115    clang-22   sparse
> x86_64                randconfig-2300-20261115    gcc-14     sparse
> x86_64                randconfig-2301-20261115    clang-22   sparse
> x86_64                randconfig-2302-20261115    clang-22   sparse
> x86_64               randconfig-r2101-20261115    gcc-14     cocci
> x86_64               randconfig-r2102-20261115    gcc-12     cocci
> x86_64               randconfig-r2105-20261115    gcc-15.3.0 cocci
> x86_64               randconfig-r2105-20261115    gcc-8.5.0  cocci
> x86_64               randconfig-r2110-20261115    clang-22   cocci
> x86_64               randconfig-r2111-20261115    gcc-13.5.0 cocci
> x86_64               randconfig-r2302-20261115    gcc-8.5.0  sparse
> x86_64               randconfig-r2303-20261115    gcc-8.5.0  sparse
> x86_64               randconfig-r2304-20261115    gcc-9.5.0  sparse
> x86_64               randconfig-r2305-20261115    gcc-13.5.0 sparse
> x86_64                                rhel-9.4    clang-22
> x86_64                            rhel-9.4-bpf    clang-22
> x86_64                            rhel-9.4-bpf    gcc-14
> x86_64                           rhel-9.4-func    clang-22
> x86_64                     rhel-9.4-kselftests    clang-22
> x86_64                          rhel-9.4-kunit    clang-22
> x86_64                          rhel-9.4-kunit    gcc-14
> x86_64                            rhel-9.4-ltp    clang-22
> x86_64                            rhel-9.4-ltp    gcc-14
> x86_64                           rhel-9.4-rust    clang-22
> x86_64                           rhel-9.4-rust    clang-22
> xtensa                             allnoconfig    clang-24
> xtensa                            allyesconfig    clang-20
> xtensa                randconfig-1000-20261116    gcc-16.2.0
> xtensa                randconfig-1001-20261116    gcc-16.2.0
> xtensa                randconfig-2000-20261115    gcc-14.4.0
> xtensa                randconfig-2000-20261115    gcc-8.5.0
> xtensa                randconfig-2001-20261115    gcc-10.5.0
> xtensa                randconfig-2001-20261115    gcc-14.4.0
> xtensa                randconfig-2200-20261115    gcc-14.4.0 smatch
> xtensa               randconfig-r2103-20261115    gcc-8.5.0  cocci
> xtensa               randconfig-r2106-20261115    gcc-13.5.0 cocci
> xtensa               randconfig-r2107-20261115    gcc-8.5.0  cocci
> xtensa               randconfig-r2300-20261115    gcc-10.5.0 sparse
> xtensa               randconfig-r2308-20261115    gcc-8.5.0  sparse
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
