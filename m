Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620926;
	b=dE+cFwc65nYUTF1eqtqeoHxF2RyASwp3KVBf6X+jvmIEGY6uP8XjK4Zb7YRIAlzPj/kz
	 mda/iirA5LsBNlyRvWl/9GJbcWz39h+IinItVmpIRAWkr0QIMPVJeO193hBAkq0r73hvF
	 gtzoZyFYVzQQnZcfSolCUDkl4a1o06R1+CGxLCz7RDmubO/JEAakZiv+QAbQKFjJDYU7Q
	 7SEOzpXkZPTcqsbiNW4a5ML/J5rT35XeANc+nceh7GSL4myxJnPH7kEpndGH15NobUYXH
	 kFd6HdLP5sjir0Uw1zGkG9I8M8kTv124Eqk2SEDwwTFTe3hKHa2fLPosP88yv8MBYJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RaW8x3wy2dy9KRWxzMBJFya20NKzKWRFujyB0bIcDJk=;
	b=XZSspJfCbsQIOkrcvH30+xA3UCmeJdoW49nhC1WLqh4mU9y/55n8BxeC98jFh/96Fj9p
	 rgx3huHjdU3hnb5JswC6yFBNp3NdM4eHQU5+d5oCMiqMRe6+Qni8eZcbrT7vBh8PgV85d
	 VWnGs05qW2hrQHiuemkG2aMN3LNE7QH1aD251biCYZNG9J12doHqaGoJqWojVoXpDnWtX
	 DtcoE1XwCynIhTEjVxH4QJWOz6mrwDJWDTl5tHe0QyEAJqpFotJyZJFQOvcz/lHDNGenk
	 m/kqqQoVlwvgLrofdcE/p3F1cWBK8SnoBwQcmmRCyrNv2X2x1d8wnpSwCYA2me6uHOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=rjIL0cbT;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE579606A334
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE579606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=rjIL0cbT
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so60630695e9.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1795620923; x=1796225723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RaW8x3wy2dy9KRWxzMBJFya20NKzKWRFujyB0bIcDJk=;
        b=rjIL0cbT0oNZNA2goGo6xIOOUyHMaIJc3CCNC0cQ9u3F8Ll2tMJuAW03iB3ZwRv5eR
         pkEIwRRc9XJrttGZTRAR/aadihv8X4HXW435F4AfkAppOFQf/Z6qg1zZfSSZeiLsC5gx
         xsCeb1MVAXDrkPWqYH74GOtfIPa9DBsgGxuyn2oVIVh26jIv8Nbx/ecSKyjhSuJees+v
         gBL9I/MLVZMs30lUZfDuEKMUQc4pzhnkZsjZZQbaZ+a9aIEAiq4idPMsBQeIwCu+HL3d
         XlYiT1Qfv0Rtsx95kwkXSJ0qEYsEcFWtJAOKrHMT/uY0KPwKPWruO1wmUSektPsfEInw
         Kcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620923; x=1796225723;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RaW8x3wy2dy9KRWxzMBJFya20NKzKWRFujyB0bIcDJk=;
        b=GZbbvIEQSJOcJW011z/EmjxCYwd5B1FBPljcdCJKFGxraAD/FmbRnbVdq4h7HH8Gua
         V1Wx7/RWIc1WTQyE05lOWIb5qivmIWeuZ+dH0XpLOep+tTmkkVTr8vK1gwfWNhy+AACb
         dLkU9vGsFGZg5GnkNsuDMgmHjvfLQJxyisKGQGbBPdqorjfyK1q243F7Ynx3fbV0B0iX
         V5BNt/M7rKEF8l6YsVrYr9vtIHhlnTvV6Ie3vktho2uHGBOCW7iQqT8SgWTuw9vvqJlO
         gcWBTqmcqmX4ZVZB2Mh1JUGkbILxPuiQr3mgTBLtaCff0CySvRCbCDDmm305PkBQOoTf
         27FQ==
