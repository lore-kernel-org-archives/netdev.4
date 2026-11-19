Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085603;
	b=WCsHrjWuazELohdC7tOIpV4imIenB/WWnn4svJBK/Ug7iKn2VwcvLZ1QYHsOMBRB8Cec
	 5K9e/v+b3zxFhHsNG4li7AdWWJvGvshOstVV8940A2xeQvJysedQMzighPHZImUC0R9zF
	 jCLupXKK1KJtzMY03gaQ4SEcNiBWXIEsQIlqfHg1BhMK6GlWTrD3SUtoCdqjrTQCiu31B
	 pgJ8qRZYu/ZoeWVhM99B34IoanAOH8N6vzBLGF9Z8icYVmgJlK9IyPzmQISem/uK8DjV4
	 48b84k6m8tT3PicrF+qpNib2rXSbDao/MPSHhxDIFiSk6Hdh+2uKag2qaUFoHxQs/9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=u82m5XYfOkixN+Gu4sy3x8jwpD0ueQ6BxZtFc7iLOis=;
	b=GPe0QsFfLWERyfeFng6353cLIwDt8CVeCKWPzfRJnR+JEH8Fx7xrU0evZiiB8JNTBdZJ
	 UgLx7O8mjRU5LmH2ByJ8CzZCS/NsXxnNOGsIHSfan/TX2Vv3fHNQzhlQP5edZbIHpqtFC
	 32wNxTOwuC0Szay/j7cCi/rGmdw4uOH+6KqxSQcOANNJbJ3Gj2HzB1DbTbBkpKQCyUwGk
	 3YY0eTQtzrIYVwRINzvKDLynT7O2y2hdfygVvzAFtTYlZaJhtkvpH1UWLoyEODTgQua0m
	 YmHa2n6QoxwamnRKLncHeunLdkC0i6UYwSyr9kdsbAhWe36Cf6cFojUKFETvIDpf2hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iQ6rUIIV;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21002606A331
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21002606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iQ6rUIIV
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cde5a7d7849so185138a12.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795085602; x=1795690402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u82m5XYfOkixN+Gu4sy3x8jwpD0ueQ6BxZtFc7iLOis=;
        b=iQ6rUIIV7M0UsUNIRA6NKN+GN+fSa8/ME/likVRUE5Bdb5g7Llp4kUXaNoFBFNOhBu
         F4l18R77EQ4LI3ORH9xbQFWnh3o6HuJKmiN0ciN6PEOTrv1IRf18GHrX2bRj/lKoek7t
         hmNB/zpCbM49xuUBktNQrmcoJ5zqomNzHzsqXTLF2iBDCAP6nsSVdeGU7R0jmF2GSPhS
         dA9NJl+y+nu6Ad8KkMo+5eCE9mSYpFxcvJTBEnQ55zbs6Y9UuJrshRrWTCo1cQhOwY1E
         z5WVZg6ZJLHx7WbdXSp0e5YnIwhwyAwlkQO8deuDe0o32wdEcvaysTjliRP98bQgfJOf
         4VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085602; x=1795690402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u82m5XYfOkixN+Gu4sy3x8jwpD0ueQ6BxZtFc7iLOis=;
        b=AEB4e7tMDkp31nGwUkxJdp4sNQPfnryeG3ewB9Z3GBlmzFjEEZg1uYBc8jLwButxfx
         wKdmp1CiePyElpZ+r/ezyfUaVUfVgB4Fs+5/0gFrtr2wg0cRYkxZ2XrB4YTopgV/iWyd
         6NxZhEuDTKe2mTOUJNUc1vUpHXfCPJRw2/DdrZ09c1JpcxIsU+0TIwVyrIzKwkHXF4Ji
         IB4Yumpbjd80LsiLvUZqpG3GWEUjFFlEN/PRdmXzUzjHtOa+epAJ5ga5U94Ogx0z/THw
         ST0T7EJoie9rKtTfDaecdK2fLB9TE3VL0yMQ8pH0qUap9/I0B/mIWm4YAlYOLaOWYLlJ
         s+4w==
X-Forwarded-Encrypted: i=1; AL+hErFvcm4Puj+gpFeV5JjMkZMSs8tbQWTHdvTZ9v9xmxle6LSiBCWBk8+lbN+ROIEjiFF371t/jP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cSxOQRbK59DYHRazOju3iwGqaxshejWpLEGiofdnO6k+S/RkQ
	MgDnKCJUZw8IN25PfK7hmJ7MeEkTs/An5k9IVu02CFY9rBhc8Ymm0nHgmkQNjrdcsQ8=
