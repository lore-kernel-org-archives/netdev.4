Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795285494;
	b=JrPHVKYdt/lWfP/eIwir7X0mfXGv7PLfiV+UQjIjIe68aGfEtbaZ5NN7NmEa8dQxf1aC
	 TBpJlGTaQCsmDmMypomueLsiNc5FPQaSVMzU+KnUoPa08zHtThuSlHm8QC581A5+CJ07F
	 Ex2Pd2QhGjDfcyEctB/4y19xsEekOGMdYrHy5K7RIlhpt4t/ska9CoKxp9zmeO5avC3MX
	 5qGCXfki6hUsh8C53fb00woJCqJ/TZffeVAyRI1bi6yG/VQSkUTfVJexBYVw5ERij1ypY
	 0zYEffMfR5FqlzIC526SkM1n5gJwNQEUtlRX0wxwkfTkjFwWVkOCkPkDqrHqweE/msw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jJQLl9d27h6OnDO6RwhuNyq/zQGkbYpE0WHojvDdnfg=;
	b=ce22bU+Wpj/u2fQ8WbY5y4Y4ONmPeLr0i6mvoHnwUthJ+MZd6WXVs+bGUhTh2lc9ekfU
	 oG1y/E8ddjfzLaUnV47GHFfFhDv0xAc4lK25eDm8sQGHSclx7EOejVo/d3ey+7P7wMGqB
	 hirRqzTHswFfC/oGVYysXSDm3T0Sr2wSbTeKv7wPD0b27t4CMcaT4mMp3eAAnWb5lev27
	 j4P3zTpcfEk2AU0tapNgm8ZAtAUsgaj3T5JIYJXuCod7MTpNMY6mIfrCunR06LWkLuVz4
	 3pRN3eiWQSZJv6g0GP1SWgrFN8/wKwLoJlfK94WlOSYYLVKnvp+4oUoC2fc/5zaBwMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvVCmyOW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935C3606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 935C3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvVCmyOW
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67be9601f31so1760184d50.3
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795285493; cv=none;
        d=google.com; s=arc-20260327;
        b=GfbaLPeM1XDjMOqrkAr4FgJZNNRZJxgHpei3/ySFp3KlTVyAB+jUrYMVXB2NqTO9cA
         ETWN+k4YKWuI+r+opoBAXISo1mKgiqfuJUjFCHuYfOsEaFiVNc5wHkyyGKa8BheLqk0H
         Y8gGhCFKIIbDAksNLolgyIyS3UG2MA9SsrJO0ukXdoFNTPyYwy9SlFIaLTSuXDEmb1Wh
         8JCJYtFRQu60GQI5lMlWl/CvY9fikUgFl2oK3o9ywck7Mrb+44VfMDkPwtk7NVEcox6x
         aM3dOWFqs1lzmTwL9vZ4ookgaYwo0eQ4xl2SAB1h8OS/hOdg5HGTJNyVs64iK2ChqNmA
         IVtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jJQLl9d27h6OnDO6RwhuNyq/zQGkbYpE0WHojvDdnfg=;
        fh=hPuNKX9dfY1huUh+fqq9U5/3qN7M+jgT00SCyw6V19Y=;
        b=HQuDgTUBuXwcRDfUlGCP2BO/03EB2A9syffoAaEbAe7T6oZzOo0DGuwtHUlq1WYRiJ
         fU880e6Pntqht/D465ZhGUUHaQPI/5fnZ/C1aAWxW2HqqoV3r0PUz+cQjOo2gDr12C4Q
         2CL8ec8xLG4egrQThfJauU4e2MJ0yJcXBb6tctUitEwaOoKQ0TbQbxPc9ChOnB3QBXa0
         slaBpmOnvn2XdG2lBlf14a7eRkNxdV6Y1mHDF8FdbF/RwuvmTsp0jEr1FLNouI9b3or1
         cSyb3ULHhtOkChxn6aOalPmHS+U0V5FLbwtKUroTPSTcEoJgHGcWHDm/wyWoZSsF7n6C
         0NvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285493; x=1795890293; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJQLl9d27h6OnDO6RwhuNyq/zQGkbYpE0WHojvDdnfg=;
        b=KvVCmyOWqy+cXvfoBKNNNRBT7cJ3XMHTmv33sXJblseu+84KJ0j88G9egt3cAWC1yS
         9OQdFtD/f1f1G6vJ5SpbtRpUonbuI7v0JCGFwIB7Wr5gFxmH6MGCGOiNxL5BxYbd9xTb
         qgX/RcDA6hQ/H3F6Ue8cy/5lLW9vCTypX5bgAxSZbIIzhs4X47dv7q9s2WMRziAjMTct
         gSPuU4kgIrHaBxImDO0Bouu627uPxtcblkdGktS93WBI/F8XOnPwmQtea+2yVV/nMdt7
         zSCRzDqhLDrdzI4cTnhw5VPcxSIzA+kfDEjnEujv3MxlmaKflPB3AJYCFB1+zF7iKEWA
         BcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285493; x=1795890293;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jJQLl9d27h6OnDO6RwhuNyq/zQGkbYpE0WHojvDdnfg=;
        b=k5xbfNERvMofmikoM6hgJomFpZlpu7eNMllgHrhs2/RWRf+Ft7IK+RJ9nUYXb0S1Q0
         hkGqnGdCwnq8WxYMYdZeFxdDfapKRFHqYuTcOe5AKr8AfIkSySl3Tf287qwuN6xdSYjV
         fzV/kE7Xp+Tan3admPNIyFTpulJO+URhb91vrwI05PfKGbJ5tFYcvs43VHnf3hGcXD96
         x49p1N0B0RIl4yDl1q0r2qSsIArtoAqqS+uKCls2CGKx5pMgAmCSXs+Om2+49nRhX2pP
         zD+7ZneL4pP3gqDpql13WvhGIMotqa+Po89JaMUYKmfcVuDxt/GobsGTT3I4uAt8N1qP
         o2Ag==
