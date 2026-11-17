Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913510;
	b=M4200u6H4+bt3CZbH3DOlDG/ZjeBVPOKUQ4QRpssIfprIR0dkb7286z7RwCutefMEUaF
	 Ml4xmgO/2T0rbwuPtvVaCgEWM0OU2bB4y7zyUKbng01a+8lK0vQFXT1mvGJcp2gYgxWgE
	 fiAEtjhr7r3bQHN/IAZRbRbQSZ1rJ731yIXHDgxwITAZF1GluUXRq5MbDTVReYWMU3oR2
	 kPuIBKvRvjWgWM2+w2PYOpkUj8q/zzhlF5LsXoUQhtLfUKG2OGD49aQO2TnGWtp6cUrg0
	 X6X5V50OG/OvFHLemsTjLmVd1kuqzjOtKerS5XsxLqEmafhDd52Gl1O8cbZc+QeG/CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=APyRDGNpX/sOhc1G62vzvyzvnEtlXJLA4HeAQhpE9p8=;
	b=OzBTaC4i2yFJ4N77BsY7uDkHY4vO/C8avti+P1Kzgbs6Agr7WGkiCXJTfc8JOaivPquK
	 D7yJ0lP4PMDOOCe6zUn8Xaz/b6NY3g1lSIKxrTv1KgjllnmM3hJMbQPvmwda+MOIBa5m3
	 0K2l3Lwhg3+F1Br1cqrJnFarFEfes7TSdKD8Q36/tVSqFWdbHkNRzVXNKvH/KxVFibB2l
	 Esd2DUOHDH72UrlGnWfwBCF1AGw1ATS6DkVzk6uKp24JfmFhzPhhdbqCRQsKu2MBgZRDN
	 +aNffDiHLOuvTZZs+QLvbPKM3WH2EP2if8OKf2b87WVSpmt1MFmc3XKY4xUKFJ0CcjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qyz7ht9t;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040E3606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 040E3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qyz7ht9t
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2efd824d492so4583075ad.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 03:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913509; x=1795518309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=APyRDGNpX/sOhc1G62vzvyzvnEtlXJLA4HeAQhpE9p8=;
        b=qyz7ht9t1Yr/kkTxUvTrvKjQmhfUVmM3Npvv2fDSDEHea4DimUkYStpl8EIxByS3sX
         iw2+XR+u5YS5o8ISS3TdRXoogjcXqv3pwO1rhrT2fLHEkcewe23LZMPKmqTeNbrnN7eO
         9TyzzvmZUu2BNgcQPELIGJtRWYP8r/CBNm1Mal/5QaEJq9bl3TRTwbDq12hHAyIBGiEd
         m4sO3CXjpfwpjxWnF/iXgn53LIfRV3i73ZJDZg3BP801DAHxcdqyg1R3vNK+pqg7PuHu
         M3LnZH3inAsfLqKmz64Dy4y5m6EHdIdzh4fRVemJsN2nR22ALuy6wyXjgd6gKrZvKBGK
         VR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913509; x=1795518309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APyRDGNpX/sOhc1G62vzvyzvnEtlXJLA4HeAQhpE9p8=;
        b=fEtXtdE2csgDpmkpYy980npAxxhp7dqr+nKMtYAJyY6RBIo4MBy6R+qwhPulwlhjpM
         Du+RCD3Lt+PeohmmMcKF234z80f/94aRRyxtC8lMamKHK9NvGh0tX3rKI1GCsz2Kwyiz
         OJTRjKR7tQgL3YGJJiq5VXhoO5cVsZw4io3f9ZlZQO4iKTGzQV/4ioItNY78i67V5ySq
         YXRQuvrkycctxn9NhlUDqeJjtRO2EMbNo5yVa1SLO5a7C/4Rpx0z/TG5yVp3V1dhTzuG
         okdidzSHPB77WOH+vMlX6bqd6NBAp6PvQGsGh0tZtQJZnEgZANY+tPqzrkbEv30JhHuc
         Zrkw==
X-Forwarded-Encrypted: i=1; AL+hErF64wq9k4gAAzR8MKnNNk7+pYKD7pBKJ50R/4L2genbdlFOhgXjf5qSN7Mbw6AdhhVkN8GV9cw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sS4w3lVd+L75BRhtvmt8wzqBF65ZbWzf2dBYNixwylz/qa+uB
	C7Ifwd+BB1fZQj2W6pPn8pJzigRFa22EKMGTQmQs9TOF7PO/B7GcqmEq
