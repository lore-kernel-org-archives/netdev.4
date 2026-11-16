Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794869071;
	b=TokI0V4bFhZLNFosAVhqm46gu0t2ACAaE3r/a0oq3W3YPi+7OscdBsrFlT4seGqEX5Cl
	 aFSwIYhHUaT+0YGR2G1qM2/X9hmPX7ceBpHpm0efg1SNzRmtGmx2qdCDV5iv53Gmyy/Z9
	 Ou+AFlx6qQYPywbGWEWbpTbb2gFNFi7b9D17v9UcTzOlxgtzaRrtGyDCccCsogiZqGPzc
	 47FDKYMBChGlR53oomZELEi1XUMsrPCkiHnMyZlKhTi+TyBUjgN0vdi0Ei09Ja+ec0oEy
	 8bP6+leO7+1aW4DfFvmR5hs48cREILmz9r4IZfQ+MW2XdENJ/l47v6mrKwp1/1sZtBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=INFJK33SIHc1il9VMaSNYPCBsxVfdMkBi2pHTF9t3Rw=;
	b=HhiwfOqN0jsGmCSar7znaF5i2GrXJiGlYJytj3MbXTLnYbCnj1VrHsOdJc9I6LxQ4Bvi
	 G7JRN3w42lMo0mg3tJxx4+d1A6q3HJt2PQPTUXQiiKyaRLS6NumiHH9O/jGOxKo07Vx4e
	 3fMj1IVB4fwO+IeeADo4pS0DSaBakW+h8I9N20AXFY5EZVrOkhFIYsswwqD85joF0TUP2
	 TNko2zAnd6LDrHYpLEtr2vWQPdNrhC9fJ3Syr4CoBbsXqdKUdAErUUmotl2l9hh1Z+Hqs
	 TDhr/aOAxdZK9zGStwlAdqtoQ5/U5JXI6mTY3fe4HWLUVAk2c+HBS5rNoGurhlb6EYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=ZJmfX2kj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07886606A32A
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 22:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07886606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=ZJmfX2kj
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGM28UV2377350
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:44:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=INFJK33SIHc
	1il9VMaSNYPCBsxVfdMkBi2pHTF9t3Rw=; b=ZJmfX2kjDA9mCjYcEWXG21PTCxY
	8pWD9UYuB9/bEG5X/xJVrB7ctZo2WbDuUjwXqZN3+bkGuZDmJv8214nAWTMtQ+dF
	EoI5wPI5PMoO98C8N04f++csqKd3F+A8ZyXCtsrvB9CX4ebP1BEIKISJ7grh/bAF
	evs5i5HpMFVgZ3xEOielhYwTCuuuvPuWvAnkRjfbFotfYsFR51PuABFfXlJNmB88
	gygC/1iFR5c5vLvxmk7JV8xiL51kXKt6U0eR2g1wtGkSGGqkxbI0OfXNP6SbH5En
	/iokbf7NAOZVM08CXbqZdAER5ibv5CdFVRdGagVtkULlPJVLeQH8rBW3ApA==
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hya3p9wv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:44:29 -0800 (PST)
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb69d84053so13428895e9.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:44:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794869068; cv=none;
        d=google.com; s=arc-20260327;
        b=suSVxKk/FK+Fyr79AM/GP1oJolmN3GEbRc8eL+dfWnhblKoP/ZN+kjbHMbMD4GMbK1
         Btumh11xPoqs0dKqw+41a8o82T+Guy036dqlmq4Wg5BygfbP/ZVGA4/Jkc5Vflm5YCki
         W3VKYytoyRh9bl/+smQtmdhrVEgkmAdzkYn0NCLjcFFRPwqN/RJj1NxspTDP/vhcJ9eB
         8EzbM2sn2W51lKV1AsJ35J8lPOKFpC7HOY+YNp6FkV9JEiewlWqpFsFSERmGjZg2uIwA
         UxrIIl6BVa8ff4QLt1PTdUwrqeD+WGpKPWxLyM5s/EHzpyhvenIf0N43PPppvtw7leDh
         +TCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=INFJK33SIHc1il9VMaSNYPCBsxVfdMkBi2pHTF9t3Rw=;
        fh=ZbY/0KMd5vYH4EXBSveiJ9zQvran02ZjpDk4nJwWWfw=;
        b=hpOxQ9Qhq2KDSZbanbXio3w4bj6aPLeV2eZKsi7aPsptKAyUxTggnxe6I3EJ5XKZLN
         N0kRnqMPpPiWDvQyLDvqE6vI2SybS9sF7Eh40I4pyrd/Y70UCP5KQnA1eQt882fJ9OEX
         K9XiNa/QDTp+fjihdFRieHmUFB6CHvK/8FKXiHirTTbsP+KA2XB/cLzia3x3Pm8pE6Gp
         L6aUTBqrpJeK4ooIIIt3aOtpV7yRPma6t6BsAfsWFDVw/CT9MA3mVD8quzIqj2syPBtu
         1qkdz5ZX3r8pFg4VQ1iH7bfR9M3BpA6nblBV5NU3oGt8U/YhX+xmUlPNEzfcIs1Evl8J
         Y+Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869068; x=1795473868;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=INFJK33SIHc1il9VMaSNYPCBsxVfdMkBi2pHTF9t3Rw=;
        b=yjJ7n1v/VclQk1RCLzoadyP+uR1dO8lgNx81ET4U//mB31LzDZhr6Gs2MUdjsnkpSJ
         3c8keY9C74twOtdxoLRYmousGf4QsAMqv/o7JaGMSc8nGbGA+rR53Xe2/ry+hP+Kz3N/
         bNABYCFfBd/M8uEOW35c2NDDkHipmcYRweC2wmERDuOXTrnk0ugzuMZyvGCcvA2TzguE
         VsgdEr5vBZpAzXL9oipuSsHhtpE13coUA0GaRnzzA29KDQ0w1dxm8oUyaDQvyA/bRt7u
         ++QnSemhBzLvIoq7BdyVhF+WUiy9VeaA9qjnHpGF6V5+LaVxPZzqtJHTvKfyLiLUJA8w
         PyBw==