X-Forwarded-Encrypted: i=1; AL+hErEoi8h9MDFRBAk4W1lOsgMceJ9mksIu5mS4jpmB0PAvfGIa1t4oqb63QLKjuTGwK1wL49buRLs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/ii3/WQvBd6jQ9k5RLRAx0+lktU1D/FYLfETMLpbg6Sf7NZOx
	PHCkhxg1nrWH/UOgw1E+Rk3VIjdFRNLKdphQBHB+sYLK42riXT87ES2Hz3gAdHH80SV/imjeMA/
	w+26pJq4B4guV/E2Nf4cOCQQOyoGXM8g=
X-Gm-Gg: AZFdTZeGGk/BrPOQht6iLi6o7XzQg+DCmKIoy1XuZdMTKackKsEqfxbHJVDJxUOrXg4
	OJ4xItJOD3LQ2HK0cIV5cCTgJndOZk1sQ7XwD0ItY6CR6EtEGTguOa0R3y6zvChH96O9aqAJVhq
	7kqmKNsYxDD1Nykx9uUGlVxcb+oRjBO6KLoRIy8SIn+i+W8WAt0m7s9c1QB2V2/7J/SNbP2ec97
	ASvtDTUHpDLcZO1wxz2WnvpC+y1WasJ8oKsOxDwzh/uq82U7cmQU14L0RVltQXJUKp2dSJK4juE
	mHTJY8mV+ttF0ZWNLz3MnTcdtzvQDJKbgLWmvcJNstD7iYVLEQspBn6e8s9dDkCM1n6OE/h1Juf
	fEDzKH8mWnyEGSsKJMgZgUw+1ZIr18P7F2FZhp9bLdRMe4ywQ6kGu5hBnBQckreZR0f9ssurr
X-Received: by 2002:a05:690e:441c:b0:67a:2ca2:8a39 with SMTP id
 956f58d0204a3-67df42c44b5mr1420739d50.3.1795285493200; Sat, 21 Nov 2026
 10:24:53 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
 <2cc3faa1-c9a6-43d2-a3c2-7dccb12f0273@yahoo.com> <CAK+kzgycrbHcEpXZhLTPXdWtCUh+WwoBA0mC7CaS2HO7nM81vQ@mail.gmail.com>
 <b4f49c01-467b-4c16-bc47-b0f08ab48bce@yahoo.com>
In-Reply-To: <b4f49c01-467b-4c16-bc47-b0f08ab48bce@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Sat, 21 Nov 2026 15:24:41 -0300
X-Gm-Features: Aa3M54prqDFHToD-m4_afXfK5h3QfWDtz_Lzzt42xCFZtGEEkBsBe_5z6pffYRQ
Message-ID: <CAK+kzgxEzCzq5EvRh9zqB8sc27B6bFws6zreP8MbO3s5mQQYUw@mail.gmail.com>
Subject: Re: [PATCH net-next v12 07/13] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mieczyslaw,

On 21/11/2026 Mieczyslaw Nalewaj wrote:
> This path is only reached when the last port leaves a VLAN while
> filtering is on (e.g. a port leaving a VLAN-aware bridge), which the
> toggle test does not exercise, so I kept your Tested-by but would be
> glad if you could re-run that case.

Done with v13-pre2 from the OpenWrt PR. In a VLAN-aware bridge, VLAN 50
added tagged to lan2 and lan3 and used (the hosts are learned with
VID 50), then deleted from both ports while filtering is on, then
vlan_filtering 0: frames tagged with VID 50 are learned without a VID
(SVL), and h1 -> h2 on VID 50 gets 20 of 20 replies. The toggles took
30 ms. The rest of the toggle tests give the same results as on v12.
