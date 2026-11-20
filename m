Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157955;
	b=iBB6DXc//yzHAwVzK8BDp+/n02Ft9xT+79yAj39UlKlUSesxK97/kEmqNoCp3zAhruri
	 nf9DIqDcG+I5FK9NSIyqY5x5OaW99u0ALfGcWWo3Br6LvdWoGawUORX0D4RfD9iBgVV5h
	 +aDWNPAGHlknx5maH5Ef2RDu6YswG+Yu8Q/r3gtdyeZfxnBXifLc1aerx58Ldzn9aG7dL
	 awzkivEH4OfeXtyoWdyLb1/WE6KZaDG4RA6M1vVSricArrXQ4dR/onhrGWbqjDpOwyu1i
	 BDKKlkNIrkj2CxkwiHOSIQJDbZiINtLt9Y6HvCWeWNrDy2fN5SmEEsxeH9q0ZM9dZdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cX4zSLaSUrPhGRSAbtNwMchSN74feKAjOFl7wGwOka4=;
	b=4cWA2ksO6V/LjXSZlYN5eIlh0eJ8HDgCHfKSFziuGSnTIbNzYvUHmq7EWUBOQSq0aASr
	 +SN7RG864zQF1fg2toL7D7q7alLjTaKV9JiBg/sL8cvnb+AshJAkBgdXxgJtrn3TwZhJd
	 YASPQxrZTfmidkfYGjDR1HdqK9/pL9tb87mJWNcq7G4ysbSLJhLFCBhxWiEmXJaIYQ4XL
	 ECAyq/3Imp7tVrDq+y/UrmjTLb9WLAeQgVp1OVAFDfNT8acAijancF1x/+PRU+IgddZ1R
	 almPY27NRkOjcnixcg3ddBkDCYwdYoUkXV1JuVpOAMKqKzEQOUpawMz9IWqCC+3Ujcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B+ayur8N;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23112606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23112606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B+ayur8N
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso1008585e9.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795157953; x=1795762753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cX4zSLaSUrPhGRSAbtNwMchSN74feKAjOFl7wGwOka4=;
        b=B+ayur8NVY5Cl/rajdqV95YrqS724UV1tmlCmzVWef+sET9W2kHQnTzSsJo2UldC+j
         WodZg/VICXi6ZeJuotPMLoyy3zch5pFwecFwpdJoufnmV5qqNVVTB3wwfYETHwnyZ9WI
         qL4XatKPMv1QebuPO29XCMC7VWfu8BmCOn1pdq3rKB7Wrpohvmx3EgLKknyO3LHota51
         np/y9eo5zFX8nBqIvWSfJUcLD1AMvgTqf6HEiSY4TeOKmAtD/agQVtHhyc0UXEf6dRNf
         Gk2fLrvuDkH2afQYJD7v+/lWIcjpYSASsJW405nTC0T0cUrbkAyMnIfR3YlfHEBjN5VX
         OfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157953; x=1795762753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cX4zSLaSUrPhGRSAbtNwMchSN74feKAjOFl7wGwOka4=;
        b=fYomvTuu+TAftjp4IOjtn0uxdu7M4MKmYcbDqoJrWJaIyYX0puVxa9QbGkqYZOpnTh
         xbk4WLJVrNl5/hW+6aFhrjnwrVNSMtHfzwZF5EWXF/GgM65g4zFSbAWB+Iq9BuDahD7I
         5DsyoGWn9esiV5zSwBIL6vJC9mCuuKDSN6qNjUHQqW9qovEqkWsL0ViykZtht8BcV+Pg
         4+gz+ujWsxIY44Xsbjh2Prk/+W3CMa36x1WerZfbXNT1Y0smxHPiwvEu25e9ur3Zz2an
         Ce4LYC6hdivv2kBsmCuHrnSkk5DRiyZWz/erq38G+4GySXo7Dg44q9CT5J0vVs9n9cU+
         HVZA==
X-Gm-Message-State: APuU4Z9n0NHm9OiPtptvW2TfzVgUezZ7QBQPmVkwXmy9vWBp/F5byvWU
	RhfLdMpZ79gJeXecYtu2YtmNKL4zyWe1vaPM0qXmLaQ+doxc+58p5+SYndFfD0TQ9i4=
X-Gm-Gg: AYBFou1CO/SX2QHVsuLtujbzMrYTWmjw1MGHCu7d0rdMl9pLeujps0ZP75L+ZxW0mXj
	nsWUO33Hox/V5zLsehwitSdeJEGM1gMIUan9PP5pRcc3sex9j7x5WzUADN8bgqItxQjnzeWNDSs
	C3JIQtBmayXJACJvVzgndrr01V8mEUS1ISt81VzDSa0jB1Iq23J7/+V7OBx2EzNGGJHACX2n4QT
	6giq1n66tC1kESWqXlTlCMG1rMtuHd88NIOKdxMBu1tSlCs17FJb5Dz51hDGtzcnVk0NBbn8iVF
	hP40lx5bJG63SFbF63MeGAEgWJJlnO/aqv7a0+6DBoCJPHwqI2KSLht9u9BjeTuiRxDNmtT7oNb
	Bz2wsY3Ydp08YSTZaFFpzsxmzbHGjWURghSB/RxFyINbnHeW/ui5+yMGxhp2BaBVJlduWbBV5i1
	tnVTa4nn3qQiojsL7GLE4gt49ZpzkmEfkfWP9tgXrJOxBAXnsxUiILLxElPNeiNqnQHKoJCkOsX
	uEwW5jswh5uAv7tVgqlrA4QvJ6VLRjj/o7BLv8Y1pAGO+YqC3RyM9NK2Yous+VwRWWUWnneo+wD
	Dlorp6BR2iP8EsRuky8j7PespxB/gFGk8+ApeD4qCOZwVNIOfxRKNtRHIJjb+iR6OUWPBIQ=
X-Received: by 2002:a05:600c:828e:b0:4bb:7ad9:2f22 with SMTP id 5b1f17b1804b1-4bb887853e1mr42068645e9.0.1795157953446;
        Thu, 19 Nov 2026 22:59:13 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.128.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm68378915e9.6.2026.11.19.22.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:59:13 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next] selftests: net: reuseport_addr_any: report epoll_wait timeouts honestly
Date: Fri, 20 Nov 2026 07:58:55 +0100
Message-ID: <20261120065855.22628-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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

receive_once() waits 3ms for a packet but only checks for errors
(i < 0). On timeout (i == 0) it falls through and uses ev.data.fd
uninitialized. recv() on a garbage fd fails with a misleading
"failed to recv" (or worse, blocks or returns a bogus fd). Report
the timeout for what it is; errnum 0, since epoll_wait sets no
errno on timeout.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/reuseport_addr_any.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/net/reuseport_addr_any.c b/tools/testing/selftests/net/reuseport_addr_any.c
index 1c43401a1c807..2e8aa83f68dd0 100644
--- a/tools/testing/selftests/net/reuseport_addr_any.c
+++ b/tools/testing/selftests/net/reuseport_addr_any.c
@@ -155,6 +155,8 @@ static int receive_once(int epfd, int proto)
 	i = epoll_wait(epfd, &ev, 1, 3);
 	if (i < 0)
 		error(1, errno, "epoll_wait failed");
+	if (i == 0)
+		error(1, 0, "epoll_wait timed out waiting for packet");
 
 	if (proto == SOCK_STREAM) {
 		fd = accept(ev.data.fd, NULL, NULL);
-- 
2.43.0