X-Gm-Gg: AZFdTZdJt58YTXBBFdVO3A5JO/Gl4vDdE22A+Nuj2WPa94nn+snlq0L7ME5jM746vOF
	6SLxkxcP80myBU9FBsT7thCI9Dc/zYSw+el2rhjhVRhzx+eQIPZv+IvBn+8HrDGAKDLN4UAFxEK
	/eRMMDkWB1M+wHRjXA6pS6TtKCdg2+f5YF4oTgutAdUZgmjyUxFXqr7AOCVh/7d3aQ/MCBf2FXB
	D08hvpvYHVnY0Q82mTZbZ3kTiOptTDwYj1VRO7XEl/FZvZoVSgOA4CiS00Sbzo6AhKCYYKfwT2p
	1a79FGd3tFI/gU5VUTgzDUQkxwXsQRS+GuScFLZhgmlo2DC9BzPOz5JLmXIKDR9KbibDoEYnhXx
	lYkH5B52UL/NVUFIi9rWafXNfydc9thv6sJyOpNPR3DFP6ITSyV4Jdl5xWiydsd8ejY2uiItzZU
	tbhNoH+XyAdDfx0STcUF83TvbQIlWqSTBJyMqALCpQQDkxrOTjEbV7zM/N45U54AZ6kNCxFGliE
	kvpzCMcXmyUSfuGC45LlOgQszRGcp4p+iZ/UteCZFUyBySBn1fuE5pvoxTaWQIUBIwb8HgOVQgv
	OB/EWumW4ZbNRHJkC4JIuLxH/FvJgnI34P8GyofMzwPPNzqmdQ27b7hekivQr9nRU78CNWHb9yG
	JjkBTcnT5vHVNxA==
X-Received: by 2002:a17:90a:e710:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3b1b0a428b8mr11460826a91.27.1794913509232;
        Tue, 17 Nov 2026 03:05:09 -0800 (PST)
Received: from JUNVYYANG-MC1.tencent.com ([43.132.141.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1898afbsm5633083a12.19.2026.11.17.03.05.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 03:05:08 -0800 (PST)
From: Jun Yang <juny24602@gmail.com>
To: lucien.xin@gmail.com,
	marcelo.leitner@gmail.com
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	junvyyang@tencent.com,
	corvus@tencent.com,
	stable@kernel.org,
	Jun Yang <juny24602@gmail.com>
Subject: [PATCH net v2] sctp: preserve stream scheduler across outq teardown
Date: Tue, 17 Nov 2026 19:04:49 +0800
Message-ID: <20261117110459.44083-1-juny24602@gmail.com>
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

From: Jun Yang <junvyyang@tencent.com>

sctp_outq_init() clears the installed scheduler when it reinitializes
an outqueue after teardown. The streams still have scheduler-specific
state that the old scheduler needs to release if the scheduler changes.

Initialize the queue counters and flags individually so that
sctp_sched_set_sched() can use the installed scheduler. A new
association is zero-allocated and starts with the socket's default
scheduler as before.

When the socket default matches the installed scheduler, streams retain
their PRIO priorities and WFQ weights. FC and WFQ also retain fc_length,
including bytes charged for purged chunks. Those chunks were queued on
the stream and the accounting converges as new data flows.

Fixes: 5bbbbe32a431 ("sctp: introduce stream scheduler foundations")
Cc: stable@kernel.org
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Link: https://lore.kernel.org/r/20261104105507.62743-1-juny24602@gmail.com
Signed-off-by: Jun Yang <junvyyang@tencent.com>
---
v2:
  - Initialize the five queue counters and flags individually, as Xin
    Long suggested.
  - Document the per-stream settings and fc_length accounting retained
    when the scheduler stays the same.
v1: https://lore.kernel.org/netdev/20261104105507.62743-1-juny24602@gmail.com/

 net/sctp/outqueue.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/sctp/outqueue.c b/net/sctp/outqueue.c
index e92fb9da4647..3dafa6e6cab3 100644
--- a/net/sctp/outqueue.c
+++ b/net/sctp/outqueue.c
@@ -190,9 +190,12 @@ static inline int sctp_cacc_skip(struct sctp_transport *primary,
  */
 void sctp_outq_init(struct sctp_association *asoc, struct sctp_outq *q)
 {
-	memset(q, 0, sizeof(struct sctp_outq));
-
 	q->asoc = asoc;
+	q->out_qlen = 0;
+	q->error = 0;
+	q->outstanding_bytes = 0;
+	q->fast_rtx = 0;
+	q->cork = 0;
 	INIT_LIST_HEAD(&q->out_chunk_list);
 	INIT_LIST_HEAD(&q->control_chunk_list);
 	INIT_LIST_HEAD(&q->retransmit);

base-commit: a2239d5dbbda3a61b6323df8836f605921a29f7f

