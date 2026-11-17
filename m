Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794956107;
	b=eb7Y/FHqeoPj/RGtDQUi0NYPilum5fAYOFhQdRFb3ZbhOeF+a7xM8ERuOtch6WAy1+i2
	 cb7HcHPS5sUcO5QFDGYhBY+zZ8yGaCvPBOYAtIA1FpTurEloaOCEJr1WpSY53uVXdpNyE
	 htRQjeEOq8/5Cz//GAecwxWnQYWiiNVuJXLWTYrc1OyyBw1Js32kNM4sjQGYBn2rg2E/H
	 ZqxVaiHL5CbOY5yliMFOLyCueeraM1z9yqxN8zajBsq5f0MxG5VnZXLMcYAw0smMPeZUA
	 lz1Dj8CO+50JHtdQbho43Fj+mP1imhATTVp0s3LLtqVcy6atAwO3JCxUwCmDLQVqXJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956107;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=XTWULvHY5M+9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=;
	b=CCjPsfZ+C8rXyzNNRznlzuHfpbSsHRhPmYvEGKJ60oUXVrVJlOmTdYDI6b8g/pMaPUvb
	 vG8Dr5ROIe+qvHnOAgtps5SEuLmxbpfKVh437YSVgA5wdhr4DTo8QbMVFjOEze3hbbKBF
	 gaBxrEaue5RZkNYdcyv+0qVKHM/IAsdc+L74z7Z1omLcHhEE+5D3dvYZvLGIqCLfijuFl
	 Kjwt7xurj5gvaGlTA1ZNYEG1qXyAf+qK46ZEJaRIpO8CeMsY+alZWPy3OqbwCbQPUJ7DY
	 e8wuzlZWiAXZGkvLSD4YbpFlmEwkPbnUufvPdHyuEHVDuFkAo1rQw9r1oLoRbA/B8Dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NPDWNUn6;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2112606A32F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2112606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NPDWNUn6
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMfqur4155448
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:55:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=XTWULvHY5M+
	9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=; b=NPDWNUn628COc0atYZ/CbMaWxG+
	0TNGfxRCGsv1WrYANoIZaC+tKoYjD5X8kNmyXR8dpBZayuNDuuUCja+hWrjMqbQc
	XxkpdvsWiVArTT9UJfikfZbnelRb/DRpVlYgtxXFa3XtPyVF0540TWjYmvrsqO+P
	R+hi3LRmruY6Y/3r56HGQKoFy0CaepMpMmZG4klMBviT1U+1fEaeySnvKUF8n+Z1
	Wfi1IZWcGzocGnaz/SNYLQqLT3qgJR8XlBsQ+qKgyEYQQVpJE2NW3vnlCVKHFSdC
	M3nFonl+TButab+DN9Vmtl2UIUTzMNzzvKDIVO34G60V2AXaydz6Pdka2IA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0yu785mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:55:05 -0800 (PST)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb8931aeeaso184178a12.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794956105; cv=none;
        d=google.com; s=arc-20260327;
        b=do6vZeCJGoUDD5Kaso8mQNLv9SaeHBMzemoj4gtmWSBaZ4MuzamGLRMPKyHGEG0Yax
         O5tdf86NgKWJhl/NHBQFjIYwebXS77yFfV2ZDyJwrehpRBYOX4HVZT6HAAmyi/p7Z26M
         bTXiq3RXM9q4Ck+T2CCXYnlaWFUgUT4/+YUpIVdnuqeqE1ituJvs/0p/dHSViWMHQ7UV
         XevrATvdBe+FUWXC2al+IQO8IWhpnsEVt6PcfRP8C6YpZaKGSIbPNaKWTT/4aMfA/har
         kp9mP4d1CbLP5lNVhpeNHxLahzn7DcX7bx4QJQt0r++ISnOdqdYxABID+dzPCnIE3QCS
         f7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=XTWULvHY5M+9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=;
        fh=qod244yoB3Swx6BT8pwI4iCjWBm8w97P4EwtSYE3820=;
        b=j0b2LPowcurby81Hiw/VJ7ybogqQJOksvr4uYYJ4mgBY+rRk/aXXKW7+MZRTl8jWnm
         fxW0S1Zc7uJXqZ3qT5QpfVPwsSlvWvPiVEHnmocTqQ4IwT+Yx0/aCVHh7h0wIsY5NeBX
         NaNq+TA8Z1uLk251Z4FNIWqBYj0SQrhFhKZzEV845+yPDRYq+xS6V81b7XK1SCjEJeSr
         106bHn2WYNJTesmogptEd9mJpKN2Z46t5t56DyIwt920DXgs1yjGisA4O2VtIYGvy/gt
         gHN1z06A3vVAgqxQpZ1sbGj6mguKsm2etXYxBeL0IkeiX96MHO8j9yzHTr1plBxJ91Hv
         PPuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956105; x=1795560905;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XTWULvHY5M+9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=;
        b=PftBHzgKzQSp5++dEm8ixkRyEt2wCbGsA+wgWIyrje2gik/Gg6ncBcF4nmit03JzYI
         efvJG2o65Fj1fSDGG06ALAb57Hef1+AlDhee4uOT7P+Vh+ooJK989ix1g5lXsgembDLd
         rmzgNlGTE97BPD0qwtJErgiHi5WFM7sB7W/8ufVnysb2PNCy6lJEEQwTOm9phWZPmixH
         mVdsKh/O38Empqs2yXQiqx++zU6Bg+luyO17/ez5LsEiBEVj3jjt0QwFblOlDngLgB5a
         apDoJkFdaRvXp79hH9hNXf0Frtmr82RzYs6nb4kzkvbMb8n0IPM9Vw89VCka982xV4xo
         h6rA==
