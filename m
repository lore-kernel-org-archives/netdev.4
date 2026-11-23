Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795471295;
	b=Q9Iahvqghd4HwIcTQctKAombT0qsRavw8P1jeqZpVFiOsMyXtGPrcm6RW3GQ0dtW/oBu
	 lH3aVdHZj2ob49LQln1c8HKUHG2L2XGN5iWwtjI3vwlh2+IXRWFZICe67mhyQe5mKBywW
	 xXQnN7cVrSKI+Z2Sj0+JLPmzbOXDpij/8Z+bPFjSoLdFEadsi6XmJnTccF/0HbksI9cMb
	 WzlGigUn7wTRF7+vJT4a3tHTri2gKuwbVPjwySIOv98Lc+fm2Rdmam6dwiZIJYYLjY+co
	 EMVz1sh7X0ZrAIIw9SndJOKtzoktSox+yx/ieX4STglg0UTSqXY9g7qILNoImmLs72A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471295;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=HXlZPN3cIE8dHERwMlz7eNxXWyTGYF+BUQZX4Ynl+DQ=;
	b=gBY/w3kcTcecyIUIgu18emlO7jfLr0zubGLPovJ0KLokX1RtTkI0Wt9oTEA1BJ91KpJD
	 ThVzTwg19kAqHSvZAkt8VQONc2xWlm6FAlzr1qeN7knWKm1unuk7Q233esCqUsC6TYU9b
	 gteGhmCDcXVGdpxsPZqW/wdFnRuH7WR7nlBKWkogls5QmNGtv/c6N7W0seANDwW4u03sE
	 zxDd1/uwjb9zlSoXBmWjHs8bgnGssNsINzlMIWRBJSqUkUvRkshSC9Dcy1QzmAZWJUGrU
	 1GLDSWGruZ4dA+dJoKd+BH4/zn1X2Kwb5FfTYwif4/i08PV7kHnAMI5rUseINREeDcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=MsrTYuOJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9730D606A33A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9730D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=MsrTYuOJ
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJw8mE3259656
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:01:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=HXlZPN3cIE8
	dHERwMlz7eNxXWyTGYF+BUQZX4Ynl+DQ=; b=MsrTYuOJYQ2wytJCLzkEX65+iJt
	K6N23+oL6xEcDGJ6PnEdfU42/bHNwn1aZcR/d2lCBKBQ7Hjj5EWmqpCETDR9eQ1F
	hl3GntDVNxWEv7byptEAlCVTSzTGeKygL2vYEP366PP43s7n8Fa39izCDAto3Fdf
	iPIIXEISjxVunEbIg8Yn/yVRpvBRcQc+0u4ptdDH2EwkDaF/8mwK246FEvT6hxTu
	d7eYm0b6mO1LTl1Np0uBWTtI0HM68lYEvSlPCZsdeFOTuP8hsDqM+/qjp0qtqRo8
	DhjuNo74AJTvHSy2mYz/hx7xhE6DfnRTv2ksulgkxzIKCUsoYPC/EzZGhew==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j406y10mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:01:33 -0800 (PST)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b4232374d6so5114478a91.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:01:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795471293; cv=none;
        d=google.com; s=arc-20260327;
        b=ptQs7icVG0F7jjZq0CsaYQs+ijhJtOu+6+JvHhNrsreucxUjFA3So8eItYvvHkmcs9
         +B1wGsyXtxKLgQvHThzpB4rIcVnla0Xx2sIvaHSh9mc9QF6HiyvwKWD0+93jVIKsM77Z
         NoHyr9PAaDmvTLp4OFzyiFaqQJ3Kmjbbi2nHlEks5jq5see81Cgl5dpehy06toGMW9UD
         64rMc+tz9StTR/fPRy2h4KhxZpw+4ahqccUwvlC5pRI00kJobenPIhbFcwrqNYzahB6B
         EoC07ihe1I2on0eQa0d+hbO9rjbxAZKRuHG4y52gg805aEd/pxu05mCRFZlS0h141cJX
         ry2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=HXlZPN3cIE8dHERwMlz7eNxXWyTGYF+BUQZX4Ynl+DQ=;
        fh=VvL5dL+mgEvjkUmom1tJuMINqMVCIECPyPse3ZLuWR8=;
        b=biVZAITk885iPwweF4F99bInQhGjHdHVO9tJGPCeO2CirTjvr9hbZOTCuhk2WS7KlW
         al5V3tHnoKFX1fdp2+u4Oc/uSFdL4ngtK+w83Vwwm+zAS23DFnIODkLi7+oATHzWYHTP
         /Yzd6OU0/BfRIOTvraGyLngkVztdEys+pthY4I6GPVI9C53WaKOTN410V/a4ZGKOCFbS
         G/wSzI93BIO0zNNKGjVgA93Jx1w3vWFB6p4T0ZXoviGE8NiYWZm7clT3mi4gNeDhA0vS
         ZQWwKGtHKh1OW+MmTHWNNDpkfNJfsurtAXiXgyQ4rB1UvYIB7qOBKiZ21z2GjLvjwwlg
         pN6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471293; x=1796076093;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HXlZPN3cIE8dHERwMlz7eNxXWyTGYF+BUQZX4Ynl+DQ=;
        b=CXK0kmFrsC7m3FmOV5zSAxFuQDmseKQGifDeAFzyXExkzozrzqq12eqYrda8bJ9tc8
         5kfZdt0UjxXV7dodL2vixDeh03LNoIed5+qGjpExpVYr+BR7F8EhzTGzzjbsf3bjiqGw
         6JXF3Vnug+XBO5yWK0xJEd5uA26LYCmsCrpO60khVaPlQHDT08vsS8r/DJ8cNdK5WahY
         OXzbf95NIwo82MlF0LwaqUupHq7opk1qdb4fECSsAgpFr89W4pteZE3bc+RET0TUqQY4
         eM4Qyxsnh2uZpu3M7BMicnnPVNhK4sjQjIMyNo7GpXZXLK9SjNngLPe8wivb5/bMvclU
         Ho9g==
