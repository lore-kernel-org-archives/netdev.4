Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810348;
	b=JPmZeSnPzfCHD+qTun1YoZ4Jiqnjii5OyxSBUriP553jGAVi068zgl50zr7t8rUbp7A8
	 Sr/3WHBzkbggA6O2P7UXhLLrEFqFWgJ0cbSCwxu2YobQkKfnvFKhevdEW8J0cTLqnOd8o
	 8B6PrH2oXXv57k67crR3EKQ2zWzcONjk7Bsgdve1f86L7QRLJayno0HrFWF1tKHu9gizn
	 PcCOOLBcdSVyS5lIXlGnMTjG9hPvQCr6YDvFUixvyJ0ZN9gRK98RIzIZ0q2MeSnwNCLIN
	 28m6qkZ9ulVXTyJLv2/UGLa7FGij8ZLUm2r9W9e78fDyze63E3HXnpI3CsNmABCkenw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UqI2rR4S/NYOEtKkItcu/tRll0s0XIsV9mZE5MtAea8=;
	b=LTgRy5KdjfeL9rF/X7QP94UsrTEOMZZQwza8zb5ToMnh7CgoOgFMUWMI3UzfKYw5s/p/
	 ZdczZt5AJmmOIe+GrTSdwagywjf1zRdx5qE8H3MO/qdbuHiVyVW64cXyGtPOiPcZH4E9/
	 g8R6qJeh7gzr5EpidQpPIhyqWzKNQSJYPMPez37IO8N3No1xr79XC9Ozk/4cWjxpmUGkS
	 2yYBba+at/SUS+8U8ZPbiXJUN1MjfcOXCS0MZtBEzhZDK8+xKSiGbD6LUVBrOUkenco7T
	 7kDMRxZB7MrYUFIGjchD87C15/2HScC+Rsl5ZyQUOa3PSYiUtnWZbxDywB53qf+eeMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ctcfra7N;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E142B606A33E
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E142B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ctcfra7N
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491971ac844so2684433f8f.2
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 22:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810346; x=1795415146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UqI2rR4S/NYOEtKkItcu/tRll0s0XIsV9mZE5MtAea8=;
        b=Ctcfra7NfZuR0k0eb4jI/ctDYSSdtKEnPr/4sMJvZYkEb5yeMmsjqRgI3g0YLVzutt
         8EugQMqTmxF97bHTaMwaddPYE1GnlTSt5lDc5oQmNitg8/4oTODSOeNnJ9rVU983s1L5
         yLmOziN6HeQwLCbIppUN3/9vf1zoqZwm4xKyCMn+3hNDIfi9OsAOcHaiJkeklKptX8d9
         KexgiPnRPxTYfnTvIILQsfHmfZkHFqedFskvrEl6diGFoHpOuzR8s52dmqoYgi5jSur7
         dfX0TvdkxvLAvTHnn1NZ+fmpZO+FLODKy7XW6SJ2Y2JO4sTut3tIwWUPj/JyCfpOxOds
         cmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810346; x=1795415146;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqI2rR4S/NYOEtKkItcu/tRll0s0XIsV9mZE5MtAea8=;
        b=Y6RekqXou94Pu9r0RqTXL3W3vri4nLW4JWeDc8VO4kPV2Mu1hjrPhQmqRSHaAUf4aW
         UNOo02/iDwboLAa3Zs2beb5iPZnDWvQIycYjmSrY//RCZ5nluAdocdJ9MABETT2e8PrL
         jtJz5EbXTzHQkuBAJAuYH8zS3D7//gBWvndQdtVca5D+IiicXcl1Syrku4dVcTNUfONw
         JxphGoGFQ52ECcFmqHFjK1zFGMXEvi5Lta3gv0uLvV/q+E0WIKOt4GCS9K3IhsQkvHMs
         unERkr10tyqI7qKFPXp+5ZlgAfcPIRihfwmfLpioe3QRFL87AqLU4akpEntv+/xq4tTo
         cqYQ==
