Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266035;
	b=Y6h3NsAfnlmItIsoYa6Ir5Dza+qutc+poSzrguPAVIOJ6E1wnktVThDzpb5c/LUTlXyb
	 pSgok1vEDGKKH9h7u10r7IbI6K70ehKDiZSNsKXH4AFca4nd4xBTagn3ZnHdpw2Yt7IlG
	 xMvZRSdxSxdv2IwGbetgQX8xu47H7+8nNoejg/3pVBnImSM+bCN1mjQw37rTIsHD/CpoT
	 Ojg5J+chsCiXA6o1+ZKFAdIKyp6ijiyNvhy538x8v1XFkCnEdzUhrGTM9W7tdjVpdA8R4
	 s0ufHxC7mBbpfzKNOzfPzfWHiJwYayfROWAkZMPEUD0yCVWTgXdpFK6NDCKxEfxcOqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NXIuNB3ZQ4GT/Hz3ry1FYljBSts0wnPjJe/0CXC9B/Q=;
	b=ik86/PEZ54ckwr6sKhdEZZyGhShBnwpygFaF9kCxH/Ap5BeKNfdeAeV3eDrV3d4j8KQA
	 qffBRJHGbS1/uIbWJO4OXhKJgsXeOOddxjxiea8kd06+OsjOSls4vdMtkKCTYlj/Ptfeg
	 r3HhacGfkrBJmDFyCigzCkfIFHU7ShBGcwA/4RF4f2nX8GG1gDMDw1Lu42QfQ65qozQMk
	 FIiYMX2bAoJE/FpCql/lHif4kMZ+qRjLl6m5xkAkQP3jg8KS8owM3cZ09l4wfEBi/XSxg
	 URFONmdQReshxwfYtSfWKcHkmNEtteyXS+SizS9JAFCf1JjqNfaoI5xYpcWG5ZqUO6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RNtRAbmQ;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1C8606A330
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 13:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B1C8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RNtRAbmQ
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-9496577d4c4so211391185a.1
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 05:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795266034; x=1795870834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NXIuNB3ZQ4GT/Hz3ry1FYljBSts0wnPjJe/0CXC9B/Q=;
        b=RNtRAbmQYXLSiaEjtX2aUWytq3ybkP6vzvMM/GYzBbb22sqY7OMQwI+6PVQp9DHcAr
         lhyzXBhfLKqVcuJ8sVYNtP2aRDK4nll7J9DPE5KKQ2CAiVa+LkTWYungYQISMsCYyeh8
         hpGt4X4Nli6qalkIo2q0QmQpZOhYwDWO5tabVR1HVgZiiW3bleQnCJNRgfq3ll0kyepq
         3gsRAOgqgRVcju81U/9by/AXAbdfkcF2NzQSoJbhod4BZL71XZp0atz6aRPfoC9lunEa
         hlKhShuYNK3XPf/2DcuSXs5DhYd1yfNh3h4hIJmP4ba3ACaEg6LShMxd5328jY0CMk/1
         hndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266034; x=1795870834;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXIuNB3ZQ4GT/Hz3ry1FYljBSts0wnPjJe/0CXC9B/Q=;
        b=Vx+IddRbMfWjL0oZp+W5bWs9TQUEMn2+tKHQknKGOBnVxaKdqSonP8/elnjIbKTvdy
         meOPLlr9CDQuQq+DkTbpHB+6Vz54hiloDt7xvOHzQDGM9FmpPR314ykFMhRihoSRiYys
         yYxj2mBZ2UIllQGcpaTUSPyC/OtaG9iNiB5KFd2mupVM/HXbNkVkfx9Kyb+XnikBv1y5
         rxIpw8VUIwAyntMjVgJUXfnBtUSxHImGP/GMtfUiKTdZv+wjdquA44M2xiI87sA2g/On
         C6jWTRsHK9k2PKKyTYSGVGa8wR4Uk4ZZnWZe2qe7euUA13ukIrEV0EFC0xyKHi0V0qOy
         SeaA==
