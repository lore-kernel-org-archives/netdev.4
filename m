Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673605;
	b=qnTTBOIf8zPxkPSwcEIoW73Z57+Yx3I+UljKRPuCYrBXIfnmOlsyzZQqZ/42Ww/86117
	 Bk77lwBjASLMAwqrnKz1hOtgZDFW08c2EkOVa/tQXbvQAc08Sk8Pio6x0W6DsL5T8cAuK
	 NKUaHD0N5Cr0IaQe3y6R2Plu32+VtrmGNgc2BX9WPSX+WATljVH9Xy6oP5ixBOhr7nvSV
	 QiwoZWNdXW33zvMiIn1rp3LwSlIB9WH+t+XboTt4HIRGjPXXXj7RN9UklzYtizTHbaKqc
	 WUu/ASkqUg6fyvBT4dX+yhThxmv/J5Mg18QZFYjoGAYZebCJLV94vjfAFo4Q5sjHneg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TNFTF7NV7Q//dPvrSTZY3AgficwQjRGJt0rjTizoF/Y=;
	b=C1WcDh7n9+REiEjRuvS8Syh9pqhbej89RHP8ZsLxGYxmgELwBJVVvzlftvx4Hv3zT73m
	 EpnohKeGIgi7Qjygu2OZzFM5ZxA3nCIt9lpRU2NZ7RUAhlwQYcksLZyTtqgbMpH2uIHkm
	 s0b5pU6reu1AJP2xap/FzuWwWaCW3v1glGK3WRC+3tBlz1Ga69LcqtLXvJVRJI9p5xaor
	 LoHmU8u5tbsYFmE1qys1ZG9i5nl09zqbaZjC8sSQpw5YNxM8WplD7gWsuf/4OkhbkQoDa
	 4YHiMz2EITyQGY1/zSSjZE7qFjPHYJT1geN5tVxl+WLl45Gf1PdGpd0E5ts5/EYr6vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EGFEoWw/";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278F1606A32D
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 278F1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGFEoWw/
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1909348a91.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673604; x=1795278404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNFTF7NV7Q//dPvrSTZY3AgficwQjRGJt0rjTizoF/Y=;
        b=EGFEoWw/K66OepLc+Jg+1H3FNhIxIOjTvVvh3dIMaaL9GQ1uDnLPUQHe+lj+FgQkjN
         /q8il6b42zPDdNTG+bt4wLaf0UPlZUWvVdM7OduPNjxsDpHgEjA1WrBwBOLrHcFwgoc6
         0r0OSsBaW8goPuNi5+gJe6PgUEyd/tBSQRtC7iUR+YgaTp9iLiZxkUJUsrCcPZ0AbJU5
         kKn1HsH2VzMPDRpFg7ZSnicvbK6vdhoUUIHitf3Rt/fsP+6I713HymPSKM8VdBaild+y
         uSSbulC7kdMTS+tJHE7BKoAS6Y7ehcJ6tbxV/hPttGHRApR4Xo2L9KKAFU1CCDlvDq/q
         rmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673604; x=1795278404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNFTF7NV7Q//dPvrSTZY3AgficwQjRGJt0rjTizoF/Y=;
        b=U+pkxNnLpUx4SWxXQSH2PBxsAgpgkCKKUsoPo/VIreci4/PGeOFBz2T08I9xJB+usp
         TVX8jMOQe/rHmClis5SlzZoapqOkTlU1T8y8Eadr5EDjluNIj+R8B8hcSeKGSpwnpl69
         eeVUj5wa/IiQ7BDrVGt18uRXQbsdvydez/D0bvI18rCioOL8OURXsn5UYVu3q+lykIpu
         sWVrAwgd5j60ryl6MgIwVxZqEx/el/wSMYAZ3mnUaoTNHAHTL091RjoHKdblG4O2na5b
         kDAqhtyPqrz0GOTeYBePSRB6il9fXBG0Mamw2jZqL9CHWgWnPNvQLCNSHnBr/4SJTlpa
         2abA==
X-Forwarded-Encrypted: i=1; AL+hErHlPni9zKi/PMm7B4Ru2osRYeDpWSxfcSQ2vQVFYORvLiuplKwsNJhzE9B4QOGxmbBBmTNN+4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kfIr4ISMe16T6YdB/dEhfu/GEY9UIk55yFl60zTEOUKtS0OvQ
	Z2lK5oy4Ewy0/4Cae0NRRvhsfPTSxYI8zObyOphhZDoc/sZjtUv3bnY8
