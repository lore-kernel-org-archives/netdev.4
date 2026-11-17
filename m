Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794954007;
	b=VK9niIJU0B7bex/n9jUw79K6lc8/lI9aKycOBFZ6pZo2kfHkcwiKgGFSJJ1El8Z8GrIQ
	 6Gdoc9eeCNxQlawEOeD1FPtrhaoZXgg8KTn6q2k/4addhWI1gOTSU8Kl85nf11oTL1yvj
	 75WFHOwScHB5Sqxb0fZnevvHnO7d1ulFNwaotuhQSjdSc668hKx/6zoUtD57IAnMoJk6P
	 yXLATU+UedAAEeRLX7dBKKElJ7SkWgwP7nPug40/8/4LxvKAYnb4DfYcs0MIYOXbifIAA
	 F0NBzhtK1aZG/cOW4iHK8ai9JJtk6f57ELmDGS5CnMNTxPA1gqN5xWa+0KaTrA7srbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=MrBB22VyQQ34wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=;
	b=VLc2kNUe9SWYNWgtdf63DiDIkcTbm9IOlc8SIhaMcwH5VnXKWUAx9R+d95420oaBgVN4
	 Jp9zGGPUgXweyHQwuUBXyFCZYk3/Ft+KvXTmUXUrXsDg7sSHMFPXO2XcovxN6qk+feqaR
	 TQAYLpRf23qkhwFZ95DEjrkLiKpzcH0O6iek+Y5vApvEN8GYaoNu/GOrqKIPa86KHEMED
	 hMzUC1+aMNAuuWJ2oCnQg6HKqKAsKT6HFDTRAX+naVXecKf9hwfa23Ne7Y0U278wKPQy5
	 2Ti6Io8JCnBXzYpHRGzzJFBrov8O3Fx2Pp4daTuaIApNJCHkg+zH9O2994R4PlzYoZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=de3QWr9u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB46C606A33D
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB46C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=de3QWr9u
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM24MR2211462
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:20:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=MrBB22VyQQ3
	4wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=; b=de3QWr9uJo7zpRux5nSBZrQPJI1
	ZuT9RzWRGoDJ4aCQ9SrU4Xxw9lwDJ7b3OmHlR8+w5tIEz3UPpJzxlfS7NWR2ntEF
	Sx5JJxBsNLgjr1SvG/Lb2/HWRTnrHpAqHnl2JEhCnWbe7ecSMNitIJpelIQxT7L/
	5ownN3a8BAw3B6TX+M2l1KOePj+0a7YZornHlcIw3dusVrCnZ3PNUvjXrb1W3Jbq
	9eI4VDUod9rq0HPbutUCHOxnMkEyvDODXmpDon9TP7Jv9fAYKQLTeTydSUIZhpUC
	6/Ldc6GrPMpfUutcKYiSWDp5WJmepsbra64rsMl8Xl+kkyO3/xGEv7ORWJQ==
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0sgnvnbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:20:05 -0800 (PST)
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4a3052225cbso241904f8f.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:20:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794954004; cv=none;
        d=google.com; s=arc-20260327;
        b=LXgXchtEZSV1jn6jLkyRWUcfqnhc8xzTGCSl16k9FnHFQqQnfMLn6nzPNUqom7K5zL
         SA5ut/JPTE+9y9GMk/BLFtktNpt/pZU3n5lv/sudB/NkTS0gBETnGgyxUSU8hTUaFiGp
         mWHslkICzPFmyULb9syeM06u5TKc+9FNrXNenIX7r/J1xWHFwn7vt1JabcPGRB3B+yvA
         8fWyxQDutxVPyKjbGny3K1B49EuIlMEB4ZshzZmOJgj8vG9pFWpO7UzkJ7QFcewc7ECB
         OUW4cImHfrAAiJ9Ta5oQLvNDQKtqAYFImB9GLd06SlEq0G0gZAHJjZzi4AOJLVrRTUVC
         6lCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=MrBB22VyQQ34wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=;
        fh=qod244yoB3Swx6BT8pwI4iCjWBm8w97P4EwtSYE3820=;
        b=DDrMlbbpa+VOm/jIlD/T4jv2Yu/rbIPXnVriKLGGBq36DwVnqXkFT+dg2vKbjKkp8H
         KdljJNxA7qQLHLlWLWRbsqzR4thmuWOIENDAymNWtlxKjyT9EduvqBIYuJ+8mdiqlPY9
         cM9Uy9bKBll2/LsB++4f8ADctlrQKANdR3LqLD7kcy44V671x68qaO8AOsSEfoqMH/+g
         FcERuS2wGOqR+bciNEYtoB0OOh9OVzqe8snVbRWGVKRrpPd+HAZwgQ/tWXradwUE8DOU
         XTV3GsZRx6U/MzD2R003fEZ1BJ1RxnzQS2dMIsG7J1as8D82vkI0LXjQcPHlQ7GP6WTb
         8wTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794954004; x=1795558804;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MrBB22VyQQ34wvgxAVrSinsIzWNGkBwccDyrerQ8zrY=;
        b=MMVg6KvDwzAqksVNqlCSdtzLIG4mJ29HqnyO0CUyj5O7Oen1wg+98yyH40T/zsXibm
         3QOmoBHyjJb4FPZecLdfPLvx4alV/0UIu4rhk9OrbYIx+vfAZQYA3OlBbkAooymcDAsP
         w08yiUTDIxwiJ/5c9fTKsV0IWXO/GhJ3cet+SibWLHbTyV6xDtcdOn/F5MGC4qT68gMh
         36v9NZEUSJSHnRxziKxN3SjZkVjn9A09Q8xVfgnS/0nAsEyQmgJx1YJ4yAODabcRR/bK
         mG9KJAk2dVIySPx7dFF3ubl6TwNpPJ75CIxLuqXmwx8/lED3ZYD+zzTuhYNn+2Ctvc6O
         gKJA==
