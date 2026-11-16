Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861000;
	b=1YVR8JurmPKwUftdGCXs0vZlz3Rd6CC/nL8DdvsUoDW9KijPb80G6nBUNjQ4V92y5dIZ
	 NX6s8r74W0mRomZoiJNnZ1hR7sOMFepeyCUxqRmi0Iu/PelleHEPUG1N437QwYnT1u2jj
	 3JTbu3J6Wy8ZAEJb+F3nk05xtj2b7xfuitlvUOX1M4iaV03YL5IIUEyPWakjCokQNawuN
	 JDbvSUhYMvCsjXMUrlNug/Sx3Ofrr8p7PnPTuLql8w8N3yhopNUOd5v4IbmpriJByuy2t
	 7rA7Nc2uwjRe6UHsSWCkjB+7OXzkaaoPYg52LMcelNAvYP+WqTRsTU0A8UnF6yVyBLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5ymH2hbnWcLK4sGiZmTBKpjSBNSdPqJwiGR1ZNq165g=;
	b=zHVbKVlS2QwtdqabVpIw0C7cjpWWGBvagL0Yn94fk2BtBWxKkeGKFNYZnE9mVr2UUefQ
	 0LimhknPEQZtZdU4i/+DyJOUrzVCVcFmDUYNIIeYVxAou3DVcTaf9If4BB0KjXONWF5RF
	 mAyKz4Xy4WaDnyrgy+VT/7v7D9RTaHthLxk7shvEBvYlXLasyhviprF3QO0zvf2W7DcBi
	 nRpD13rbCOD69TlMWasSVFXGKE3QO1R3DDC51OoazFyMm6CsVI5q3AnufbcZN5vmaNe3J
	 SVa5pP/xYox/x1iYxe5tFUAGbfqR+dXMW4cf3wQbUGEtXt+AlIxOHEP3bE11boDAduQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYkbWgr6;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7413606A329
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7413606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YYkbWgr6
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so2569921a91.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794860999; x=1795465799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ymH2hbnWcLK4sGiZmTBKpjSBNSdPqJwiGR1ZNq165g=;
        b=YYkbWgr6vve+WyRzlX9UgxTJ6VARGE2QyfnLgw9Vtbffqb9M4EHMpy8U0zEpljcRb6
         JVsC2JaajCHeHuclOKN5w7NlqgiwLiDtiMSJ6lw5zGGFWtXMXLBSt+5mYLzzw53fa7Pu
         DDyEbZl8Df9y/Iy/taDEYjeqf8Np+oMJa7nzZZ3BnyjH2PQ7VrsAuJvF9vUjUtLlsTjJ
         FsAJp4ZnSPXXfMvzq+3NfBPkHoW3x13S8+b+h1SqxaZmIoZpXpUZwuhnnwT+B+HFDNxI
         xtgfLmXURB/CpxNNxtw/l7JFWKXPqy3yVNYbuPJcxdVZlSeDcWNoPczaJqX58sUz4Aaq
         4BpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794860999; x=1795465799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ymH2hbnWcLK4sGiZmTBKpjSBNSdPqJwiGR1ZNq165g=;
        b=DdQkQ0K1YG84GSwfnQeYOQe+PkFivGV9Tv9vqLBSw/1eZvM+JwkduJcYLKPxSeAgib
         0Q0vVWD85EtfxC/CvjSlX21yIfI9Y1THdw48sBCQg38fqoC01wdCY3NXl1u1gCHJIXyl
         QBPaae9AX3Ihy91xBbbuCdSTsxgwh7Ax0qeDoiB1o03eTIL/FcAmUjtHzAYHqJqmcDvd
         o/d6Cw6J+SrU5dc32Ia2qD2lOo3c+P/SJp6xmA02T2gbUbOC5bAqEoj9yw0vA3ysP5qI
         gYwyuJ/OczPGNtYMmqdJK3yN0GoYuKGZXilos9nTx7dBtjMVgHAI2uMZJ9kPZzYAFt9u
         Vc8g==
X-Forwarded-Encrypted: i=1; AL+hErHbj/RBitP2wECtO+G5Pz4hEIM4Qu8sPz4bsrSdm1leoB7yqkU5UYj1bM99FRKdH5GHv2HQdRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RusOaoA7f4rBwMo79O4dqaCXebjgiN8t90Rwxm8uMficI98Pm
	bZWjP7oylEKaZbcXzggjeMF8PMOdZ+aqERqqEFd+JxBMNSIHg2PVwVz5
X-Gm-Gg: AZFdTZeDbgRN5zhksOxfo4el0vxbwq2ctI2U8bcGJn3nwaeIwoCd0Rf/yKi4erzuRfZ
	5kb4VnEWqIkU49lp5pdjIcxrvqqBHZbBXQ7UWK1J+vzyLmXHRVRNp8y+b/1cp8u4LaKMlFIoUtX
	jbOSXBSuNc7ShirplQsRPMRYz4qUhmZ1Ksb8t0IEobKKyh4v+45KloZsMBY+gd2Qt5oWY2u1ICa
	h5OgkI0+GUpyBUAE+f0yUY2PLcB/fTv+XuVowB6CIfHfsN+/vE4ETQ2X+h9omdNBxIgQ350Y14h
	4rRE6pFtkcqT8N6qArHap+XyBrn3t5X718EmMBIgaFln9MSGNxkYoJ6z3VdnrhQoqewio3A7blj
	8Zz8n/0BS528cOZI+ZRmJczxkSQV1wWmPXqI2gZeZiUbrGPJbXNZqMePEcMpoTQjqWaAvecqjy0
	JytYsLKPJuFLDwxNj/2Z0DFxuweLAbMylWK0u92f1n8ZIA/avK1bJzj5zPFVniGyTrDTmz1hcv2
	u/LyehlG90TzL9a5rKD7FLXscn/bv4BMarFEsOtfuoatJU+TZrPC+cFV/dDSHbL1xrrSsO99DDu
	bCg1Ypvv2kxOGvI1Qmj0nftMeAyQsS6++pi1tiXlMoT6j/Q54ZmHL8IQ
X-Received: by 2002:a17:90a:908a:b0:3b1:bee2:223d with SMTP id 98e67ed59e1d1-3b1bee22478mr6782075a91.53.1794860998806;
        Mon, 16 Nov 2026 12:29:58 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:50::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac29a846sm648554a91.9.2026.11.16.12.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:29:58 -0800 (PST)
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
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net 0/4] eth: fbnic: miscellaneous driver fixes
Date: Mon, 16 Nov 2026 12:29:53 -0800
Message-ID: <20261116202957.3601684-1-dimitri.daskalakis1@gmail.com>
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

Dimitri Daskalakis (4):
  eth: fbnic: wait on the correct queues in fbnic_queue_stop()
  eth: fbnic: skip disabled Tx rings when setting the queue NAPI
  eth: fbnic: skip freed Tx rings in fbnic_get_ts_stats()
  selftests: drv-net: stats: query timestamping stats while down

 .../net/ethernet/meta/fbnic/fbnic_ethtool.c   |  3 +++
 drivers/net/ethernet/meta/fbnic/fbnic_txrx.c  | 20 ++++++++++++---
 tools/testing/selftests/drivers/net/stats.py  | 25 ++++++++++++++++++-
 3 files changed, 43 insertions(+), 5 deletions(-)

-- 
2.52.1

