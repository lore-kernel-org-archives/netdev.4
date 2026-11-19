Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795129372;
	b=YGPjmrZwZaq2yj4x0bkDG2kiJrG0I09PXIe+ruP2AZHtEBuXcBXlOdwX1tmrDkQD7ZZ1
	 i2C+acsr9XGP72tY+UvY0wFJ5mVhIYiJZqEuuQqzeAycZBApZvft7g39USs8coHe05qDc
	 8IUNBWBWhNsIHmbNILp3tNFemMFDArCbt2VMyLzEHX+LBkmJt0bgg9odZlkKYEjpIXXkZ
	 3uVUsU/OZacVlFYpT6coF8m7Eakq2HyeuXFEz7VQt1vSFh48iA6U6OvS81vv9q9g7VL4L
	 Bk20b6UJteBDc/tBtpl2SSdQfUrYnbFDJu5TRWPPKBPkj0YgKTvTzDvj6farG7uftcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LeDUuB6pp2r0/aUfVH5+Lf5XfVlnFXL55VUhlnL8YWQ=;
	b=XsdcZVqHPfSDWaMOKm6Fbw7szUm0ubnn8VSuPttmlnYulz4IxwaBg0HulN5t6oiUDbhC
	 fJMH7JHX8DqS4LDzrJ4jxXgRbESp44NlyAAIGgQXRJqeGU8G5T4lmRTOw265KQ8qZfH63
	 q25suSI2ouEnFI4hW8Cudwg853EwTrUxMegqRrWxmvFbl40Zo0rviOfiBBDQeHvDoM9ig
	 Wtgzset1hEILJqKL7Qq08iMZjvXklLZcm1KQ4BqBL+S7zl8nOk59H8GYfzXJQ4BE6dw6L
	 7APNm+GvTDv4ErnhfmbfT59FbjNycQzyE0WjNG1O6EE6R9/JLnqnkHQGFZ6vI8GCsmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N9gGK2BN;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE15606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDE15606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N9gGK2BN
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-949680e6d82so39840485a.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 15:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795129371; x=1795734171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LeDUuB6pp2r0/aUfVH5+Lf5XfVlnFXL55VUhlnL8YWQ=;
        b=N9gGK2BN0VRB3qHFXUa+vdJF3hcnov6X3nJx/b3rKZJrwng+pkWmXsK6at1DTTN6Lm
         mF0FVKNn+rOKcZUhm76eaWkWcRS8Y8DsTbrEf8Qh4nYECd976v1b5XJkzwlAcmssqz4j
         V3oYn5n8i6YxegPBfLTie3V2453mLYjEqrxzDt8A3Eidio6IqokkeP47C4nLRm927Nnt
         GQqABGT44M7NVRYmneH17Z1fOkRIDuhvIy9ujK0uQ0jDhfW0bx4jpHztcrB5rD+T9K5n
         vVG+hwBMupRhDi3+hPTU7vo33HD9islOqCNYUOLTr3B2nIVwTwzqGs8sZN7Y9FzYEWB3
         F+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795129371; x=1795734171;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LeDUuB6pp2r0/aUfVH5+Lf5XfVlnFXL55VUhlnL8YWQ=;
        b=1aVpKErVhbPRoEVz3x/VKCUrCnQAON6cUbbtBl69o3ORBzlNz6ln9cFWc3F0Bilbq8
         f1Lgcnkm313B0PDuertMM96NY0bfXSsBPFUjoeyaYQa87Q8dfBY4bVm9Ug+icMaiG95J
         3g6Izj7MRWF8NqYT1EpBVemsbZe9yOY7g7xl/oCcuKm2jzv6YFMDd5/QLJhoXPAHfKzR
         nWYS9j89sO4z4yQjQ7F04sMBli/ZLb4CISeD6IDbNSFaJiVdpdtzl/Wc5ZubyfM5l1oj
         oU8d6ji9qX3V5ufOMb2F3hJhENsZO8QEKeoDa4FLx/Sd6EotY7N02mhDbkNF037Lbktv
         15Fg==
X-Gm-Message-State: APuU4Z8AP+Tab+u+vdp4GOEQmqMOxdX2Zm3R2Tp1p7yXJsvSsIEw6Nui
	x15cv0D+RKjgHrnqMaMc68qR4sK4nw9ioxT9edeywdqIhSw14CbExsLW
