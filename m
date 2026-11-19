Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795060979;
	b=INb14yj0IoiXG9rLmChcoG68MSo8D2dpVv7WJwMea9D9Ho7jPiv7sTIf5UHnTVrHBhJZ
	 denhd0gbeKZHLlXfUJ4nUrZPoMHUipQWWeJTTB+Ym6K6kYQ2/g9mL1CSTHd4ycbpE9V5b
	 8qK0bvi5kqGiZS9YDkK2ukXwnclSiv0HDwxAuYzNIo2wCi2O9p4+gUpvVBc/7w5xf2V22
	 KITbW/XfsDXOBM+U9diTiLOGg/xhD0AjjV+w3MvdZWCRk8ZpitMQMrMMm+Jc+wNchX6Wa
	 wf69OOqKp7sXGr8+6rjoR9VbR9bpw7qbWKd5GRM0BAs1Jq3BjABq3Kg0iWfTZceVzug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795060979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8YRFM8U63OEdRvVjTw8RvG7PNWf4otoP5rtHsWUr5Dc=;
	b=pTfl6cxqJc0IeN4miEN6YsOsM6w/VaYluYVsAXeeY21shhmqntB46VMOz7y24J3Z2vEp
	 WTpRw2aMVSoOyHBFN9gIVrh60Jnf72Na1H/oN0gIBpkBlX67j2v/9G6xo+WU0UWE97Gpb
	 yQRUTtnqBTM4jgUkqGyi+UrOsxRnRi84nMzE77yvPrrIqbTxYHs6E7a81sCGaxb9dJG4f
	 Urvzi9nMQYj7PbZKQuXYQ6m3YhtLwSF/iJHkkvRdDDdpMtX/B4zYDkR46PhB1/xeTe9hS
	 Tspli794Kvp5bTrd7D2K4uHBiWK58Fc3HzwvVZ4Zg32LaSS3tlIR1MBs8vjbtv/bdaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=octane.security;
	spf=pass smtp.mailfrom=octane.security;
	dkim=pass header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=G0Mgriqr;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A518606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A518606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=octane.security
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=octane.security
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=octane.security header.i=@octane.security header.a=rsa-sha256 header.s=google header.b=G0Mgriqr
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso680537a91.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=octane.security; s=google; t=1795060979; x=1795665779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YRFM8U63OEdRvVjTw8RvG7PNWf4otoP5rtHsWUr5Dc=;
        b=G0MgriqrHVRZB+ZQGau91wta6srIhiIyZ0+YjoxiJ3oA88zSmez44lwFUn+JdbxLgm
         s2+LZd+4v14FoGyqYRoVUU6a0E42s0RcU64/224NSxtH0mU2Dne2yaDRIueU7L6Q1QeY
         Smu0Pb2VCnqQLf9GzoJWYOpCjdKESpPqJecVA+VJNIcZv5TN2inS/b2cHKfHws1yww26
         oPtdVHF6dbO9mHegFMX8Waub/JxCbCvcH/WvqKBK2IaTvRYi+wqh4W75hzOhiCSYbqQB
         Q7ZpHWZMId18kIRbkN2yc/73WQYUkDBrUsTK9P8K/Yr6KBRmXMzU/cDN0C8bJyrlzZTw
         0vQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795060979; x=1795665779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YRFM8U63OEdRvVjTw8RvG7PNWf4otoP5rtHsWUr5Dc=;
        b=yiDLnGde/QSCJU5CdI6uRlDLtVZxBZb0C5fgNXPoIe+BtBzp6eUIM1VWufdTADt+yc
         vK4JKf6XTYtZgvsriuuuWAt97go/g9uWjIL8ligl2oO8pZN2H1Zw9t8EhtUlmTE1ppMR
         l5WRNdAuchrtjBtygkBbhBATWIXOn3JxeqDaRAG1WvQQM7YY9uhgvOBMdzfmm6co2M9I
         SfLWCvTb2oE1OraiBGrc6/3G3Ngt7CX8kwMGFIsC7cfYSFSnuH4O5UMDweIVWR7OyrvQ
         W9S8WrZwn9xBtG0jTWLj50q56k4yneKifad5nkseC1KZ1qTpN4lxtyuKBX6ypkxqf9Po
         PQ3g==
X-Gm-Message-State: APuU4Z8fYiTwe+VW5x85fjYD9ELBWuyAJIxIB4ScypLIA03GA5F11tQd
	zA4VppQY9F87oAta3pvoo3m+Fgo3BZDamFLenAjGGHhxLWo651YioyaMndsLnYC/XauZj9vjB/T
	zn6iz