X-Gm-Message-State: APuU4Z9b1JIja/F2IIVJX+qLYAMVyWmhv2uEblGKyVqREaQQt30BWkUx
	o6vWYVEDbZ7xsJ25aKWZnx9QBMr2Fudb8hALivu9tX/DG+8+d3JauXICcOi1syqrwLKAP6QRETE
	FTxgpjqdsd9ee9DVgKky6sfipQzFx4bJd1Ft/SOUswY7Tp9+fNo4XFc7XM1hl0BfBvNB/fpaR3H
	TBXCX8rc38/QgQ5DRyqCu/bTNsqtkMYzQ=
X-Gm-Gg: AYBFou13eXV2NgOUIREIX/w6JaMh4PhB/SwqWYlAvkIS5awc8cadwZFV+KomXYuD3yH
	QZ8ndwep+VwoXTnMBnxZL4eYBaKsoCgDOHF5x5QSFTJ8aZIUurfKMldltUFfZ5kNFGIhz8i797p
	9CLAM2wrK3fTRMheogNCvLNWthRMMXEwfVPGArtGlblKuauZ9isx5tA+erE7nyzfwqIe8lri7Po
	RUFCPpVImnM7l0pDPb3cHNezUlyna/9WN2q1W5pF4flNOJAd84=
X-Received: by 2002:a05:600c:698d:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb5de1f262mr192032175e9.26.1794869068624;
        Mon, 16 Nov 2026 14:44:28 -0800 (PST)
X-Received: by 2002:a05:600c:698d:b0:4bb:5de1:e92c with SMTP id
 5b1f17b1804b1-4bb5de1f262mr192031935e9.26.1794869068266; Mon, 16 Nov 2026
 14:44:28 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111001831.3710881-1-toddfreed@meta.com> <DMWNI97J4UZH.QK9260QE63ZJ@gmail.com>
