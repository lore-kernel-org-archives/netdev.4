Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952459;
	b=prUqxhWnSD7jasFulun6WdM/dHWsSWY2qb0waJRlZZt7vrspew7zkvyNMY+n6VwBltrU
	 A6VJemxqQTHkNL98NEKyqT61TLd8OM0KtadPaTuzgDuBsbXvS5KP7CVqw+ZkSkEpKFZ6B
	 XhNvKWD3CXz9p1S456PBZwLNXba49QJhDRwCxIEa0AKIJ5SsMXhYhChTu7f39JP1xulhn
	 swzBZ8mGFiyVTkNEH9eVz/VrEzhOkf4T8YW68YligBPWLae26MjqKbpOSb+JDeI41IxIv
	 CIRdOziN52f6Y4FYUYrGuNsXku5FOCljoXQL1RdIAD1TV4a48t19mPx9wobTNgfuLJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mSxWhkQPDXZUZ5MzBjnf+7mzxwbUlfK/0JIZolwooU0=;
	b=amTX71/RSN0RtI6pvOF7GWK29hwIvbp2Frc83vfEjJsDOHXCfpS62nxfPB36AWJ9Pw+S
	 2Jw2J4paMY8viBXMvC/t86OXBhhj0m9kevht2yDGf4LApuawnzqrsEVvjsad/AdsKycn/
	 ryYZq58uQzcojzSII09SEhTj+tl02YXiZS2yw+KdoWX8rq42IlU8HLEf7iim+nEFQGaca
	 qH2gBStEDym/w4d+r5iVnOSvSkbhwyJTmk2t484P6TURGTaq6XZABdb7VtMJMem4XF/kw
	 QvnZk0XU9qZM6QgrXvV2M5qoN76HSyUF4KMmUDIaax9+HNKFccii9W+xpEX6g+W2hcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gO9DMV7O;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A25D606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A25D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gO9DMV7O
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cddee4abc57so94351a12.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952458; x=1795557258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mSxWhkQPDXZUZ5MzBjnf+7mzxwbUlfK/0JIZolwooU0=;
        b=gO9DMV7OAT40Q43P8iIj6JyFwfw/ZRNM4IY2Da43leKDchgYPQ7EgQYt9jRjfrPfbH
         qdaE+DJdaX1+y6K4ZI17w4kGdaleplGWZwXL6J4mz38LV5piuhtuxYPTsZg6YDu1q1rg
         wiG1ZwQFQaT/48DOJOOA9ekz8nl+vy20pihC34pRJGIgKOKdiYdXXy6NSnkzL/5ZtiJr
         8C0bDMqzZp4fWFGruc+e5E+1Wss8BQ4BikkSCRGi8zgFWWLAzhWUwCA/qMuWiA30l57u
         5rgrdYICzddUJZ2dDkULgrNJCEEvG5XdgBKZfA1hTXAq+ukS+Bc2iLvNzUKzqHP1HKLK
         uovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952458; x=1795557258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSxWhkQPDXZUZ5MzBjnf+7mzxwbUlfK/0JIZolwooU0=;
        b=PHZVr1I4qbJRB0Lx3b7zpxXScS+fs0hV6JkWu0HF0kapSyqgtXFivyohm8xEpeZbjs
         VLkombvdhPYsFSp+WpFIcEyfX9BXezb2pNKk4jsfRB06SgfxlKkdCpqxPaIQX1lz3qW8
         3WTZQJTu401eLNYB8lYWq3DYmeR7Vjdj/ueArf60ttWVQt/Awy0P0JCRi2HSaIjlvwEj
         sqOWCQ4oc5J9ZYD1z22kKvj+P0ONAM6v46Wyd5OO6k6034/ioDbplhuNrX7Qxo9vvyTt
         uC7iSUMRgdYnBOiTu3qUndPNZyH9dkUZkMRHlpKkslMFXN+VFU9gcW4Co2ioRwumuglP
         1Opg==