X-Gm-Gg: AZFdTZfjy8dnR24IA5M2Jx9zFBhijUpIxooR9teRqUYuhiQvp0cQTtWrJRwRELL1x1T
	GiBHwpbB/Mxxgg10c04km7kN5DYAfP7CZHUD3jvTlXtZiI4RuuNsNuyxDHEMzLuOAvFHMdutaHJ
	IJQ0cGU5UjMUvlL5crNjzL0DFpGJZlV8D637jvm9bUkVsxLGIRI/kCP02lm6AiuCe3Tft41CB8X
	FoPmBDg8PORMF+sd3WBpypYmy8cKWOWnvtSvD/zgW/ko7zt9yyeJRJPll5lBOIGeCO7eRjk0RTR
	+KKsukhUl5KLUG34ZwNHlc2ZModaSuORSJ3iEzuaPDOzfd8kLLnvmlEGgUXlMeluH+QXWasxupy
	s/C1JdeU8SH/VQAUyVRZppB+2ywkPCW+BAn0NkZvbjs3m39Q2sNP0xP3HMq6QDsll2lfr8Vu2DZ
	olKAjXGgP2lSRVpb6YurVfUY9lZOZU737psYBpIWfI/+drE6qYaa7WPyiMDQB4P64mWaUtK7uDL
	X3J+rmAJ37AwZd0uNgwmRjDNeUFwD+BddTc1QNXZAt7d7+dIFz/aBD71UUMB2NGuzJcC1LKTc+M
	+P4H6sfsAipU4jNqIKAfELnd7QY3lm35Qi7+cVLEShizy5vCJ+qvQ0JfSD2yXrVcRJwPn3S1waQ
	qXvvZqDOY3KTpi0fAKd86qLiCj8T7MvQ+vtRXtVGYYZLHm7d89T6/91ChgF99ZaNdjt5fJbpf
X-Received: by 2002:a17:90a:d60f:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b3d063e959mr4513245a91.1.1795060978401;
        Wed, 18 Nov 2026 20:02:58 -0800 (PST)
Received: from localhost.localdomain ([103.207.175.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4057af4e2sm406863a91.7.2026.11.18.20.02.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 20:02:58 -0800 (PST)
From: Shubham Antil <shubham@octane.security>
To: netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	david@ixit.cz,
	horms@kernel.org,
	gio@octane.security
Subject: [PATCH net v8 0/4] nfc: order NCI UART and firmware teardown
Date: Thu, 19 Nov 2026 09:32:49 +0530
Message-ID: <20261119040253.15986-1-shubham@octane.security>
X-Mailer: git-send-email 2.54.0
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

Make NCI UART driver selection, callback shutdown, close-time command
handling, and Marvell firmware completion explicit and ordered.

Patch 1 serializes NCIUARTSETDRIVER and protects the driver registry while
a transport takes its module reference.  Patch 2 rejects a second firmware
request without disturbing the active core state.  Patch 3 orders UART
publication and shutdown, preserves close-time reset and driver commands,
and bounds transport draining.  Patch 4 stops firmware timer, receive, and
command producers before their queues and private state are released.

Source auditing, patch development, review triage, and test planning were
assisted by OpenAI Codex, gpt-5.6-sol.  I reviewed and tested the resulting
changes and take responsibility for them under my Signed-off-by.

The final v8 code was tested with:

  - strict checkpatch and git diff checks for every patch;
  - targeted W=1 builds and current sparse checks;
  - full x86_64 bzImage and module builds with KASAN, UBSAN, lockdep, and
    DEBUG_LIST, and separately with strict-mode KCSAN;
  - 20 concurrent driver-selection cycles under each configuration;
  - 5 registration/publication and 5 reset-preserving lifecycle cycles
    under each configuration; and
  - 100 firmware teardown cycles and five timer-boundary modes under each
    configuration.

All test assertions completed with zero failures.  Neither sanitizer run
reported a memory, concurrency, locking, or undefined-behavior diagnostic.
Current sparse reported only two pre-existing warnings outside the changed
logic.  The st-nci close path was also built and checked separately because
it sends a final proprietary command from its close callback.

No in-tree selftest covers these NCI UART and nfcmrvl firmware paths.  No
physical Marvell controller was available for testing.

Changes since v7:

  - keep asynchronous core completion lockless to avoid an inverse lock
    order with driver-private locks;
  - serialize transmit wakeups and retain partial frames across worker
    restarts;
  - publish Marvell transport state before NCI registration while keeping
    receive admission closed until core queues are ready;
  - close command admission and drain response work before cancellation;
  - preserve the close-time reset and a driver's final close command, then
    cancel any command left by an interrupted synchronous request;
  - actively retry partial UART writes during the bounded close flush and
    poison a line-discipline instance whose framing cannot be preserved;
  - stop firmware receive, timeout, and command dependencies before core
    workqueue teardown; and
  - document lifecycle sleep, locking, lifetime, and queue-ownership
    contracts and refresh validation on the final tree.

v7: https://lore.kernel.org/netdev/20261104062026.80599-1-shubham@octane.security/

Shubham Antil (4):
  nfc: nci: uart: serialize driver selection
  nfc: reject overlapping firmware downloads
  nfc: nci: uart: quiesce callbacks during teardown
  nfc: nfcmrvl: stop firmware work before unregistering

 drivers/nfc/nfcmrvl/fw_dnld.c | 237 ++++++++++++-----
 drivers/nfc/nfcmrvl/fw_dnld.h |  11 +
 drivers/nfc/nfcmrvl/main.c    |  52 +++-
 drivers/nfc/nfcmrvl/nfcmrvl.h |   4 +
 drivers/nfc/nfcmrvl/uart.c    |  64 ++++-
 include/net/nfc/nci_core.h    |  29 +++
 net/nfc/core.c                |  20 +-
 net/nfc/nci/core.c            |  82 ++++--
 net/nfc/nci/rsp.c             |   3 +
 net/nfc/nci/uart.c            | 467 +++++++++++++++++++++++++++++-----
 10 files changed, 805 insertions(+), 164 deletions(-)


base-commit: 30c71476d842b094651bd7712f6c8ee8716147d0
-- 
2.54.0