X-Gm-Gg: AYBFou02nbMCve/h5bcHXLRoFsBWHyMTzFn5VLD7Uvs0rX/c86MtTC5HQZHCEODh9x3
	e7KP/LkKntXJWTwRBlm9wKG8LDDT6f8JfNwXl+Ew82+VGIi2W/UmVSocNl2hamsLc6MAfIJcPnf
	IQpuPFav8hdra2S0CXvMAnVQ1Gs/iBBEAPv9mGnchcjpFBhmtHOlhqa3wg4Bm8FDLI6a3n3bkma
	qJVUx2QL9S4a7Ild0mvnev682jYNXRExOtyPK8aAf4ADK0oapadG2YtHNyjpczlGbsyYtf0jcVf
	MewEwOdnIQOKZerEdtR3Qse2S6vfLBrOKyHRppzbU5IffvAvCIfhiuqY12Le1XhlOve1r8vM9eU
	Zj3OCIbaE2ven2QDYffHLnf8moazvYtQTnywk6MA+PB330Xs6RIIQBo+8n392nFChPMGEdRYMLI
	awh+2xRpCDwcNpwVEX5NbghsQPotRUUwHSQ82/BNQp3iNp0DBelTksy1irvAM3oHCiFauLDJVP5
	4c4oRkwH7WAzRd8JixTICY+MWI3oGMSSA1EuccTjZjeSHPvN2XXSu47Ki+URv0Y1EvKuTo6yIpa
	gBrKOmW/Tu1C1CtSpVIOm4G5MOuoziGwWRqkoTR31buDXLvHKA1qu5ml0Fo6nULS4/2ghp9gOMq
	eemzNaSvGONIjfPGE48Nz6QG27p6xuwqfWQF5CEncXdqHhV5UqCjmx5LNSMQeFv0=
X-Received: by 2002:a05:620a:1a0e:b0:93e:618e:a2d0 with SMTP id af79cd13be357-949ba9fdf21mr206335185a.60.1795129370563;
        Thu, 19 Nov 2026 15:02:50 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb40ea12sm64050085a.35.2026.11.19.15.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:02:50 -0800 (PST)
Date: Thu, 19 Nov 2026 18:02:49 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net
Cc: netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 michael.chan@broadcom.com, 
 manishc@marvell.com, 
 joshwash@google.com, 
 hramamurthy@google.com, 
 tariqt@nvidia.com, 
 saeedm@nvidia.com, 
 daniel@iogearbox.net, 
 hawk@kernel.org, 
 sdf@fomichev.me, 
 willemb@google.com, 
 przemyslaw.kitszel@intel.com, 
 bpf@vger.kernel.org, 
 Jakub Kicinski <kuba@kernel.org>
Message-ID: <willemdebruijn.kernel.32986341d4816@gmail.com>
In-Reply-To: <20261118232315.3593731-5-kuba@kernel.org>
References: <20261118232315.3593731-1-kuba@kernel.org>
 <20261118232315.3593731-5-kuba@kernel.org>
Subject: Re: [PATCH net-next 4/8] net: state the "XDP excludes LRO" rule in
 the core
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

Jakub Kicinski wrote:
> LRO is the older take on the same thing as HW-GRO. And similarly to
> HW-GRO XDP cannot be handed post-LRO frames. Drivers open-code
> the exclusion just like they did for HW-GRO, and disagree just the
> same: mlx5 and netvsc refuse the attach, bnxt and ixgbe clear the feature
> from ndo_fix_features(), vmxnet3 writes dev->features behind the core's
> back, and atlantic only minds single-buffer programs. Clear LRO next to
> HW-GRO, with the same ordering and the same refusal if a driver insists
> on keeping it.
> 
> atlantic loses LRO under a multi-buffer program now as well. XDP_TX and
> redirect can't carry the GSO metadata of a coalesced frame, however
> many buffers it spans.
> 
> Drop netif_disable_lro() from generic_xdp_install(), like the previous
> patch dropped dev_disable_gro_hw(). The core covers the device itself,
> and LRO no longer stays off after the detach.
> 
> This changes the behavior for lower devices. netif_disable_lro() walked
> them, dev_disable_gro_hw() never did. And unlike HW-GRO, LRO is in
> NETIF_F_UPPER_DISABLES, an upper which loses it clears it from the
> wanted_features of its lowers for good. bond and team carry LRO only to
> hand it down, so a program on a bond still turns LRO off on the slaves,
> and they don't get it back after the detach. Making sure lowers don't
> coalesce is a separate problem, for HW-GRO and LRO alike.
> 
> LRO state with the program [attached / after it's detached], netdevsim
> as the single device, bond of two vmxnet3 ports:
> 
>   program on    device   w/o patch    w/ patch
>   ------------  -------  -----------  ---------
>   dev, native   dev      on  / on `1  off / on
>   dev, generic  dev      off / off    off / on
>   bond, native  bond     on  / on     off / on
>                 slaves   off / off`2  off / off
>   bond, generic bond     off / off    off / on
>                 slaves   off / off    off / off
> 
>  `1 netdevsim ignores LRO under XDP, real drivers turned it off one
>     way or another
>  `2 vmxnet3 clears LRO from dev->features by itself and nothing turns
>     it back on, bnxt slaves would get it back
> 
> Ideally we'd want [off / on] (XDP disables LRO, LRO comes back once
> XDP is cleared). But the two "off"s after detach on slaves are not
> worth the complexity IMHO.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>
