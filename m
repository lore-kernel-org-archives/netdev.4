Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122915;
	b=wIW7e5YSg+uNZuynzwA/wKFzgE4l4GbbICk+KcT1o5sxG1WgGy9cd5thQObI+qa4gP7r
	 VWvqs5dTP0nzC4kc53I2r4xXsKM6mejzSRpu8rBNX5ZQIEtZTorbrY3LfoMi2jBcWddzl
	 gYcV5wj2NcXnZkXMA8e291uS6iCHTuQtNi+q/+CPO++4lzE7gsnSMlHTwi4l9rTZjEBDz
	 salkQ7tELiErkq+He/A3aG7Of4VJZX2Yab0MW0+et9JI5lAy7rwy1ZCLRFBmXe/PXV6Lz
	 VrdHg2IH18RZdAA/QraTX+aPudFHPWjnLR9Y4Mrby+DnO1anPPP5Uecsr/5pw+xacvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L2RyQcOZXF1NiXE7RHnhrWrwU4nZkf2kDZOAz8z7ouw=;
	b=PgUTSV8xwwive4ySqCCtC9dAmuSD2juN5rwQgp3jmAzriCO/2p2RAkSFRMts0FVSlq6f
	 XGPpJ3kSKw6TPmlwXwKr+BMHELNbU1ZJR9Ezuce9DqncuvwNQ1YiOfJFykjhtBSqPQMgu
	 g5W+Z5vO5VuQkyRkEVdKvWwm1c+APIPsqseKx/VzqZ4D1Rp6aMWX9eW9bWt+0AB553pqS
	 IuN/fa7eufudRuPpPhCY5ob3xHlXTTIT/GtXblBByGclMJWKBvhtNgPjRCOMfcTD3nB2T
	 6VMifZbmEJX7b4Hrk20blK2bWUL5sdvkQrhI/4T0CUCB1Nk1oh9mN+j/BJZmmNhGuHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YVWDHW7i;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403CF60A2606
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 403CF60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YVWDHW7i
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5365d725440so2447551cf.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795122911; x=1795727711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L2RyQcOZXF1NiXE7RHnhrWrwU4nZkf2kDZOAz8z7ouw=;
        b=YVWDHW7iCruiAOVwlcK6OzpMh2PB/0sv9z5Xf+JAVkcE/WMJg0GwVnSHXpXzus1PE5
         qUqRwEWgmFfXRut2f35BaM7a7fSfFj11mOFC8fTBL8hWjCNj8MyVjih7g+nx/+yosVyI
         VumBeS6oyLOhGSovEzCCCMnix/7RFsuYgn6zqOKKiBevPMpgW52zYEsTWfYviM/0/K+R
         94V996npreb830xbhrb/gmJJ/AtFIb0TINW2R/RCgGwbZif1sCDEzDk5xa5CHm/BqhLd
         CEs6Bp9PGpvlkI3zdqgR3FSqd9OOEnATMzUufQgSKTOiMotPJQPiHXAgQbp8PKffiD4a
         JoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122911; x=1795727711;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2RyQcOZXF1NiXE7RHnhrWrwU4nZkf2kDZOAz8z7ouw=;
        b=vvx0YdvmK2bA+kYpyl9uu+CXFF5IRjxOSMujzHFY/D0X2K4rPOJL0PVHPkWF/UCZz5
         B9/tTVLnZkB2oD3kWnViAAnpGHqxsUys/9QGymhsn68Yj6qm0fVISuLXE2rX36V4dtmb
         jZIpkqc+F5HLHu7y7QApI+FhlWogits5DsySbRLodPFoK7pAcscHz1gRddpfOlJSEAKd
         EVRRb0CXlk3AyghVsGOtNpGujinq1I+7hjyuB53vIBSj8LTVE2KzB0sZKhmNaM8X9kR4
         sUdZLRDnKU0nnPoNGfDigBhlL7SB/YWwlDHYk8yWT8NXP4OCq/HkjgusSXhqcDigXaiV
         3nMQ==
X-Forwarded-Encrypted: i=1; AL+hErHQav/T7Rj1hyCvkd8VDJ2qadLgRiXsSGxHB14+mpEWMHHpQ1k7+a2n5TzTkflB3PghTCGHcb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tu7rw0LRAVaLFWuxoxXj38YhmgwTfUCMQBHd/bIs3bVk3SZnm
	WPknmzSb4GubKiV+W7s24RkVSXmmm/XpydcK7MP+UNz1D9gfdUnSCtKJ
X-Gm-Gg: AYBFou0Pur2zTZpA9DA76o67I0ZjIh+/qQ8SrlK35x6wBkvOSvRDlKaln8Cb85JLMx/
	eIflohu/GECNt4DSgCZd2Wsi/bulNw/raxKYd7UDfGiWbwhBhBr4KvEwSzceBRS+WRwzjNwDXWh
	EYIdMJzAz0LyiEPhB1IO+FJTZZHrUHQgvysWB3b++z06TmftrhuDf7XAHIG9z3D+0VpCaEattky
	mN25e7dz4yb64AcBNtPF069IXyFh0VzrsDZj9csWdfCD6I9k2xn9Fch/CNJv28l83xdLfXQ/S9y
	dhbmVCP75UDTCBHN7xwTFf8VHICAmzIWppZFjKbe/vdwdTYUcFcqAOGJgcOXduyOBSq7f93SRYx
	0kVSnb4HEn4U/bw2rwrW1ySJVMNis9n4B941OaLcZFpCT3jjZXvULdz2rnVNK1tBYd3VHM5w6R4
	xL6nbWbv5qvjPfgmMROm3yGdf+4LYTy0kKUrFyf1fqIyP0t72mf+M6fsGhzo+v02nPyTtOURw1k
	VWdSTkZjiMYbjRJePfIlHNRFO1C1jRlx065O6zfGhFNC645eUVTwAMtVMdjeMKHd2yc8LEmAvXc
	o8eN1ZXAwQ+6stk9e1jcBQU4PxQrDQWKg3zTWCppbynl+S6zt0Dx6R218EeVMO/eXsDFlRSifGV
	W/99QJ5Ukl/CaKYRNWyYqmGgD5ErtoVqXFErYieq4Bxc8eSUSozSnFUi7Wsb+4cTN
X-Received: by 2002:a05:622a:178f:b0:531:172f:79e7 with SMTP id d75a77b69052e-55d76a6595bmr21615331cf.39.1795122911021;
        Thu, 19 Nov 2026 13:15:11 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788116c9sm5401731cf.4.2026.11.19.13.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:15:10 -0800 (PST)
Date: Thu, 19 Nov 2026 16:15:10 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Gwanhyun Lee <gwanhyunlee@gmail.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.138e4ccd85cc3@gmail.com>
In-Reply-To: <20261119144241.360238-5-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
 <20261119144241.360238-5-graypanda.inzag@gmail.com>
Subject: Re: [PATCH net v3 4/4] selftests: net: check padded vnet hdr_len in
 tun and tap
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Junyoung Jang wrote:
> Add tun and macvtap write tests with a 512-byte virtio header and a
> 14-byte Ethernet frame. A hdr_len of 256 must fail with -EINVAL
> because it exceeds the post-padding payload. A zero hdr_len must
> continue to accept the same valid frame.
> 
> These tests exercise the common header parser through both drivers.
> On the unpatched kernel, each oversized hdr_len test accepts the
> packet instead of rejecting it.
> 
> In x86-64 QEMU, the patched kernel passed all 105 tun and five tap
> selftests, including the new cases.
> 
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