X-Gm-Gg: AZFdTZdiGouEMRaPIqazU7Dsd4KoLdT92hpXOtmxzu5S/pxbmByTAr3/voCyeMkZYc7
	xo6wfHhoJf/ruusPJT5JlW0JgWMRYICwQub7k1yS2cI32DO+1Bl272lScE70XO0C9+pAVQE5k1p
	9uZ/hnB8Ry3PK7DMeqMu4tv8QLceTaMoZK6Xb4T0p1xDwOijoEQRNqGRhiG/vJkR0djAIkbypL5
	Th1uaqvPvEoJpP20WBUPWRhzJY8eEC448XvHO69U//Ws5xH/4gve9Y5NQOk23G2OZgA5VDZApNq
	zka/euKj0bY+BsFK/p2u2Md3jjCIsmhLGnQhMfZSQnA70jTh02B+vheKEg18ssqaPtUt1vrQoJY
	ywXDwbDNiier4tgVkshCW6ISzcJHIM+gPWe118RAifL94bGI/qTtF44q480eS80ekMrBg7sr8j8
	opxwUOpsrUlIkJ2NYKjLeDaP+XpVnEfWsWTto3vpC58wEF/ziSQ02EL81sGuTD2bllEJDdriwyL
	e7ZACtuzs4LMn5Tko59GCw+Um87pOVCDwqX4EBmb6dayxN8aS+2xwpY/7lSqlHruO18aDBkATNM
	eDqsMHnGenHcG9PUXb/XoUgK8efKN956CkO/RP0vLSzVUf6Ku57u/0JcH5BBtsUOXatXs3vF554
	TnBKb9jtoRg1EoSseYLmf4oVb02iVf7prtcwbQA==
X-Received: by 2002:a17:90b:4fc6:b0:3ac:7e3a:1033 with SMTP id 98e67ed59e1d1-3b3d07d9ff7mr5928287a91.59.1795085602395;
        Thu, 19 Nov 2026 02:53:22 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm2246604a91.10.2026.11.19.02.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:53:21 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: alibuda@linux.alibaba.com,
	dust.li@linux.alibaba.com,
	sidraya@linux.ibm.com,
	mjambigi@linux.ibm.com
Cc: tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com,
	guangguan.wang@linux.alibaba.com,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v7 2/3] net/smc: bound the peer rkey counts in SMC-Rv2 LLC messages
Date: Thu, 19 Nov 2026 19:53:08 +0900
Message-ID: <20261119105308.2567241-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820023347.9D5461F00A3D@smtp.kernel.org>
References: <20260819023306.644849-1-yhlee@isslab.korea.ac.kr> <20260819023306.644849-3-yhlee@isslab.korea.ac.kr> <20260820023347.9D5461F00A3D@smtp.kernel.org>
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

Three of the points above are about code this series did not add.  Where
they stand on current mainline:

- The memcpy() into lgr->wr_rx_buf_v2 is gone.  3/3 made
  smc_llc_rmt_delete_rkey() read the queue entry instead, and nothing on
  the CPU writes to that buffer any more.

- The v2 spillover buffer is still shared by every receive WR of the
  link group.  3/3 narrowed the window to the copy in
  smc_llc_rx_handler(), but if two LLC messages with extensions arrive
  before the receive tasklet runs, the first one's tail can already be
  overwritten by the second when it is copied.  The result is the wrong
  rkeys being processed for the same peer; the copy stays inside the
  8 KiB buffer.  Closing it needs a spillover buffer per WR or per link,
  which gives back the memory 27ef6a9981fe saved, so I am leaving that
  decision to you.

- smc_rtoken_delete() runs without rmbs_lock, and so do smc_rtoken_add()
  and smc_rtoken_set2() in smc_llc_rmt_conf_rkey() and smc_rtoken_add()
  on the CLC path; only the three smc_rtoken_set() callers take it.  As
  far as I can tell from smc_llc_flow_start(), a remote DELETE_RKEY flow
  is not held back by a local ADD_LINK flow, so it can clear an rtoken
  slot while smc_llc_save_add_link_rkeys() is filling that table.  The
  rtokens are a fixed array, so this ends in a lost or mismatched rkey
  rather than a memory error.  Taking the lock in the LLC event path is
  not a one-line change either: smc_llc_cli_rkey_exchange() and
  smc_llc_srv_rkey_exchange() hold it for writing across smc_llc_wait().

Best regards,
Yehyeong Lee
