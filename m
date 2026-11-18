Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031770;
	b=lqoENgloQYVS1d9WTA9Z5ndtgzJOl0iPEgx9d9DKs1q/dSJynIrO3TMy8O2YbrPKublx
	 n5qq9WOpXX8ony2Dp5xaAqLOsNJU3oTvhcy4WEEZm7DoqRXO2sFPYxfete15dhhL+N9+7
	 DZ2aNfhGpusBGQqLAHsudGTRZ2zJVku1ZP6VLc+exr4+Ueg5lCwOt8a1tX4YMIecQYKYO
	 xfZOFfCx7rXxvUtrcMB7y0pwLywiIbwFwJH71oqa043hqK+Wt+/InHX366QVIfESd1VTI
	 kyucwHd9n8RzyW5PLUupIznbD8rFYPOwd284reSAlnm7YSzSkG3c0QKwa8QTiyjnVkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031770;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=87awnJq1jkb4seJuxJXK2LDjm3k40G+8Wfs0K4Y+pf0=;
	b=K7KRDiNLXt4uoQkCKAP/rFbww8htA8aEbSsD6K8qdBzQ5RgG/AkE6eREgdjmGFCdfnQH
	 F8pGr1jXUlK7NYhHwm5ffg7CcfADOQn2D2u87SDoM18+ZHXXi1epOm5hClVfXi+n4077P
	 MibMkuuQu+SNSoxbhLmdIPSlom4oi7gTUdl8Sq5y9NILQpX6S1ng1rASLb42F1VZV4dgg
	 CLmGrfvuey0eX1N3mtkYY8SesMQxegEwP7KVlJIjHpaaOqmURD+s9KMNYoZQWygtDlCxN
	 A+FP4UEpyw4gmVsyqvOjDh4VgCZvJbpdO8y4wpAfpkAX38auP1s/nR0PB/VSJP8/HZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b="Gy/rmkmF";
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD34606A33D;
	Wed, 18 Nov 2026 19:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFD34606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Gy/rmkmF
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BFD5A157C;
	Wed, 18 Nov 2026 20:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795031766; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=87awnJq1jkb4seJuxJXK2LDjm3k40G+8Wfs0K4Y+pf0=;
	b=Gy/rmkmFBAx7NhiYguHsOm2ZLWQs0pZ75Wmt2dH3ZfKPvT+ZERs1J5RqHthwZR8Ef/S2Ts
	6pVqK53yYQqVp/XO6/qml0swFU9nuL9K/zZ4iOzSkoKcV6StVSTCMe+tm63gEj3Ul7VccR
	+JnnNinlBXXVtp3I/bt4G6kd6+BI4IqL8VSLxoYVYRh6+f7pY/auUk8jOuQmKZPozDG/C7
	/EoXBatbG5JSZ/v20HVY6liUA+vo8z+s4zrZMQeSs0ebzSE8Z8REOf5heTb83Tp5JNKItI
	Xt8ZYL0gNo1T/qBGO5ZqTEfhORzG5rHwu+RgnQTuLh0JSCKHJLIlrMhroK+skw==
From: Nicolai Buchwitz <nb@tipi-net.de>
Subject: [PATCH net 0/4] net: bcmgenet, systemport: DIM and Rx discard
 fixes
Date: Wed, 18 Nov 2026 20:55:29 +0100
Message-Id: <20261118-nb-genet-dim-stats-net-v1-0-13b275f1e088@tipi-net.de>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QqDMBAEf0X2uQdGIWh/RfpgzEWv0FRyaSmI/
 96oj7PszAblJKy4VxsSf0XlHQuYW4VpGePMJL4wmrqxxpiOoqOZI2fy8iLNY1Y6yFlng2/rtu8
 CirwmDvI7wwPKAY9r1I978pSPJPb9D6frGAF/AAAA
X-Change-ID: 20261118-nb-genet-dim-stats-net-b6b6fd30398f
To: Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Nicolai Buchwitz <nb@tipi-net.de>
Cc: Justin Chen <justin.chen@broadcom.com>, 
 Petri Gynther <pgynther@google.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Florian Fainelli <f.fainelli@gmail.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Sashiko has flagged a few genet bugs over time. I'll work through them
as time permits, fixing the ones that seem worth it.

DIM on genet and systemport wants running totals but gets per-poll
counts, so it picks bogus profiles from the wrong numbers.

The series also fixes DIM getting stuck after a down/up and resets the
Rx discard count with the ring.

Patches 1-3 have been tested on a Raspberry Pi CM4. I don't have any
systemport hardware, but the bug there is the same.

---
Nicolai Buchwitz (4):
      net: bcmgenet: accumulate the DIM packet and byte counters
      net: bcmgenet: restart DIM from the default profile on ring init
      net: bcmgenet: reset the Rx discard count with the ring
      net: systemport: accumulate the DIM packet and byte counters

 drivers/net/ethernet/broadcom/bcmsysport.c     | 4 ++--
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 9 +++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)
---
base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
change-id: 20261118-nb-genet-dim-stats-net-b6b6fd30398f

Best regards,
--  
Nicolai Buchwitz <nb@tipi-net.de>