X-Gm-Message-State: APuU4Z+rFPyAi2Sz5VqXDSvAvSgOgVTPmXpd1xTPRJZORfldlxiYcsQi
	O+2uM7ZHG7P3fyH1fcfpSCoJ0JhAnG0e1QNCWdf/hx9K0XxCp/C++anR5UL+kW8INqIG6sU5tG/
	escPCOS5CW5hXTAKhSi38mZ+kECvvq7+KeAgSefeBUdkfa3AsREtwmVTCumbO5cUtNsv6TBDuxM
	YbptCA2TtQSW+D5OyuSAcIi+WzCq7E/J4=
X-Gm-Gg: AZFdTZcIuwwsn9mHvTqqiXfHRQIEaFbPHVqBdWZc5r/u/dDfMAK5VAZgmaJ7d2U546K
	dVLLfmiOPr+/Bojj8p0UTSlYAU2l31Gu/EDqJTfpUUddYmVBskdvED+vH/ZHqZ4BqxVe9q3gtPG
	XfUiTTIo61SM8oOC/X1SMjWeU/aGtGPcFTnFmIeZMR2b3GzRk23e1xDuAekSMbZZkMfsJFqSrzq
	vraBie63kxUNLYZs3cKF03RaO7dIc53srcZ2xXAwbbAssHezkE=
X-Received: by 2002:a17:90b:5390:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3b3d0640f3bmr891142a91.6.1794956105105;
        Tue, 17 Nov 2026 14:55:05 -0800 (PST)
X-Received: by 2002:a17:90b:5390:b0:3ab:2d17:51c5 with SMTP id
 98e67ed59e1d1-3b3d0640f3bmr891106a91.6.1794956104611; Tue, 17 Nov 2026
 14:55:04 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-11-toddfreed@meta.com> <179471270629.2199510.9480561958902023552@kernel.org>
In-Reply-To: <179471270629.2199510.9480561958902023552@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:54:52 -0800
X-Gm-Features: Aa3M54pEdqPp10DAjnIjgsYaaHWMRisY79HeZKYFQbRbnu5DENxcJuo9y0o8SvU
Message-ID: <CADh2yMxPrJZNtVdCgQWkHsKBk0cnAZ-0RiVaCMquQNSH8K32Mw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 10/15] net/sched: flower: add psp_spi,
 psp_ver, and psp_dev matches
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX01zlt0LUveBE
 aGkNYaGCEDm3VgLvfL7Jv5Y8tquKhAl9Iow1pNydTr/5gvPjh/7RNIKs5w/49cHXx/lom9Vi4o8
 Y2wW1/bR5831+h+ZOvitUYmgQfTRj05H+cCweca32HLBM577RdPuF7qbg3mp+Huj5UXjBUr3xh7
 7sKk55jaTSyRPNjpBC140wRPmKUulnPJv4+sCfowqAdBHdAB7dtbclOsdU2F4QNDAc1+r8cknNv
 w0YtGPXPltQHWnpZHl0BpO/0mCjaJzqMggSh01uLQQb71V/hTpzBMJOXuI9H8p5kNHQo/2kEn7X
 zZHLsJ7qN7aW/rV1Rv5GrN4k8j05nvAUTC1XJzFrvsOdHZ853GLdgq6h+a7bR8uKlbGT72pCgkd
 J2tp946STHm+wGY2Lr8yygAie7C1MrTUUCt2kNgRyFxXrH0F0Kxhmyk7vnquv9/bvdEvwGxyugu
 TBut93/M9c9zULjc5rg==
X-Proofpoint-GUID: cuoVff3PANTd0YVkjA5rspioMm7I3w7z
X-Authority-Analysis: v=2.4 cv=Zph4uN7G c=1 sm=1 tr=0 ts=6afcdb49 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=PAz_-FQ8hEVmOPYdF0yf:22
 a=e8l9bKk9WhIOE85pT1MA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: cuoVff3PANTd0YVkjA5rspioMm7I3w7z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX+MTunDrtPmVT
 3TCJWYhq2kd+wPEDO8newEdXE/hB13hnEHfrycJMu3pOnrOdCEmtu/jFZ5qqSwtS5Mowgr6D1fM
 c+i2Y2Y1kTIiXcF0bYc1UqGMsTcpfoQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
> Does the commit message describe the right failure mode for rules that
> are still installed after two key rotations?
>
> The commit message says:
>
>   Together these matches tie a rule to one association, ...
>
> and:
>
>   this means that a rule matching packets that correspond to an rx
>   association which is stale (two rotations have passed), can still match.
>
> The "Socket-less associations" text that a later patch in this series
> adds to Documentation/networking/psp.rst has the same gap. It only says
> userspace should replace such rules before two rotations, and it repeats
> that the matches tie a decap rule to one Rx association. No later patch
> in the series adds a generation match or any enforcement.
>
> Could the commit message and the documentation say that a stale rule can
> end up matching a different association that reused the SPI, rather
> than the stale association itself?

In v2, there are no Rx associations. It will be more clear that matches tie a
rule to a SPI not to an association. And the reliance on userspace to replace
rules before that SPI could be re-used, will be further highlighted.

-Todd
