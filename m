Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007288;
	b=lYu9KrusYeHU4tMMC06ukmhb7h4USma3v6antRiZBM52qhTLsDECWfztRi9EGa0dM84E
	 p9cbhlZX2ayYk2I6RPx8IWeGW4vjPcITi6OCfosfFvo+4cEbPiMJaAQVPGRwk2XucNVLD
	 EqN16FDD28d8hcwddwe+BzQEaVXJPxjePpRTiq/4/Hl6oS08d+JVzefnAQ892BrLMPsdm
	 4rbLiTDXOV0P1MGJr7qXSEOkah/aF9vUIbzOvB3oGnEVXHMyGgWILTz1BUIys2tHY1V5R
	 xgaw3yxKsR8wp3Ul1muUbJMRI5dSXETBiaW3ptSZ9pYkkILCvEO2nxAgloKAQ2CvTxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=6o67OfCVYqnD9Aa/H+dPLifbYZ1Gh4vu+t7X7MyAhu8=;
	b=UMavy+ewr2E5/YJIP3zvJ796jwaSLL+mOiUo3Q8Y2UZVY1LFHiaLGkPjPSZnnLraeELg
	 951QKTWVk/CPzNRDS9ZNHUtUDWaipzbQlcyNW4ib1ftEogC6M0H0E7C2+jBSwOIIXNO0w
	 kZu7YnPU4GOFvkVGvDYbYHIuxz9sWCwZW4+KW2kgM7dLyuH3dVXra53+q85nuiX+f+Rwz
	 iy4vUiL0j2kYdeVSry4y6usePvWmAk6Ax+JAZGW9skf8md1RNTzoakH93f4ZvKgL3x2jn
	 BIHJ4TsDqfaPBIj+La89Sgp9dcStouWQvQLBzJbTwQDyGCiFaUrZ/Nas/fxiDBZRa2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WAjZdfJE;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCC3606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 13:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBCC3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WAjZdfJE
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso543489a12.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 05:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795007287; x=1795612087; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6o67OfCVYqnD9Aa/H+dPLifbYZ1Gh4vu+t7X7MyAhu8=;
        b=WAjZdfJErso4Tkc/xBb+LOXAJiG+1efc9d1M+AIJVUxfKezRIfIm0Bl7DOJ2QrDJUA
         vcbp5CgEdYK7bo1Ucxff7Upm16WViMwxIySgHwpEh63Dmuy9Sku/KWND9VIyXi/z0rmC
         XKG0g0EopjrV8c+jlA/zVt/GUu2+RFMuTPuNzz4gJwuZxj5Gs3gvYsHWRIHWs24K6cP+
         PGTn47UGfbua0LlCAQsAm/w4d5blbIr+Z/+Dr29yFT03DlCASz3L4wJaUKAHFsYlDzxL
         wYGjHRKliMXDz4BWxYJw753MVCNeDlZ9tBf6phj4Q03Ujtmz6Sejx0MKEXii/VU6d2ua
         KeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007287; x=1795612087;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6o67OfCVYqnD9Aa/H+dPLifbYZ1Gh4vu+t7X7MyAhu8=;
        b=sVhb6/3O6jkY3vXX2KVElkIVEvprMSZwWPsZlblws/Kp8yvtSi13AVEaL27PJaGNm8
         iCH8vIVRLmQyqrbDbVcnsjQshc80MIsQUlMxJjjooMsc0tdJwqiIGAS12Azo+yiUAXBO
         PM+noNoQj2Y4Q94oo3hNUPO7jOa2KNK4pxIhRHyXNzTuwbpBRl5ETU2GZZqcaYHqTNkJ
         EzS6f+h6RRL/Go/Qfy8+1DkZpfTiwYpZL34+ihd2XIy/R8nXH4Jpv2J0t8sSbvlIw5WW
         wN9SziNhG/kiK9/JJqnSQoe9v77JGykSkRlpgLNrLL8LAwq3iAuedqv1tIgSmW2JrWqD
         JGXw==
X-Forwarded-Encrypted: i=1; AL+hErFACV6xMW0ZuRlIJ5GhxudDLUT78EGvSYFc/q7WRzOmIwcFg6KnnRCh5h+02ONm7Pvk5m4vvrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uMoWsX4ERNmW4YtTTkJnkD4LuzFLLrwzZDc1r7tqfX+Sfukzn
	/sdKCH91hkftD2w8LFoHIQBWlB1PDnsRoaQW/pIfUP7PBy2zmT6RggXP
X-Gm-Gg: AZFdTZeDWkukKsQF/6tDLELjeXJP8Cj3jGmmYXnKBBhZ9MuI+zcT+Dz2hjCMRz/1fEf
	pyyQQn/sWq70rgZ561D8fPVWE6cP52SrcGno98fYcrWA96BniteSdS6v9PnA52RqsDSBHUgXS/I
	+J+saigEMosyWuSj82XAHOYyMnfToXg0eVWSVjfW8J7n03G+vb8ift6kiniq65IPahz3E4Lrcv0
	jtQPVdu5gR6KmZOgbIPeKeSqLOdUk7sH7+hcswREsxueWi/8xWvRao4VzfJmRB2oqxin1d/E9pC
	yG2jVBOfw5GXFrTHi8uxgcrE/bWTCAei9WOFn0/R1b5xJMwknG/ZR2D5ILhjAMSJRztu99JGpwN
	n33wxpl84zORuMnqgFiFDVABy/QQ8bVKzDV5ZY+d80ta/Sdnv1rzJM2bfSPdyLtlQCzq1Zqtklj
	Y1p71+1HMGqB0aObApXfzn2gjEsk0FYAjtkXmbuxNYIf0jr41qXxj5TNwmPRKpxRueLcetnj7kG
	KCXm2VGVIn5VlZUcThsKgEHvFPLaQ0Mn4cqOjAlS9HAHHrqktg0Lbj+27LKxQtXrmi0ETHb
X-Received: by 2002:a17:90b:39cc:b0:3b0:dbc5:c56b with SMTP id 98e67ed59e1d1-3b3d0687a87mr2599698a91.6.1795007287083;
        Wed, 18 Nov 2026 05:08:07 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abb786ecsm9406402a91.2.2026.11.18.05.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:08:06 -0800 (PST)
Date: Wed, 18 Nov 2026 05:08:06 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>, Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Cambda Zhu <cambda@linux.alibaba.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] tcp: shift-out-of-bounds in inet_csk_rto_backoff() for an
 orphaned zero-window probe
In-Reply-To:
 <CAL4WiiouZZ46QRp5K6MYK=vevKXYLzd_p049qVVf=w+9L8d96Q@mail.gmail.com>
References: <179499954853.1440581.6627074959099619480@gmail.com>
 <CAL4WiiouZZ46QRp5K6MYK=vevKXYLzd_p049qVVf=w+9L8d96Q@mail.gmail.com>
Message-ID: <179500717712.1760730.9301783213882815335@gmail.com>
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

On Wed, Nov 18, 2026 at 01:12:45PM +0100, Eric Dumazet wrote:
> Searching lore for the function name would have found it:
>
> https://lore.kernel.org/netdev/?q=inet_csk_rto_backoff
>
> Please do this before sending a report, especially for findings
> coming from automated tools.

You are right, sorry for the noise. We now search lore for the
functions involved before sending a report.

> Kyuwon, it would be nice if you could test Jiayuan's patch with your
> reproducer and send a Tested-by: tag in that thread.

Sure. I'll run it against Jiayuan's v3 once it is posted and send the
Tested-by in that thread.

Thanks,
Kyuwon Cho