X-Gm-Message-State: APuU4Z+MGJc2ogWfPbhiMEc+ievuq50RiTxEnH2KdDjdL9VtBNY4Dxkn
	irPzqyWtuUHrQIWJICVNJaVxuFKMS5FuwBT9qMHE20XP4iCcJGMrmPas4jP9/Mj+GAgBV10278D
	KDCQmzDmCFNWFFcpUnaNQ3MM0jHK6Ex+xwe+GmtKK0xWtEnffcXqclSgCjcHjd1RWvM1wAloY5z
	UA4jMzeNwlxGcHkTKitAERUtxuDGuOotU=
X-Gm-Gg: AZFdTZcYVaQ8dPuEzSI65ibSzpqJsqd0Mfv2cdEdHAeSOYxjQOEKV7mHpMElKAi3s0z
	5BB2l5329Q6V/mkgbPkqoRUZSE96jp6l5o84HOnilal6owMv3qRmayYNQX3B9BTb6WqvgwxXtHV
	H0fdCADDBjy2DXJa6xVDNOYCpQ3K7aXtSEqyQkcvWGfjxHKVrxTLkyp60qJkWE/a7DrzyTxI2Cj
	X6geFY/qm5/FvmiN+E3oZwipPxWTPAe2f1PHe7Z4b2FiIqWtKI=
X-Received: by 2002:a17:90a:e705:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3b41c7e11bemr11000772a91.8.1795471292991;
        Mon, 23 Nov 2026 14:01:32 -0800 (PST)
X-Received: by 2002:a17:90a:e705:b0:3a5:147a:3b63 with SMTP id
 98e67ed59e1d1-3b41c7e11bemr11000723a91.8.1795471292482; Mon, 23 Nov 2026
 14:01:32 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117203137.804424-5-toddfreed@meta.com> <179529586053.3135.7106623626318776669@kernel.org>
