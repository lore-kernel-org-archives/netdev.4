Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647416;
	b=y6EwvRQHqYprA/UJaRn+EgLhE9a8hGPQLRoIdfsYhgNi2zOL7RtpmbSNGYIgDDnISIoG
	 e0ysklLzIh6uM6upE2xbA9O2R3REzNqvmKijp+X4UM6DCQOo/9khqfojdK6CiUeagRtvB
	 2ZW/vGRzqTVzerIe22ZUj6tlpKodKWCGgLb1v/cSb7b01uFZNfEzyDtx4uXb8cY2t/cVG
	 eS+7PBB/rt7+ueX6xd5vxVkWEgACNKcaU0Xd9F5bH5ho9Qg4h55ojNhHdbHQRQNWbwc5M
	 kArZ0sMgsACKdoPnCOXrM/hurECFlTghKaDmIt4vjRWhlCwqitPs0ULB8g8Ubyh1Q9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=fAkJfhA1e625VlHi6/CjskjkxYNTufG3gb4nVL5CjEE=;
	b=0eQa+eDkox44cUQxi0++IGpFSBVGpHeVZriPBuc5lbzVhIORiwZeFXC74CVKqcHP6UFL
	 woLCAz4O4bOeFtKx6yW68eqSXeTkoCBngZMXN59L2kalZ7Thghb3t8vHKT9WKh84aQgn8
	 AGKrT/AbRSf4hz3UHoydo8x9eKChVpzcYNroKwV5JvMuRI/2qfN+LInkVKsp5f9T4z28S
	 Aw/plogzv20j5T/fzqSaFdOGWegzuiOciCQA+hFfIbcPIb8HZ4cononXb4V6ddXYa49cI
	 eT1SzDM4XLQV6A2a7nCvhnYBiX+1WPr4JxZVTf/G7NhtIX+lVozi3Lv5aktKJ3wwILw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R24Rs4io;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20F0606A332
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D20F0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R24Rs4io
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so68194395e9.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795647414; x=1796252214; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAkJfhA1e625VlHi6/CjskjkxYNTufG3gb4nVL5CjEE=;
        b=R24Rs4iordavR6xw7FQ0o/DZGxqlMi1qPyiseaTCiFjx7grVaeSX5uEyVemQjN4std
         P3Qbx8EGfB7TEqZl5LYeeUmy2V929SvoaF4xo/+uvBBSlDWcVu+jT/Q+pridMe32kf5c
         3iIK8HUn9cq/1cMPqfqd/w9fZfkHQZYpRRLJang2Ujxh6V6RKnk8txMDjYJpobo70uDT
         2/Ia9ALqMOcv+hs6xhhqW91UbgncBeY8wxwlb+TPGWgASMR55W2Cy87d6A56nmzgMwMZ
         fSNjTzium6njFnxG5ATdvgIUt01ncWzg7+Sknc4eQvy1E5rZmoq4ucFg1964Tx+DKk5p
         0pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795647414; x=1796252214;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAkJfhA1e625VlHi6/CjskjkxYNTufG3gb4nVL5CjEE=;
        b=L91LLWncqszGDhXgPC1dUuQsuDU30eOJdEiNUZ7jgT4f19zvlaDlZ65pKN7UPGg3CX
         cl518T52uWynpTZGVxbhN4EOkFInG5zgntpJ3wybsg24jYBxy9jNGyGS/KNrSKK1vRTI
         F/cwKxaq52k7L7y1Vbhui08cN3j8BOrNKPfEwb9hBRvz/nLqAbWCa8JWL4tFzHnlWLAM
         cZnHcTXUZeP7pYJZHJS9COdsrFbat4flSljmWfVy6eY28bMIrCZ0aPvVcXn5CYRoj5mZ
         bpmTSzR+JQQKuUUwKfVUmFZqig5zlmgFIlhI9BVPv0gA2AfsaLpX5UQCTHT/vQU3ELka
         X6gQ==
X-Forwarded-Encrypted: i=1; AL+hErFrRxVzn7i9Qr1FFLgVoBKJxJKEYAdE2iPUZwGNvF2iqVAQQukAN2iIaoNq7CMWaSLD14LRm1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wCXTsAw4CDeFhD4JnD0kACKSpM9pjt0iCWeTwDpeLxatuiFsK
	qKC/5wLHUt5bFag1MP3Yfx7uLC53sSw+NLHz+W20owAU0kmUbbj26Sz3
X-Gm-Gg: AZFdTZe18x/IyIdFpfe44TYO6DuDWFIbu+a0QudO05qB+NXG3XwYFCNyU3rJFLUyMy0
	3IA/4GTOiCtIl8SLW0mTzt2I2PN2He+KxPuW0SEdpCQ61BHIirHIDbyF+X55qdXpbHZoK3/KnY2
	9WZ8Aqm0IBbzZj7lgpzqTgtSYr/jZUIqSgdIIxy2opnwn6jkymqWGiizWDIz6uq96nGx/TruiuE
	b5uv0tux3xRKf4wEpOpiLRMP60D7DVl4bfz5EqKJomIYHsnj2NiwrV1m0nqGCf5aoZSp6lAfWC3
	aVUdvRInmnpNj/k6bn7rPv80W2Ii6oEyYzO2tpkGpefoqUw7JXv7XGBUTwP2Eh0Ja4d0nMhvI/9
	BrrmVrugGWRYPNqgooVxQhYuAWdd269pIL5GKMqxCHi6q0by0OFzqdy8TMX2oJoQ47pqmiBpG1I
	o0cwLZrki0RVg7wn+FIM6BHkhhUa4AKjLB7ZzQm/7bWLjiEK5Ax5SvCHlNk/QrjBt49yiAjBh20
	492I3EeR48VjTyleMbb+hRUHL4LdUSA/7ipwf1U+kVdJU+6gdq8gSXfxrF7moQXspyoVDdu+MD4
	RXgAwE1MO6ZCdKk41rlOk6ITwXf4ayHy+TEA+KMn+53mXEIqfv7qqf0=
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr402625445e9.12.1795647414193;
        Wed, 25 Nov 2026 14:56:54 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm865695085e9.14.2026.11.25.14.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:56:53 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christian Marangi <ansuelsmth@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC net-next 0/7] net: cortina: CS7542 wired IPv4 hardware
 flowtable offload
In-Reply-To: <5e9d9808-3917-4706-889d-ae1c360155e3@lunn.ch>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
 <7252b836-e375-4550-90c9-b0e3ab7fbb6d@lunn.ch>
 <179564372798.5.10006827612276789857@gmail.com>
 <5e9d9808-3917-4706-889d-ae1c360155e3@lunn.ch>
Date: Thu, 26 Nov 2026 01:56:38 +0300
Message-ID: <179564739825.6.2717872099061772018@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Andrew,

Understood. I will focus on getting the basic Ethernet series reviewed
and ready first, and hold further offload RFC revisions until that
foundation is settled. Further offload development will stay local in
the meantime.

Thanks,
Fil

