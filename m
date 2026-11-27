Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772677;
	b=zYrk0aeT6tNOpN4p4KaNFTHlJXxnqFPoADLvUzzBAbJGBqHJDdcX9AdygfJPv6qc7VkW
	 DJG7D7yYt1CAl/m0n0gAWtWnSYCY5xR7GqMVCaKSzZ1NFRUdo4FWCb6wjfLqXKD19OEgY
	 2j5GPrKVrZySzNjwUOOqG5UMl4tdzOFJJgKOwRpojywMHEij6tGRRa/JHUoJlnf1Q639L
	 ikJrJcWwi8RbsHPz30oaw0yPO4ZZI5Z6/XnUdKQXJ+uW2jpWxnaArFbjFdBwN0sCE6QnP
	 G5YARXqOfBiP+5tBlBeoYdo5g1GPHu0kXbOaBoaYmEqokNwuicP/nFAMOVBxDGvPEsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kickVyHCqw7m+/zzS3Tm+FHiKP0gHN0yQAEnTz/BI+M=;
	b=cjQYRrpi274Sz06TsecVd8SQL9h2kV+DGB8UqX4+Avp8cDJRe5ia5P0iUyFyYPcJsN00
	 F5kZ8PHPJnP/rhYnFwM4ei2o/g9FjBUQ3sYPkx46vrXbeebYYVQ4WwDICpyHlM3vARYzS
	 TKYYr9P9aCcDgNgRcW9TQFPwlsm5+zZM50HeoF1nDrXzzswtUmTW5IeVLyYRaAXNnSNXd
	 8LewPVbOMZcFzV9Bh9yl9HABxlZ0iHMIbtgWQzsilJG9NdFHE+C65Rs59TDhI9nx7cwvO
	 PMKWuKezMRvsk1oGM/Ii/A7yQ7tyXOLlNlnxPZnt7eAOYqEQANtZQFLJvqSDNzpiTCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=UPNfFUJ3;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14298606A336
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14298606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=UPNfFUJ3
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386cf1041cdso4803078eec.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772676; x=1796377476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kickVyHCqw7m+/zzS3Tm+FHiKP0gHN0yQAEnTz/BI+M=;
        b=UPNfFUJ3OPgNiFJcut+ESQpF4Kv4m/UrytuSlw2ndm/nZ8u2jql5CSXJy+hKwOMr7l
         4aDAbraTGHtLNoq3uObESlkSYzfdc6si0AnjLw6pm9nMc+djTksnEf3Nf6UGLUvTNR5K
         S6LMSCEFA5meLAZwD1jBUyWBPlBdY9qilLtmxRLPyXsnbG38OXinr4+E0UMBZofHbg06
         s5VjoiPxH7bIdt3Z5T//Brz42arkCHZ9DV8Qx1uHJJySgh5K73sYavk9bD9W/HiDEkox
         0BcaYBG0U2/Ega7tKoE0iejegxFgAZKs0w/aM2rqp29DLXS260rcPZahShCtZryt7u9Z
         cQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772676; x=1796377476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kickVyHCqw7m+/zzS3Tm+FHiKP0gHN0yQAEnTz/BI+M=;
        b=HVSchS5P+Ud5VxnaKKfRiOlMi1hg7EPpQ2NCnYv4E+1DIFD+14M9M0+O4aGf9mV+ie
         OYq278L+Tk2cWvkWNi/ohjwLyREarakxDD1h6t0CPLPcGOwN3wnbCFkv0woj6rgbp1/4
         YBGfPBanASsZzO925oyEY2jTHPRbSZnZ7UUW+XLuh5+DTM6EoAyOM2TWMMiZTgcDJcBI
         ezZ/W4++yuk+SbC6+qHe8vqm28sQBEUe8qMD3Ef1umpH7qAfRFQ6dic7OQAr4VKn80n4
         1Wp/dUeF9PBxul1FCkvfcErVZZNTL3wg2s4McaFarORo4K+K2bkPd4KK5o851TFWN/Gf
         XcRw==