In-Reply-To: <179529586053.3135.7106623626318776669@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 23 Nov 2026 14:01:19 -0800
X-Gm-Features: Aa3M54qKoeHizOx32dSF-QEKNJXmc6qKuSfI7qtOC8d-AkJeAsj6kZH5_ClB_hE
Message-ID: <CADh2yMxeyoDYgcp6WpF6F4hcLGvt+DxKTWLQQi7HrUo8fit8vg@mail.gmail.com>
Subject: Re: [PATCH net v6 4/8] ipv4: icmp: don't quote decrypted payload in
 icmp errors
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, borisp@nvidia.com, cratiu@nvidia.com,
        daniel.zahka@gmail.com, dsahern@kernel.org, dtatulea@nvidia.com,
        edumazet@kernel.org, idosch@nvidia.com, kuba@kernel.org,
        john.fastabend@gmail.com, leon@kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, mbloch@nvidia.com, pabeni@redhat.com,
        raeds@nvidia.com, rrameshbabu@nvidia.com, sd@queasysnail.net,
        saeedm@nvidia.com, shuah@kernel.org, horms@kernel.org,
        tariqt@nvidia.com, weiwan@google.com, willemdebruijn.kernel@gmail.com,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX31abFnNHE1e3
 Nir/Egxbf5j1LdadOPL9D54F6d6A6U14vIIjVsYtSt9MTIHYYlFiJiSiXRJttVaGuCSJyTB0n2j
 yCTAGuJhHY7epOkR3y7V0mLl8FPGqMY=
X-Proofpoint-ORIG-GUID: x6VE553nHT8cStQTaZTx-ULdTMrKWkAm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NyBTYWx0ZWRfX1YqkAtmpkYEX
 Jw7HOj7a/OHw+yTI1kZrC03uetwLL4Hrcr3ewY2+TTuKkn+cEBI40MszSmIaYe07XunOyIWVWRM
 nBaRWwuwZ9MQ9loz62uXW0Zp56/mc4FbN+twYs7YH1lJhvH7UmKK3Vii4Fh0oulM2YkiL9eoKMo
 zSO3xeXwT4LFEngz6JcZz8G2XRxsR1rcmB5jZ5k6J/UnmkLJ/A/P3eYcMND4x9yjLr+6dmU+PeX
 RuPdwxJDhcAJjwnTbIX25uHLm/9Y1tQWHrJJHzWlVXYqCrT039KykGgESazQnTRBt09fN5D68tm
 g99aWYX6t86h1vMow49+OjK6LZ6b34YSV8f4Lb09Z6rH5vUCkzKsDqMePljug1Wg1iOtdNHW/xU
 R3BURGJjgSeqFcg+w6Ga5b9n/G3L4OFlHeiWo/MgJlwmAWfIuWXEn4iuGi9aF4n++zBSDGXeOHd
 pmdN/igNpqsZiMWurjQ==
X-Authority-Analysis: v=2.4 cv=LOnz05W9 c=1 sm=1 tr=0 ts=6b04b7bd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=4h92JMTCafKA-fb_NiOh:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=vS69VSOLqzyyCQB8HVkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: x6VE553nHT8cStQTaZTx-ULdTMrKWkAm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01

> [Severity: Medium]
> This check only covers ICMP errors sent through icmp_send(). Can a
> decrypted payload still be quoted in cleartext by the other IPv4
> unreachable builder?
>
> The commit message says:
>
>     nft reject in the netdev and bridge families builds its own
>     error (nf_reject_skb_v4_unreach()); a separate nf-next patch applies the
>     same rule there.
>
> This patch carries Fixes: 784abe24c903 and Cc: stable. A stable backport
> would then make an inet family reject of a decrypted packet send nothing.
> A netdev or bridge family reject of the same packet would still send
> plaintext.
>
> Should the netfilter builders be fixed in this same series, or through
> nf/net with the same Fixes: and Cc: stable tags, rather than nf-next?

The nf-next series in question,

https://lore.kernel.org/netfilter-devel/20261111003111.3826942-1-toddfreed@meta.com

 1/2 netfilter: bridge: don't refragment decrypted skbs" (dd5e0f8aebca)
 2/2 netfilter: reject: don't reply to decrypted skbs" (01538dbd6b9b)

patch 2/2 reproduces on net/main. I believe the precedent then would be
to send it to nf (not nf-next).

patch 1/2 does not reproduce on net/main. And it no longer reproduces with
the net-next series, "psp: introduce socket-less psp associations". I will drop
that one.

-Todd