X-Gm-Gg: AYBFou0iIPRag9pIQxlvCxNVIarGFofjra79eE764yachiNQ8ViWEDa5Xry/BSJg2aQ
	uLWQU15BS3tD8Q+ALIOFKNLgK6SdOCHQ/6rcxm6ZMda2Al3suY7GON8TLQSA39uHA4q4YuUmWU8
	h2mGMi7VhuL/IBfwawQeUM0ckBmiTEBMA3gt9BrNuYUNahzvzYc8g06h4QuQRWVOqcGujWdWbJX
	zYv7us5k0Qc+2/1SYO0O9UBooCa0Gp1/B5HC9c7GBZwpmKQDHBxMmL6ADgWM9Pv/nAQjfuoAZs9
	ycVCzt4F1yOC+Ra+C8Fs4YOM7nPm1C6US39MIqN1RJvO1CGsSSu7xPhxIZSID0SbXXgTe/69NDW
	teqtUnEtF14p8NLS0HOiftJYo7xPynMIX7SrDBXDqnpNWY+LrJWyd27Jm1U4KyjCNMl+rNxLVgS
	NJ3J5hl/puWKut+Le+MZUcMZBl7WFdBhpxiq8MTtJfIKg74vYx2DgZoCJr7wX3lvj6eZQjMCZFF
	6JdopwcF2ChbZhI1fpecxa8DMhpivc37Zh6dLxdRmk24GCCvPKVmFXZd18TcsaqRiOGWx4tUMJv
	F/itq65ZA4h60VF+cO1uEbe35tNgw/OflIZUItoVGBlirEQauxh1xx5HX1PIE4zLHrO1vBcWlDs
	G1w/SOOhd0qyYRPYDjbqadXa/28RoFLtG8YE3ur5a03tdw9awUcpuqTCUb8A5kIQOGaWC4HMKlG
	Ew3RaX7spo0vmYulNxvrxVmrTng/k9FixUf+8TRqoH
X-Received: by 2002:a17:90b:5107:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3b1b0cdafd9mr3966945a91.32.1794673604170;
        Sat, 14 Nov 2026 08:26:44 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm10229142a91.11.2026.11.14.08.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:26:43 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	rlmenge@gmail.com,
	egoriluk@gmail.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net v3 0/2] af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected()
Date: Sat, 14 Nov 2026 16:26:30 +0000
Message-ID: <20261114162632.16346-1-sidchintamaneni@gmail.com>
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

This series fixes a u->scm_stat.nr_fds accounting leak in
unix_dgram_disconnected() when purging queued skbs from
sk->sk_receive_queue on disconnect, along with a selftest:

- Patch 1 splices sk->sk_receive_queue onto a local list in
  unix_dgram_disconnected() and calls scm_stat_del() before freeing each
  purged skb.
- Patch 2 adds dgram_disconnect_fdinfo to scm_rights.c verifying scm_fds
  in /proc/self/fdinfo/<fd> across connect(AF_UNSPEC) and dead-peer
  send() disconnects.

Changes in v3:
- Drop unnecessary count_sockets() and sleep(1) calls in
  TEST(dgram_disconnect_fdinfo).
- Link to v2: https://lore.kernel.org/all/20261111225148.88506-1-sidchintamaneni@gmail.com/

Changes in v2:
- Drop MSG_OOB patches and tests per Kuniyuki Iwashima.
- Splice sk->sk_receive_queue onto a local list under the queue lock
  before freeing skbs so concurrent senders cannot extend the drain loop.
- Make dgram_disconnect_fdinfo a standalone TEST() instead of running
  no-op fixture variants, and also test dead-peer send() disconnect.
- Link to v1: https://lore.kernel.org/all/20261106051905.218638-1-sidchintamaneni@gmail.com/

Siddharth Chintamaneni (2):
  af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
  selftest: af_unix: Test scm_fds on dgram disconnect.

 net/unix/af_unix.c                            | 59 +++++++++------
 .../selftests/net/af_unix/scm_rights.c        | 75 +++++++++++++++++++
 2 files changed, 110 insertions(+), 24 deletions(-)

-- 
2.43.0