X-Forwarded-Encrypted: i=1; AL+hErFhmsKo+tADS9uTcnVuoE4YzYgQDQ88nnlKTF8Gd76zShFeIfdmsLS4KUq2s5On04Cw2nHy7cM=@vger.kernel.org
X-Gm-Message-State: APuU4Z973ROd4FPK16nr+EG5bUOpoHXDD1HSqRlVPEiP718WhK7mCCyc
	gSLWKF+TMOaZ5zWOavgX8P+wHmhSA1YPurS1cz6do/EcGFnWddy8yv2FxTfbquW0JaoEiL+uq/G
	LI5szhzI=
X-Gm-Gg: AZFdTZdN0kye9NcGyQarxhAp0yogk462ey8s1T28/yUrDCAAioQSQkVI98XDflthfPm
	Ro52XywAKKEHW1X3mfI8b8keHEnVC1bobXxFxGb/E6GQ+gnna7U/tWNoVuYaXuHKiP5VTjKtGfN
	bvViZbavUaaor8WJzpXwdfrXxRLoo+dbFt4R/2Qsbz9sDpgBiom/ys8aKN9y0Z1qIrbulBmq2jn
	IxBP0ByeEkgEhWtk9OGQOerqMSV42pD/1pYTmd/RdkuYcElYcmSKvPWmyU+CMrvFyhON9ME2k9f
	8FeUQfv7n7fpkUM/hVVSdXN6V1cveBebqG33dw0hXQxvKBUq98NyGHLXBZL+2xUsf+0uFkLva8b
	z1hnZJJEVdS4FDFcoFm8QxUnwaSOMOO1fjtHQVBzmdI5AFzT/lBXpVk8ygqS9Iqmp0U/8u3tNAq
	Tpd7jIDTa/u5lgC26BNZr5r1Tnduv7BSdR12lmo4GS9Giv0TiPZZlmeCnTcCq1MKIZUmQUL69al
	mJrBQ69QFgPb9UozF2yk3R+O+q18QxvLTa8W+NeLQe9q74jn7WGmRlGJWNHsUo7IuJuYyuafC19
	uUQEE5255UfWbwik3qwihRNTriDhDFntfW7YAKk/pWa/DJpP95x6qjkL5blio3nnq15YZ7Spw3m
	/4y5yNt4wMgrF3SpXaTEU4k7N5y6tmrBhYT/x3TZdYeoFirBF
X-Received: by 2002:a05:7300:d083:b0:380:f112:3cc9 with SMTP id 5a478bee46e88-3857093f06cmr23196159eec.38.1795772676367;
        Fri, 27 Nov 2026 01:44:36 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm84928712eec.4.2026.11.27.01.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:44:35 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: ap420073@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org
Subject: Re: [PATCH net-next v2 11/12] selftests: net: add amt_v6.sh for an IPv6 outer transport
Date: Fri, 27 Nov 2026 09:44:33 +0000
Message-ID: <20261127094434.2965392-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179572062428.3135.4041633001964825666@kernel.org>
References: <20261125191450.2497936-12-omar@blockcast.net> <179572062428.3135.4041633001964825666@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 26 Nov 2026 19:17:04 +0000, netdev-bot+sashiko@kernel.org wrote:
> Does this also skip when the amt link type is not available at all?

No, it did not. v3 checks `ip link help` for amt, as amt.sh does, and
skips on "Unknown device type" and "Operation not supported" from the
kernel.

> Does this skip in the packed-attribute case described in the comment
> above and in the commit message?

No, and you are right that nothing in the tree emits "IPv6 address in an
IPv4 attribute": the exact-length policy refuses the 16-byte attribute
first, with "binary attribute size out of range". v3 matches that
string instead, and the comment and the message quote it.

The Low finding is also fixed in v3: the message no longer says "plus
jq" and says which of amt.sh's checks are not carried over
(send_mcast_torture4 and send_mcast_torture6). test_query_egress() is
carried over now, with a third gateway in the first gateways' /64 added
for 3/12.

-- 
Omar
