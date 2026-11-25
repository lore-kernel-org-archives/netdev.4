Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612494;
	b=DaSyFWET7S3AJIwmAYkNaVTJjmdz6/NGi27uzusjhw5oVgKFCl36JP5FA+lFFkHC9fbg
	 xzHSPNnmhegzboK4aLFKbiQBV1fI7T85ci6FOsVhg4ioytaNGtzQdlUC3MgZgKVXtCDSR
	 hBzuNBL2Bgs7KFADiBPenFeyRUfUXLERZsqGEfwHylA9o0gK1W3XN3pTUfnBqXMzYnhxy
	 buqPE0ul0Lg84+f/vkTirJFHbaoN54pXrX0HlQ1/tYqv3B86kiokS7mjHFxg/9Az2Vg0e
	 tOt9UBvMcPfo1jbgr6VFXiGoiCepP1klWpRZuru+MtE5NkvqE/b5s+Ts0TM2EXyHJMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rsD2t4wySwOX9483/VTT5W33RUNkdKR2nnX67XsIXPY=;
	b=2VQ8XsbWAKVe+TNv2JLInjcQyJnDkBzbww4adIXuGGbE0SNk2C3exFb0feXLeM6WEK4t
	 wfcPFb4Udzrkj0P8pb3Ah1+wdVNocI9TvldsHnBbtIX5zZ0ovC3QgkIUnUFhpQ8ypZ03Y
	 4XTn7bDCHkxpx+t3a4mH8VDNQ2EeYRvXvJhfOWJbuiY+7S3EulAR2gJAwAHlGDmgPYOxL
	 lTFuz1BEexIDPiCIvzm5cfrunRRz1FhmiXnfofiSZmSaKNR3Clbm746KTaifTKfL/2U6O
	 QDoi8JwdM0Dh+iEC3brPuzFj820mldcLpzqJay6x56xaHtrd4rv9Kr0LUPEfIXKa7bA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SQtVpwNq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0FF606A337
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C0FF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SQtVpwNq
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50aaad19fbso633559166b.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 05:14:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795612493; cv=none;
        d=google.com; s=arc-20260327;
        b=FF1E0iev0+4/JnRCg4UFtbRqgFvdX5ax6eqZOp21XuuCZOLPdspa6GyWYLdRCxHPlF
         cj4AJhNtARTfKjrgCzfMysBXw3wnLSTG9Qwi95dvu9mUKqy+yC1n2T5vT7BhjUYr1EOS
         h9OGcpMIa9CeZhTpWV3zLYtcJIhQApElkYS+LvJEuLCXkmQmWlr7agv2/NInfcmrWXcz
         /Q0r9+sbL/aDVCcPkLj5CezOH72M8gUiVlHTUVhXyp2vHt6M0MmaMhuGu/Ha4AblFK/k
         Tp5TCVi4TfTmVEEcl6u871EhnTKUvdp6rryKXTJNhAtnPNylxuKq0OfZ/CSBREpcOudH
         anAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rsD2t4wySwOX9483/VTT5W33RUNkdKR2nnX67XsIXPY=;
        fh=VkjxaU2phDZjErg1e0qk4nz1klXxOlmnFWYyWnZd6Ao=;
        b=fxUwlHcriaE8qI49x4I46EvMSzJ+XIm1Y+DwZEKiq4htdGIouJlFraUNMoQ7PrJ+SN
         at2NxzWjbyWyCpbOF9C7yUysMt02ix8mVYwvN7nxkVkhaVv4MQy+kM8Y+BuXJEz1rQWn
         PYYlxuTJP+QRvxk3wMtK6JE3JyXVwtuNMIfo2sG6rbT24JCmBmlaWyCPKSpg7MOR/z3S
         EjrFThyhwkDqXV1O4MUjK9maJ+zQaOfu5haO1XVtaKtyVfhOgCE2hF0hS1eWSroamQ7X
         oGQeBvZLdqtslCU2gp+kZWHacRaVYZFWQ5x9+q81qDUYdiyY63IqUlENOP7IZbtMT07h
         c77g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795612493; x=1796217293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rsD2t4wySwOX9483/VTT5W33RUNkdKR2nnX67XsIXPY=;
        b=SQtVpwNqC59M3VVfa1dfoE/sHfHGz4A9t3U5kjHMDgLzJ/LAFCY5PizY0zTwKdadfJ
         O5ndt6idAZjUViDyFaIvEIf8PjRYdeEJFTenPhqxD4KS9aPKfpOMnuTLEhg3AkAWFtLb
         C5Ymg14tXaFwlcuhdcnd7dGuMWOyoF95OQ0QdQje9wpaUvQsnSy5dKhyiokeJ6ja7Iw9
         +zk02GJZi2Wlz6yoDfQWZ/vdkaQsq5UB2BtV1yJAYqfUJRYjcsv3oW54uKvJOZv2uChN
         f+AE+YTe+od53xhnjSMY71A2eUBacbOYKi4eu6oeZ84A/p08jqOhFnP6cS/QI+9QYTOp
         pzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612493; x=1796217293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsD2t4wySwOX9483/VTT5W33RUNkdKR2nnX67XsIXPY=;
        b=dDqRSmZWI968/NPbfKSU6Ob4jNeP0qYlwNXdY7kmSfwxYw1lXVtd55duu810RPZQVF
         RthysQ2CfvLDwRyi+ZdvRMNNf47KVad1TVu9OZdRA2CcpxnfyEJjQxZK430gh/ba/QHf
         suIf132LdoaHSikMrFyJyAyMCgf+Yffk4WEf23KJlVf+8ddObaL6Lg4WlS8aVXM7/uNb
         iCGcUu8tfm1dX3fNpruA+Hh2Q2IRpDZ992W1MY5Pq+3db5AJtEdiNIPlz8JnmTY5rn9J
         sEQcu7AKBPdkv7bZkqkyRbhyC5mlf47JpKWKWsCt2I0h0N+CSsZ7BxMSfsdI2BU4PpcL
         0v9w==
