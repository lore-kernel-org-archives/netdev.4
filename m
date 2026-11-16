Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853245;
	b=j38o9AgwW1hDja9/yNcTGjhvcnUpX88ZvZzYM7zKOWJMOu3JSxnhuU3LF4xcFZhUf7LK
	 WoawnUzn9TBXrBUml7dY28B9Tebxp8WVCTLimjYX8WEkHS77BQ1HptP1Vz5rT9ciVlGcY
	 qss2j0Bw4VsEOVURO3H7ISlpEmta0QdCOSAIQAjPVE1TXcK29cdlciIEoPbaqEyZwkwpC
	 kROZGkwjj7sNkzrjo/CNTIQyzoeMbHfguQmoH4BeCr448QxiOyZF8YGK4wD350f53FRr/
	 Q8trBLvas51zvrSDnEkLS7WzS0lC+RAFgUe4EH0GKqdYmswMnqphCnyvT5Ys66ef0Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=focnNfHFlWYzCF1G01fF7j20QFYjF7BQNefzQKj/yZ4=;
	b=Tw8UZn3/jUL6jXn6z4Yjg+rxcYRwZ7cZiZD+UdlMcBRmAqLI2aItg8qYOTeZ5vXXDr46
	 rJt7xHPwYjP2YACAM/r5nEwMLyD8gnOx4gouDO0KVf+0YT0bVHM85Dq2x8NamFs2WQwT+
	 3feyNdqqloXlSbNEUhC1AP+txavdNJiDI3kvYg3pMIj5LQpQUbTtjWGvYtfdMbZ1Tzvtr
	 /otGoOrJwXmpPvSml/Mrs4GEQiDGU6y5t3dp9dL3oVuIz/aRXrYdHu/U4AgDyivc995KC
	 WTo0gaJ/uoi/iwdLgx2q1QtN1YX1KAouYSXg52jM7pDJzcrXIWq1eh+PwusmZvV36EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PbE+QY5R;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CE0606A329
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46CE0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PbE+QY5R
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so1687242b3a.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853244; x=1795458044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=focnNfHFlWYzCF1G01fF7j20QFYjF7BQNefzQKj/yZ4=;
        b=PbE+QY5R3gAv+sYo3vO4FqrcWA9jOXrUvOcbmg9EYAQynHF4FO7hCLYUhuIvMqadF8
         n2g8wQW9PGrmSRIqRKSlWRCwU9OoiZ1WFo++fTlqbVNUvLJwEwx1K6Ec3T58rSnd6LhS
         TWG9QtNKzuv2Rd9E/lbY/BxvhPvaYEWA9eFYiNTguVtNeSVYuG8I7Rn0ZNYJWGjKvpWN
         ksZEDD+cE+0kEK8U9PIS7UMsN1O/fQUvVA3MfWAUsOwn0eX87opkU3vbGgpOjuo9Gs8b
         DxH8zh84SZrnFgeon4dUM4JOVmi/xnOFfYLml5SK/qrSvStAG6rqhgK+X4bc3rHdK+7A
         jFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853244; x=1795458044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=focnNfHFlWYzCF1G01fF7j20QFYjF7BQNefzQKj/yZ4=;
        b=plBiW1YVsylR3lvDwmEooyhBpZUNqhQ019Jtv3HtGX4Zly1EO7Vy890ZJ+V+BVznoV
         UDo+DEKK+Nw8iW5YhRe9D12zbHpvJja42qrSxzRqepRrU9thKxoCqnmE3IgcODw6jvVY
         p84qzRVi2qKnhhYVvNHCbW51Z3V41LMsEQTNOBV+0iew57Qh0xgEKB0FEUybNT4VfEJg
         nU9o27tFPlBVew+1Fm2pho/6ujKKUcWHVhjXqbLGpt5vLu72CuB+u4vlawaM4z48GMdc
         a0MsSQiFvylEvZMy3Jbq9X1rmoGw3WvqUh97j2UV9r7yP7hcD3SbreLBKVAttdmR6LQz
         RRiQ==
X-Forwarded-Encrypted: i=1; AL+hErEu2LxUBEuc5MN5+480X1UaQwgReaFHF4sW2Vh3bPO6Txcqk7jQB0cAlTza6qPVjocI0bmziZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iTTYjfbI81gEzVYNgypQB9Kkj0ckx40uVxh9BmOuJaMtMCb4b
	+Y3KYtHrtJ0KSPkaBqZIxvlriQZmOHBWh/p4Rn2BSR1bwEbjZMgzioYi
X-Gm-Gg: AZFdTZc9OZc9rvlBOuSYhiA3pbN8xcgxr5m9f1dWpc8VMPkmWb4uA1nkzK4Io4gHuzX
	cPOep3ZyygpMnWsWxLGlRCLPIGd0bX2tzUIz0py//CDU2jWAhBR7U9zkTQyFL0LuYZNRXuW/ndp
	k2U3aoAm3MaEZEYiWnQC/vpTYxNKKt1+WHTANfGfHzFEADa99Wwj/XyvvX4V7ffvHrXDiWaJCaH
	kiHbSX36kWLimWVtI94+LKhkDeneWFG0CvYftrUx8SYbxwewTG7O3yNOFN9kLhoOFBqOvAovjsY
	tUpgJSYIAs5SraUUkFmBYLX9CZih1W13LZLwEQ0S1zBW3KTHt8NTSlHoHZA0x78KuIxZYJRMCR6
	T7yWxhoNwiLOPBZZOEN74RXW5Cfu/fQKP4zpUGaTn2zG5gPOk7JWL/SnnRvAKaFHuzrwpYwWtie
	u1FH/mLeX8fvew16fGZEwn1i/q0JWgQF5W44TuNcVW6bjJB7dGMcVz+7h2itBHt5fHa82c64sSP
	rlkyAMsDEmmjH88xBl/VwmsZsGVu9vuVzqS+7oLb4KYWKfHNuH8TyBJ/O1zO6Ym2RpRyhZSI3pw
	SF1SXEqEeEKb2JuRkCXBmTM830uAzrhA6As2PK2YQkp/RruqtVzldDutaPpPWFMJ03EmMYhJZO8
	Z9X4IqWpTaCt3eUdbjDhkuzbby5oRmCEHEHk7
X-Received: by 2002:a17:903:4b0e:b0:2ed:4c7a:31e4 with SMTP id d9443c01a7336-2ee0d65e7a6mr107391405ad.1.1794853244283;
        Mon, 16 Nov 2026 10:20:44 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76db8acsm3076325ad.11.2026.11.16.10.20.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:20:41 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com,
	netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next v2 2/3] i2c: xiic: add KUnit coverage for register access modes
Date: Mon, 16 Nov 2026 10:20:38 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-r1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179484681740.3136.17781028072212776292@kernel.org>
References: <20261112163333.12523-3-ahmadexp@gmail.com> <179484681740.3136.17781028072212776292@kernel.org>
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

Agreed. A RAM buffer is not a portable MMIO mapping. The proposed v3
enables the RAM-backed test only on X86_64 with neither UML nor
INDIRECT_IOMEM. The XIIC driver itself gains no architecture restriction.
All four cases passed in an x86-64 QEMU guest. With XIIC and
KUNIT_ALL_TESTS enabled, explicitly requesting the test on arm64, s390,
SPARC64 and 64-bit UML with indirect I/O left it disabled.

pw-bot: cr