In-Reply-To: <DMWNI97J4UZH.QK9260QE63ZJ@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 16 Nov 2026 14:44:16 -0800
X-Gm-Features: Aa3M54rDJg770IRtFuGEuQTK9_ahFKlOSCDnmFon8USiCtNTDEcNPoAY-z-nWxY
Message-ID: <CADh2yMyLkoDMQL4pQphobvbBcjtojArW8URXz-7qtr68UvjQ+w@mail.gmail.com>
Subject: Re: [PATCH net v5 0/8] psp, tls: don't send offloaded contents in cleartext
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Boris Pismenny <borisp@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
        David Ahern <dsahern@kernel.org>, Dragos Tatulea <dtatulea@nvidia.com>,
        Eric Dumazet <edumazet@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
        Jakub Kicinski <kuba@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org,
        Mark Bloch <mbloch@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
        Raed Salem <raeds@nvidia.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Sabrina Dubroca <sd@queasysnail.net>,
        Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfX4ScKi2gaQ9qQ
 erh2sC1PL0dNEvKIiOB2Jw7uxHBdkjZKakSaRhGXFU2K0dILzlh0jg7hlcANSU6zrQZ0stvagDz
 W1rMovXc0PhlOkCxKx7nh1oziyxJfr4=
X-Authority-Analysis: v=2.4 cv=YK8KWhGx c=1 sm=1 tr=0 ts=6afb874d cx=c_pps
 a=IwH782EDBk/vqbJ9rM8UFw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=jCddH8ec0KUNCymVuxII:22
 a=eugDcP6XFwV9FTUBbroA:9 a=QEXdDO2ut3YA:10 a=Ng9YvVcppn9CIdWre3nD:22
X-Proofpoint-GUID: pwfMd_GbnTOqKzSI61hwgN671YZ_Cl2H
X-Proofpoint-ORIG-GUID: pwfMd_GbnTOqKzSI61hwgN671YZ_Cl2H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfXzwk1psc+ul1Z
 xtxUZ3mO8S8wOBzuEjQCe3WP7O1oYiIlTNXSQfzpyfyj54zkcfx/vYrIN8Ses9PpFrMTRMjQ576
 154CQaXf6EETGT/e7lTwJXzWFYYgz9ghI2esVaqFPZagvOYqXqWr+VXQXIDulSj1CQIJjVZtDX4
 jW1pz4dxbNsedv2PM0+4jn0fTA6JUsEmPbN0VBZx/Z4dCwTGuyWQgQ2hszZRpaNV8JZL7TAiD7J
 FzQ9EuMOW703QmohbEDva0uH50ZwXid4lF6dKM/HIrUcp1zHBlQfpVBZP6k+82QnRdxUDHiwFvu
 VXhnsYbHy5VQvZbSeTHI1y0HoYjP9MWhAe05ii/JuMMAaSNdrBJmBN6AqbO944P984UnrLfAyR5
 3FRLn1/hg7FBWHIk2jjocIeEnrkuh6OK/Wh39bn8FKRsI3iCN1XGKrz+YhOAMiQYlmz5KR+hbxA
 rh2HhiF6LKIUI4gHKbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01

> > v5:
> >  - ipv6 extension headers: drop them in psp_dev_encapsulate() again,
> >    instead of in mlx5e. it's the helper which can't encapsulate them,
> >    for every driver (netdevsim sent them malformed). unlike the routing
> >    header rejection in v2, this isn't a device limitation
>
> Can you elaborate on this? You're saying encapsulating with the
> extension headers present was working for mlx5, but not netdevsim?

With ipv6 extension headers, both netdevsim and mlx5 send a
malformed packet. mlx5 also sends that packet unencrypted.

In v4, I had moved the drop from the helper into mlx5, because
"sends the packet unencrypted" pertains to that driver specifically.

Sashiko pointed out (High finding) that the "crafts a malformed packet"
behavior is in the shared helper. So I moved the fix back into the
helper for v5.

The routing header limitation I mentioned there (which was limited to the
mlx5 driver) is fixed by patch 8 in v5 ("net/mlx5e: psp: tso: replace only
the length in checksum seed")

-Todd