X-Forwarded-Encrypted: i=1; AL+hErH9hH1/On6IwDcuMoerQTYBCeMcLRDH7ge3GY2x2HkLyqpjZS3tZEcvKeBb2kQH3MDwyfPj6YU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WWVcle1u2VFvSQGW66R8g7mRSeabDZgdI+f7ycrvXscbIslGB
	IPpqCZWcZpIQ3rML7/hU4orNdK9UABnrct8X79Y2fjVX2rg1ooiy8+N4yEni6H+p4Fc=
X-Gm-Gg: AZFdTZebZGEy4SanRevs3X/CYI5N/Uy2sd1Nf0F/sqog86+ZlQdUnM7p18PwMsFTENR
	v5hMF+ekIGvWRH0+NfdBz7lXfXPS3g5QFHgYgSualBfRbvVjdzvF7GDVXMUFhR5b51k3hFy6hAO
	zCQ1f44uG8EUuv9KMfUz8MM41lMrzt7IHZV8+boDAY70dpD0JmhPNfBP+U3xk2PrjVdMTM/NZ5k
	GP+jv40iX6OYJ1kDNQOwN68plnN5U+VP0q13bUynuZihZl7/xsJE7nySrzYb2+TyKb9wX/xJC/K
	FWRXildNO1cHgTYSdD52sxiM6DDp8JumsPinguYII4xtquftaFVpe8VWHtM2bUvE58vycGk7lej
	NM/RUZvBsIghnH7RPzviq7GyTim+zLSeCqC+VtDegMIc9Wxs3n0NMVQ7kGZ8AF2L1U92wRUSNVX
	hUSmKR1XKVDzY1qgP2gFKhjcnDHIDEJ52AZ/SMLopMZU0GtZn9jYYG9tZSqIzrvn5LKBmW5hKrA
	SQE9xdK6fRTgzdxxQ7rV/k449LJI6cZ0UM9LcfO3QHCSXNcqjwZuOhBJFi+lzQiLeU+A1hX34b6
	1RvHlSuUXE5MZw9ZKdD2wddy4Hac0EDCl6HXdOAi9YID9mp7Cm1AAdlLz3eUEO/czOrEApAYQ6P
	kfzRqC74T3odrXf3UAWw=
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb8881d019mr364067455e9.10.1795620922993;
        Wed, 25 Nov 2026 07:35:22 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm35816275f8f.3.2026.11.25.07.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:35:22 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Chuck Lever <cel@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org
Subject: [PATCH v4 06/21] net/handshake: allow the DRBD TCP transport to enable NET_HANDSHAKE
Date: Wed, 25 Nov 2026 16:34:56 +0100
Message-ID: <20261125153511.3060599-7-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261125153511.3060599-1-christoph.boehmwalder@linbit.com>
References: <20261125153511.3060599-1-christoph.boehmwalder@linbit.com>
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

NET_HANDSHAKE is available only to the subsystems it lists: the SUNRPC
client and the NVMe/TCP host and target. The DRBD TCP transport uses
the handshake API for TLS-encrypted replication in the same way as
NVMe/TCP: its BLK_DEV_DRBD_TCP_TLS option selects NET_HANDSHAKE.

Add BLK_DEV_DRBD_TCP to the list, as NVME_TCP is there for
NVME_TCP_TLS. Otherwise that select would enable NET_HANDSHAKE with
an unmet dependency.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 net/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/Kconfig b/net/Kconfig
index 76ab44aa439a..db53f7474b7f 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -92,7 +92,7 @@ source "net/xdp/Kconfig"
 
 config NET_HANDSHAKE
 	bool
-	depends on SUNRPC || NVME_TARGET_TCP || NVME_TCP
+	depends on SUNRPC || NVME_TARGET_TCP || NVME_TCP || BLK_DEV_DRBD_TCP
 	default y
 
 config NET_HANDSHAKE_KUNIT_TEST
-- 
2.56.0