X-Forwarded-Encrypted: i=1; AL+hErHml6IFiNBxP+nGhs4iVq4Pf9U/p7ws+NjkmkK7H1IRefqZ5cl98s2PqTNNiZm3cpU6RxixuVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z92EtoZba+0TaF7FO0uPQ6de9z0blWnLK4W2ySY591RCTStiq5P
	wzZEiXCbvqfYHO2Ltsa7UD0ZubUpFcLrKpzuuvzyjw3x23CTgUJhRZ6zf597r3Qo+AU=
X-Gm-Gg: AZFdTZdp3D7v2YJpj+GElkaf88/PJvfDOo6Q22Wd56mnprwkySn4I6BZOkTd1pcZQOd
	nJUdbfQuBQKCqEj2i33lfK57MXbV4XUtopf8hCE2HBed+Bt1wdXkxMtuppcI1p3sREkYIbkH+EU
	oY0ZeAn6SbUpyGCXJZv/a3kyy7lwcy9sMtYUMyqLKCVljQx5EsXsnbU19ziLzrjXyc9lG8f4yfF
	fIOGJE9UqqsKlKtvwevkNcazD+Zf1IISoWD6I9X9lBI4UMILzTXgILbsX+wYR3XwcWs9TOhCLmJ
	hxNxifApkqyo2MQ+PNeYK8GojqL5SQP/8fT46C9Wx2yIF+/Njig+yGlbYRP/prsC0ajsUS6rmEH
	jF/mNPRKqa3Idjbom/OctA22JO7WlfBGX13Rnj4dnaMSi8moWoyBAjySxPFbU22X1+bXtTrleFU
	PKpNKpVu65Nocx4SJ4UvV8tEX3rVnFLQosQbUjgio4xEfHwue1RJQ07OffVzQOqKf/3g0tWNUTn
	kN2sDsLddGd2K19JX07bGBZw6zJc8pMC8JuVLVmblxtnEtxKhk+IM8YCzomC8sWbr3Rm/Ji1LHg
	wag6Fig4WEgnc1zmExDjq/RmVCfaG2H3OzyDuBcNBBjjeDGtIXmCH3g7uMBHzFwyBANkwrNW/nJ
	dRfv71NKMoVFxsQJgOTKV1i3o3fJ7cZz1SHpAQ9eN/zzDCfo=
X-Received: by 2002:a05:620a:2786:b0:93e:5677:317b with SMTP id af79cd13be357-949b35e9b3fmr1046746285a.25.1795266033942;
        Sat, 21 Nov 2026 05:00:33 -0800 (PST)
Received: from localhost ([204.244.107.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb427388sm408593585a.42.2026.11.21.05.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:00:33 -0800 (PST)
Date: Sat, 21 Nov 2026 08:00:32 -0500
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, khendry@reliablecontrols.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document
 reset cells
Message-ID: <awGV8BU_AfaXQyBv@maple.netwinder.org>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
 <awARmkCuelD_fdX6@shikoro>
 <5d8530485716d129be2efa0518254e3322cecdb0.camel@pengutronix.de>
 <awAq7vxcY8CGjhNl@ninjato>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <awAq7vxcY8CGjhNl@ninjato>

On Fri, Nov 20, 2026 at 12:11:42PM +0100, Wolfram Sang wrote:
>
>> > > +#define R9A06G032_RST_TS		1
>> > > +#define R9A06G032_RST_MIIC		2
>> >
>> > I didn't find any listing of the resets in the RZN1 docs, so coming up
>> > with arbitrary numbers as we need them seems okay to me.
>>
>> Why aren't we starting at 0?
>
>I wondered as well but clocks are also starting from 1, so we could
>argue with consistency.

The clocks use value 0 to indicate "no parent clock", but only for the 
".source" element of struct r9a06g032. The encoding macros add and 
subtract 1 to the clock IDs, so it should in fact be possible to use 
0-based values even for the clocks. Too late to change now since the 
values are encoded into DTBs.

Thinking about it some more, perhaps instead of using 0 as the special 
case for "no parent", we could set .source to match .index. In other 
words a clock pointing to itself means "no parent". Worth changing? 

Ralph 