X-Gm-Message-State: APuU4Z9F2s2KAimE4hYMCM/qLC59nfT1MmYpW5tbsyW3Q1XfHchrZstd
	eJg975rfLiYGy7W+OXoqliprithj7XVVHby3+Aq/tIdB/D9CXv6EdsV73za05skSgFxPRWLtXk6
	qQuj0bKt378KC233+zqeJCHUKY8OjRbuFuBl8cyMrvHpx45/YJcMaf1fW1t6kmuJr0xoa5NqJOa
	I6v14nSPLcCAja3IFZyMjMclOGT6PH//s=
X-Gm-Gg: AZFdTZdqAt5YOePyWfz7LJMgWJ6DU5kCqiQUD1yAJRDqini0fbRS3k6YQ6X4zVGeb6G
	KeKpe7/TGnjDYcAbWugFiJRjHzon0V4nZm2RiDGg+8nyEzt36PqbF/4VKnnIUjv4A3skZeevz08
	WQ9DnBN0v7mjKoLE1QZW2iHaRigSJQf+Nq2uGIDFA+sg7LhXPCRA5zntYWZNBLw5vnn9R6juE1d
	zpD52TtbpY6NcOF9Hoh8BIWMzobk0Zt+LIKsh7EWw2Er2hDj2g=
X-Received: by 2002:a05:6000:2383:b0:490:f98f:addd with SMTP id ffacd0b85a97d-4a6331c6cdamr2082667f8f.4.1794954004384;
        Tue, 17 Nov 2026 14:20:04 -0800 (PST)
X-Received: by 2002:a05:6000:2383:b0:490:f98f:addd with SMTP id
 ffacd0b85a97d-4a6331c6cdamr2082645f8f.4.1794954004046; Tue, 17 Nov 2026
 14:20:04 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-5-toddfreed@meta.com> <179471269504.2199510.18115986956046547098@kernel.org>
In-Reply-To: <179471269504.2199510.18115986956046547098@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:19:49 -0800
X-Gm-Features: Aa3M54pE3seHebOeBtbI3cDpMgrW25pWhWq5MbBS5In6ZJStfYB2VZ8sEpNY7Bs
Message-ID: <CADh2yMyRSH4ZKZaGxFLVXHTE6v3XF38jh2OykqXRxvP4=0TKgQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 04/15] psp: add support for socket-less psp associations
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfXy8mgtknfkTes
 4KiwQWYzD1Wxhi6pmfbkqrLK/zPPbhGJuvGLwjs3FDr1eezKcHHvyGs1Y8RAAQOgYza/YArO7+A
 DMrJwkuD/vL4finKtt82qVcpLVq0+u6ULbiJvKGpigeIxJ0PpR7xCQ/d9qnY+t0ofEtcKfrCyrf
 WgrtIG5ccK90VEGUA/kSnl/Cjoq43AH7/1dFDqJn9pdUBoKXwhsUTADLQqRH7qKUh9dhCrXYKMT
 nvTQx1N+a++jyDaEl/JyBlgrTkCY6Nus4bp06xmXXNZ6cLxodAmk/fiP7PJ+2tgtmx7sXSq6iWI
 vWfpLTDy++BSGWVAoBsCT6ewR/UttBpaq3AHKtozDgBwoTqtPJHwTAaM7q03AySYq1QdKIGc+tr
 2qt2AynYyAGWMBqs0joFQyGC0pnPGRAyKPlHHgSqVCAc3xZv50mgLUSN6eZ/Pzse7PWL17KL0y3
 YQjMXZ+hgt8vX96R8Lw==
X-Authority-Analysis: v=2.4 cv=UMdIjyfy c=1 sm=1 tr=0 ts=6afcd315 cx=c_pps
 a=C8Sa+zVB7PeSwznsLr31Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=U_y8lYiYyhHBU5rMqhb2:22
 a=6yLQ_yHwUL-M3baYCL4A:9 a=QEXdDO2ut3YA:10 a=eYhU8IiCvE_ms1W8Tcak:22
X-Proofpoint-ORIG-GUID: Dg3UPdb_oIaRbbn3k2CS1Pg-yWJ47Fqc
X-Proofpoint-GUID: Dg3UPdb_oIaRbbn3k2CS1Pg-yWJ47Fqc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4OCBTYWx0ZWRfX5RtJB4tJ/rHu
 ZGCAPW2wKJ9FLFxJkNgYi2GpgZo/ZHzLblfOv0MHgspaecvW2JMJg0oMyfEcmZNud/RniHSjvQ2
 F+N6/YN5gLucN9d0I7FFTV640jqhpkU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> > key material enters through netlink and is never reported back. no key
> > is stored for rx associations, and users reference associations by id
> > and never handle keys
>
> [Severity: Medium]
> Is this paragraph accurate? The code in this patch seems to do the
> opposite in two places.
>
> ...
>
> So user space does handle keys, and rx-spi-alloc does report key
> material back.
>
> Could the commit message describe that more precisely? For example:
> "the Rx key is returned once, by rx-spi-alloc, and is never stored or
> reported by assoc-get".

Yes. In v2 it will say the Rx key is returned from rx-spi-alloc, but not
stored. In v2 rx-spi-alloc won't create an association at all.

-Todd
