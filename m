Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014380;
	b=UpU6eXiFBj8e1TKtkyYOOxUMMa+VsjFR6nxLZhl2RENNIxEVanudaCtLTBd/njPi3Ynj
	 S30uavvSaGK2MFI4MlUYPJLBrDp+jU+PTS3HauH6xS3CTungPhiXkKy9S4oFa+HeZCNGb
	 weUMmMJOqRpS1lucFMkU+vQmzs/hLKNQH0TkmPGhBI7TCKCVTsCkIDz0dY7FaZQi7sMCi
	 iswju11/MprFTtklflWgP48yT5vgeLUgTuFq37KfneT/FsHSOXGLjJLd8b3JCWkkQ+38W
	 hynw+/Bby48pGWWslExtcg7D1qp9VP+zjmF3mb2Xno//Codxe2r09/wkKzLZvMBbkSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=tKPUcQCwUJ0o16oWcFk1SSJYCflKgF3hlVLSRCArcVc=;
	b=scBFXIrjgF2CGqPekfUiyWYNHcfz6AUGd9QlwXR9UyquILTgVgbqyKpPLZl5gfVl5zNM
	 zbr2yUQ0ZEPd29Yg+R9iM0J23e1D9bguZ3Hfbwhk0buOqLM2sIFUv+y5liP5dPQjQlS1Z
	 TquGe0BzzOcnI+7Rla0mOI5KOC/1ebzr5/msju85KTnNoLlvhoJBPrR3Duv96ERMp2PwF
	 ZOv3mvgXxCvha4wMrDulz1bJcVG9aSy3rtf02TsuhOzs9rWrwvPykvoM7+xNUicJrYyhK
	 blCOkaiu3fpogno0Kr5BjiCnOhphMFNOIEpTHK5q2ChbTIxPJ3qyVMV/8RnCCYZHTIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oazsg+Kk;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A66606A33A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A66606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oazsg+Kk
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-381f65e4e4bso1797992eec.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 07:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795014379; x=1795619179; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tKPUcQCwUJ0o16oWcFk1SSJYCflKgF3hlVLSRCArcVc=;
        b=oazsg+Kk9ACdNFN3l7hy2qrJxFy5DmqqWudZXT2Ok3anHQMm83IXM/en8tYt/ko5DI
         YIJsIWv4Qxmtotwhu8i8Zaqg6jleeUeXuNwDX5NleJJKFaFf4I+kkAdN9/19ZQqwf7Wh
         5mA8AI6yT3WG5bCugUx8bwYrQVOvYWZ000hGFMXwJr9kLJ//tp3XsKDgtQkLJEEFkhRa
         g6KbCBxFVIgixRK2xvZWa+dQPi5dSlPOnSkO6Ro3WOnKtdngBVvK/fiRZtkI6ICpESWM
         bhXYH0UbMWTWdpKmwSE78M4yJ8yWSsJk3rZZrzekB0zlTVPfHMcPR2duimRPtlIIochU
         mIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014379; x=1795619179;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKPUcQCwUJ0o16oWcFk1SSJYCflKgF3hlVLSRCArcVc=;
        b=bazK+sy4i0nwsiFyHYRorLS6C+MSIa2KMaecRdlpExiN9I5wYkie9vxM1/rFFDopSN
         iV/vRYwfgeUuuZY47sm+VtZInFBiu66l+FKO8T8oR6yRFwz/TTBZlf8FITGXGALlPEwy
         mCSvLJb8h5wOnd5JmyWM+36MqUUhxEzUM/dZEjz5O3DXGDzmpSR9laKYkhvtAYOGNA4p
         2RU74hMVTjOzuuDghI8CdhPQyFO7IatR976fk1Mttdn+hOgVqrRlH4yVLwwRMyxDH9tH
         D/WOxWkQQXe8tHTAvu+vdVgjDfH1zQVYHUmH9pNwhzWA78ueyPLIG2EBMM1Lf1nmNF5D
         W8tg==
X-Gm-Message-State: APuU4Z+X9BvRsefqdfOOC4iweDr2gAwQdwFSgoSwDoYgiV1nVejeib3u
	6mwSSmsB1ic+V77lkNQo6zFlDf4bQIzfCVSdFVmueEUB9+JwnS8Yy8yy
X-Gm-Gg: AZFdTZcrnOEEWxBaGzeBYGny4ERmvETvRZhJ1pD566XJrSQ7TogNpCnYXYUHddgMdhS
	8bW5xz1JkuYGHiHBl+QCC8Pajlpa/QrVE3DJeiMQtaZPmO528wExFK1JujjMyDWdivnmogUTady
	gidAJcKi3aPwu7R0jpKFi83t1U+btfXlZQBU98uuuv3D24mhIZjzQn8oyZNo9JwtU5PqABxAjWX
	kY8yyfhUCjmXsFAU6YlCWGd3Kyo1CsVaIzbmhhHOj0u/R0mZTfFj4Cr5Q3Ca3cFTS0RTQcgYTdY
	j1B4xsE29BEAG6avld4AMF8YWAa/fXsi0GvrgIy80wkiitY/1yLmerHopdYeFkOKZTsWdxdjzi7
	HEiJq4YeKFnnX6p7H4J5N3hegWyslH/lVaazc5sVNOU3oN81uaxnQbcFf9//rMFqrLIPo/EVoXY
	PWV2GFKGWkLWU6S702CKzGwD77Rv0e+m4eOqB+KJRlPwLWVvTdYejGqiqJBge6EalG5Vo3pMDK7
	ZRnz3zcnRD4hihGEvSXM9Ykp1zOaqjCN+Yudtktt+KpM0KfIrHuO6grQH1ds35Qdtt55fQ=
X-Received: by 2002:a05:7300:cca9:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-3827dd05a5amr2957513eec.1.1795014379070;
        Wed, 18 Nov 2026 07:06:19 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6df02adsm9897638eec.14.2026.11.18.07.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:06:18 -0800 (PST)
Date: Wed, 18 Nov 2026 07:06:18 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>,
 stable@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net v3 2/2] tcp: fix shift-out-of-bounds in inet_csk_rto_backoff()
In-Reply-To: <20261118144249.358481-2-jiayuan.chen@linux.dev>
References: <20261118144249.358481-1-jiayuan.chen@linux.dev>
 <20261118144249.358481-2-jiayuan.chen@linux.dev>
Message-ID: <179501434217.2486727.13336571553047162527@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Nov 18, 2026 at 10:42:38PM +0800, Jiayuan Chen wrote:
> icsk_backoff is used as a shift amount in inet_csk_rto_backoff():
>
> 	u64 when = (u64)icsk->icsk_rto << icsk->icsk_backoff;
>
> It can go past 63 on the paths of both callers:

I tested the zero window probe path with the reproducer from my report,
an orphaned socket that keeps probing a zero window. Without the series,
v7.4-rc3 shows the UBSAN report, but with both v3 patches applied, it is
gone.

Tested-by: Kyuwon Cho <kyuwoncho18@gmail.com>

Thanks,
Kyuwon Cho