X-Forwarded-Encrypted: i=1; AL+hErH/MMXS+afC0cVJMPpp/NCtg0V6hTwK/DnkMmq4hFkLzVDbKpODRPveeBo4U3MrVN/4g83N6sA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j4yRV7vwQGrPFsYb+8Csp/wJafnKRmL47VmjxxeTuLjK5LrRe
	AXFc12SDd6cOBqcDG8EPefl3fL1U5krY5RKRGPL7zB9KcO7+HfAH9/9L
X-Gm-Gg: AZFdTZdxsHxm+Y+OgyRW4+4cbdhmXX/I8HRntREsgI2dbs1vJi3/QaA6VgoZdDZwj9l
	FMdHIwRNNhPwfLFYr86L0Iu5/d0KzlMnw4EpENDUmC8/ioeVC4CMdm7ExvEA4fUBfQErGyGA3F4
	syKj7KDaUwOJHEBo5kNU8rFHI6w9Db3yUVzXeeRe0igDlhJ3kqWZTHUOAOGcivelSUL8b5nTnJ1
	LU1UDNmI30TyOZ7B1AJChdvSLa5U4LsU6lNr3KfIRXLyanO01mifU9XzUGaNF8CrzfKj01gtiVV
	QyhL/IXxNOdkHQGjw7nfmOy4OseASkFAW5D+/tg0usKmrh1JWk12w4CI/AKjBMokRXbVFnOJZow
	86Ugr/dt+16drv1Le02x2y32wtiyB2ysxSWhQFSwL1x/yjYwosxHpJMZOm1o9Emqe5BXKo3aC+n
	2mGbwnZiR1N1b2jzsFm/pgGrqmpemBI3k+L3rfKSkf/1YUVmnV4VqjSLuizMEzMPcLgGKdBv/Ut
	ozzPEGkw7RBd4UIzYtlpkvzIWcKUA2bn3MSw5N9GdW+ymkBoNiNJc6sLnyAF54hgAUyx/7t32UN
	V5Ck5+72p6a/JCn321EM8BEdDa9Z/4zi7W4=
X-Received: by 2002:a17:90b:268c:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3b3d0761a7fmr712478a91.30.1794952458419;
        Tue, 17 Nov 2026 13:54:18 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:51::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187df25sm732970a91.3.2026.11.17.13.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:54:17 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Dimitri Daskalakis <daskald@meta.com>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net v2 0/5] eth: fbnic: miscellaneous driver fixes
Date: Tue, 17 Nov 2026 13:54:11 -0800
Message-ID: <20261117215416.1901246-1-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.1
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

From: Dimitri Daskalakis <daskald@meta.com>

AI identified several bugs while I was working on unrelated parts of the
driver. fbnic_queue_stop() always waits on queue 0 to idle for rx queues.
fbnic_get_ts_stats() dereferences a NULL pointer when the interface is down.
And fbnic_{set|reset}_netif_napi does not account for disabled rings.

All bugs were verified on HW, and a new stats selftest was added to identify
other drivers with the same timestamp stats mishandling.

v2:
 - Add .get_ts_stats() support to netdevsim
 - v1: https://lore.kernel.org/all/20261116202957.3601684-1-dimitri.daskalakis1@gmail.com/

Dimitri Daskalakis (5):
  eth: fbnic: wait on the correct queues in fbnic_queue_stop()
  eth: fbnic: skip disabled Tx rings when setting the queue NAPI
  eth: fbnic: skip freed Tx rings in fbnic_get_ts_stats()
  netdevsim: report fake timestamping stats
  selftests: drv-net: stats: query timestamping stats while down

 .../net/ethernet/meta/fbnic/fbnic_ethtool.c   |  3 +++
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c  | 20 ++++++++++++---
 drivers/net/netdevsim/ethtool.c               |  9 +++++++
 tools/testing/selftests/drivers/net/stats.py  | 25 ++++++++++++++++++-
 4 files changed, 52 insertions(+), 5 deletions(-)

-- 
2.52.1