X-Forwarded-Encrypted: i=1; AL+hErFJzX+zY9dIVCcRdlaQsn5KfCDDcN3LCI5FRwBxjl00jvHw52jLu8w/tgtDBmjIk1vBJRD1yeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r8fpo+60EaM0jy8oO5pnTFL0YbTLFSvkbzdlQgvC1xm0yolAY
	22w4WcxTVbq6D96h8HSo6JwzTRotLKH1qk3B2KkKL5io85rGkwY5Cx8j
X-Gm-Gg: AYBFou0P3zGJXZRPzpxzEcRZEGrwSF+KoalalofsR7vpeMcziqTYo0gEIWrKMOVFYGf
	ukJspXC6QJeJUb0WajydCIsUWceFXeZBwrKivwR4BSH9sbfYRV1/9/lcQQRbgFUwubXM6wXV/BE
	sr8qZ2ARL1ac/pnY34Ae0IlNNbQeTmBtjKLEaxJrlio6VConR0UKEwo0XKfUD7ndxo4xLWzWwU4
	lIWD48AFQRTDxa1HX15kDY8otru3P5nAYhYHhB0Ig/4RmUbGILVTga3gAWr0jeTSoSek3K/1WrF
	DH0Y0MYc/haEUdredm9JHkVtcvMNUks/NXV5ngB2M71Zkn0z0ub+w58GSzv/hPQ5QYoH7jbHl7Q
	0o/vTqSi1MQFFuS20vTFFT5q+Kct1YL1J9pLdRJifZD+uEV5gfW4JsFTAbiVtLos2tKXhtqnim3
	Xhly3QcA+JMxvYyM0JH8bU/4UGYVTzuSPuYmwmaslDqrE7lO7S0J9iHdUNbJJvVhNvH2LkRjFlv
	1KIJhaWphl0Lx0dpA0+xwjrbfKPzhxGkq/22nwsmJhG3q7lazZIkFygfqxlAu4WxoLtcW9VFqxb
	wRQKS3oimPG/ZCdF
X-Received: by 2002:a05:6000:4541:b0:48f:bb86:cc03 with SMTP id ffacd0b85a97d-49c70ed7ff4mr14133514f8f.11.1794810346143;
        Sun, 15 Nov 2026 22:25:46 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm21676892f8f.45.2026.11.15.22.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:25:45 -0800 (PST)
From: Adil Tepe <tadilhusrev@gmail.com>
X-Google-Original-From: Adil Tepe <adil.tepe@basarsoft.com.tr>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/6] nfc: s3fwrn5: drop of_match_ptr() from the I2C driver
Date: Mon, 16 Nov 2026 09:25:41 +0300
Message-ID: <20261116062542.275485-2-adil.tepe@basarsoft.com.tr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811220135.472380-2-jorijnvdgraaf@catcrafts.net>
References: <20260811220135.472380-1-jorijnvdgraaf@catcrafts.net> <20260811220135.472380-2-jorijnvdgraaf@catcrafts.net>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Adil Hüsrev Tepe <tadilhusrev@gmail.com>

Hi Jorijn,

Tested on a Samsung Galaxy XCover5 (Exynos850) on top of 7.4-rc1: the
s3fwrn5 I2C driver probes, binds, and does DEV_UP/START_POLL/DEV_DOWN
cleanly with these preparatory patches applied; the "s3fwrn5_i2c" rename
and the of_match_ptr() removal cause no regression, and the PVDD supply
is enabled as expected (NFC is dead without it on this board).

For patches 1/6, 2/6 and 4/6:

Tested-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>

(3/6 is the binding; I can give Reviewed-by there if useful, but I did
not write the binding so I'll leave that to the DT maintainers.)

The variant patch 5/6 needs a clock-rate fix before it works on this
26 MHz board -- details in my reply to that patch.

Assisted-by: LLM
-- Adil Hüsrev Tepe