X-Forwarded-Encrypted: i=1; AL+hErECGNtftAUWHn/tywb4CiIvmyc0f9CbQTAVCdosEBiCugbb8hZag0HNvSncT5kHxZaWA5OL+T8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JeVJTSGJxtr79RIBc/P6klUne0aQlDyO3Srx+6lzd+tMQblFn
	sJbcjIkHrajkvKbUZN4Gp42A+0SJpIL1Ns7w9zqZbi/YSptCO4rztnTkGPcZdvAUlTPJEkGB5ZR
	gDn/ZRh2SSZRFfLSQtl+9OUCLHqRBWcB7pf/LEdELNw==
X-Gm-Gg: AZFdTZdrepv1lzfolxlhNZ8ahV2K0z3Vf4aYHL0Kdkx9IZ/gy+ZsEfu3DEWXdYjoNq/
	b5ucCclUH0MY+lNcYPk55XLBskW8W/avgIYcevslFqIRBtRGQ2Ww3LTBSVR+77G1n/MWKg4gFAD
	AWpCESZczi57UYaibi9XHibssth1VOeFw+dNegxD/5NT/vAftRWK7rKM9hzYAjS1j27vgZZfvSs
	0yJlyz7EIarI6CszluhbILgJI1zwWxSAKOyCC/BZqzKYeJ/DnlmIgXdyot1+rtGgktLgYx8WDrt
	v4DobuHOCrh2WXTaBPYhl+6ubA0sO9U9B544JTF/xp9EOQFfrQJMbAptmqK0WE7ZOwt8qPZkNRv
	QrGoy6Nd0sAN+UdIFVHmIf9p+Eg5fhwKPK2nGB9YyzbsEc2Ob418NuZJ7BRRXutK2KN4/HQ8=
X-Received: by 2002:a17:907:9306:b0:c3e:e677:5608 with SMTP id
 a640c23a62f3a-c513a5da8d0mr1423705266b.12.1795612492588; Wed, 25 Nov 2026
 05:14:52 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118184729.2302130-1-m-malladi@ti.com> <20261118184729.2302130-3-m-malladi@ti.com>
 <CAAofZF4XYd5z8X56DRARMxbu3t7QX48T7V69MPBw9TW1BQAmKg@mail.gmail.com> <20261125113634.GT31322@horms.kernel.org>
In-Reply-To: <20261125113634.GT31322@horms.kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 25 Nov 2026 14:14:41 +0100
X-Gm-Features: Aa3M54q0E3DE8nTpapJpm6hmEWKXKOUeQTw9rDRWi3Vp2mEG2fUlO9gFRZDhhqk
Message-ID: <CAAofZF7tvsfkjjZY6e8Y7P-ddNnR=XQfLAGysrpq1yp0rRGrjA@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: ti: icssg-prueth: Add ethtool RX flow
 classification support
To: Simon Horman <horms@kernel.org>
Cc: Meghana Malladi <m-malladi@ti.com>, kees+treewide@kernel.org, 
	laixiangwu@cmss.chinamobile.com, philippe.schenker@impulsing.ch, 
	haokexin@gmail.com, devnexen@gmail.com, jacob.e.keller@intel.com, 
	sdf@fomichev.me, john.fastabend@gmail.com, hawk@kernel.org, 
	daniel@iogearbox.net, ast@kernel.org, pabeni@redhat.com, kuba@kernel.org, 
	edumazet@kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com, 
	Vignesh Raghavendra <vigneshr@ti.com>, danishanwar@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 12:36=E2=80=AFPM Simon Horman <horms@kernel.org> wr=
ote:
> [...]
> Thanks Marco,
>
> That may be good general advice.
> But for networking code the explicit approach taken by this patch
> is still preferred.
>
>   Using device-managed and cleanup.h constructs
>
>   Netdev remains skeptical about promises of all =E2=80=9Cauto-cleanup=E2=
=80=9D APIs,
>   including even devm_ helpers, historically. They are not the preferred
>   style of implementation, merely an acceptable one.
>
>   Use of guard() is discouraged within any function longer than 20 lines,
>   scoped_guard() is considered more readable. Using normal lock/unlock is
>   still (weakly) preferred.
>
>   Low level cleanup constructs (such as __free()) can be used when buildi=
ng
>   APIs and helpers, especially scoped iterators. However, direct use of
>   __free() within networking core and drivers is discouraged. Similar
>   guidance applies to declaring variables mid-function.
>
>   Link: https://docs.kernel.org/process/maintainer-netdev.html#using-devi=
ce-managed-and-cleanup-h-constructs

Ah, thanks for making me note that!

--=20

Marco Crivellari

SUSE Labs
