Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756770;
	b=VG+45FS4Dg6o/PkiOBmJo+ekGf3CNcsUilqm0/AC1eikZIMxeMo+lbXHTjx54WnNLesr
	 PORdZ6g/mjHIZXWkp1ul2kzs6wnxcYLpXsBvmN+S8G1XPvTcX8j8Wqa81rHHIPCt8ELVn
	 Pu5bFWL19Lhitw7t7LX0MhvXmLrpraYvtXhcF9XjmSIfkQxX6s3MOvOst5ToCIMv3l7VN
	 uSXu6euY+dTFQ93I9qawW41L4MCNnh5A5/TAot7mt9m87lULUKhVLf7HDmoDcvD17+eBW
	 soRj3D8044GFLs2i+xulQCzSOQmvnUY9btv0B8AHdgq/rQHI+XR1gjGqPuCh/A7g8OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rNWMVT2gHiNq7DFh40B5BMuJHnSTLGiieTCWA+72rZ0=;
	b=pPs0IMvP6/MAzRtv5XhV8Kdm0/YpPvT0LlKVGCc5ts2uWp8Zyb/oqJYhmmKndmfTNUFn
	 gtXLMNHfN3Pd7AXCRxHfK379zV9tJG8OSrCXiIHRFqR6v12YBswxEwf1jYZqLFxPj66iB
	 uPSI6uU41bnMGBAiZPzDbe6xikMM22/424edXMsbtkeu/0RW5WD2cEJHn0dTatyWr6lK9
	 W6kz5wyr/BnUE+AK3cGvC5dsMsVf6IcC2iqJmqJztMjKO/QcHwqFliZF0G0mDZTXqXXRb
	 rd2O40wy/VpC2AYxLWu9VPIIC7nVqGNMU0ATKEkleYM1dEwU4rjvK9ktIio/I025v6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=LczT+37k;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90617606A324
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90617606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=LczT+37k
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so8035340c88.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 21:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1795756769; x=1796361569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNWMVT2gHiNq7DFh40B5BMuJHnSTLGiieTCWA+72rZ0=;
        b=LczT+37kEhKqC00v04Qw/XtDoopSG46P+zrcI0s7xNrWMTqJY+2s+CW0L+nDZGpdhQ
         IGWWa62Cr0t/nsDs6gsg9UyhymRICF2boGlufPIMKzZm38Ik2p0f3SE6D8w4X24Z5pUx
         LoA4HgFyz9wxr1JRNG2tpb8iXqoAM/u6LYjcEGxWKlHIThAB+1T6PSUreonM0Wq7rfNp
         ypWVMKNFiLLgm0I6R7mwgWYo6tPh0xHI6Ksw0fcKDrP9zVRQnNW8CCSyMouaPKdREKju
         C45EbBlB+hiPPA0mkA6HeOvrdlyKhj3AJtwTygJFEJF8/nkK351vuafShJlhVL7UQYLW
         uymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756769; x=1796361569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rNWMVT2gHiNq7DFh40B5BMuJHnSTLGiieTCWA+72rZ0=;
        b=wc8D9sE9m+NJY1A1qIltzm3xdAwLWj2uPOSZzzCc6NRagrJVPEPbLMVX0MCSJ6WaBx
         /iB+bVXFt5ebS7zsESb6EReOayxY9cI0H6aPoQ8MYPZxIGiW+wEmaOBuWyQJDpqZReLw
         WwnZ0UxK5ANZNa863PnJ/GfciYs6acAIYWY+nGDsgP/RpgcONuv9Hq8+ykyf7YdO6nmY
         8NrZx1q8To+9z3XYT0Mx6ilImSnYnNEYDVu7sL+/8jZUULdVQ8NNJooEmWi1OH+1cUX2
         ax07QER/KPuAiY4h6B8fKgydJEudEhH5yPtjG0jokKEl7kh5RGJ8o+XIINqOryf8qSGh
         VKxA==
X-Forwarded-Encrypted: i=1; AL+hErGxkfhgQOXnOxgrxn/d7bAuVMC6qCPPv8/WP8+ylMhNXhxD3QHjFnNJ1z4RuM85RJ9ZWb3a8SE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uhA2x9P0WpUe5ifVGJShf5zT7vok/7zdeDUvTCD/7fq4L4+r4
	hPKfToyjtf1eZ9CsbVZdhKQp3NwkTG7SUeImMqROAxS2pHD6PH6VbP/gTK3l6uhs1yPE
X-Gm-Gg: AZFdTZeKjdF2dIsbOU2nhFMCu+fgQn4++XcNVxwnKUdn1WjjSZsegnEonyQWO+IZRMN
	Q4Svyca4jNQZN/zH2VltZhbXSDiX+VvNSwy5zaItK9SqmtrbBxZvNnjhZY12pLZcQmfQZcTfiPR
	beEIJf84cq2kgb6mH13gSIomxW74MNLY1plxQ9fLBLZtTie0rCNOGylvivNvqNhLDDuaKW+DryV
	qCtNXSGSLbX/Cjau+iK7U+pdfz7XhbAIDhxgt4UH6c6pgpm3WLpB6jvBE+OnKCMApTCnHb+RKLv
	eDldyQwMN4QsJdSmpodtqFo4K9x2hbEkPo4DdXvVtJbqoNM4jxrY9yN9YqTCE9jy6PwwBpp0kMi
	sqCGkdY9hZQPMksPnY7nHiwftIN87KSbj7igv1p+NajDoVwwPj4jIW9nfK9j3KsvjAlvGzfc/Ya
	TMhXed7guFg8NWdjvhPdCWBqQCq4IpBLkuqFykFoyMlcOoHNTad/8egbyImazyIDyrkS7ZMEMei
	hCMc/qrCqKGtp8WFoINMqCeKJ8EokFblmq7wUKS2aEYuggQ91d2dC8tPlfXy/ekTP1WxP321I0h
	fK5wA44rcqR7h3bOYM9SnW1rzkJ39GtV4Qd5osQ=
X-Received: by 2002:a05:7022:b044:10b0:181:73fc:e53 with SMTP id a92af1059eb24-1b5568e7699mr26233910c88.29.1795756769479;
        Thu, 26 Nov 2026 21:19:29 -0800 (PST)
Received: from enjou-Legion-Y7000P-2019 ([174.136.206.51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm82950093eec.10.2026.11.26.21.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:19:29 -0800 (PST)
From: Ren Wei <weir@nebusec.ai>
To: virtualization@lists.linux.dev,
	netdev@vger.kernel.org
Cc: sgarzare@redhat.com,
	bobbyeshleman@meta.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	arseny.krasnov@kaspersky.com,
	vega@nebusec.ai,
	caoruide123@gmail.com,
	weir@nebusec.ai
Subject: [PATCH net 2/2] vsock/test: add stream MSG_WAITALL receive timeout test
Date: Fri, 27 Nov 2026 13:19:14 +0800
Message-ID: <503c1d5538f5b41f8eda756f5ea4491f0bd44518.1795591531.git.caoruide123@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795587333.git.caoruide123@gmail.com>
References: <cover.1795587333.git.caoruide123@gmail.com>
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

From: Ruide Cao <caoruide123@gmail.com>

test_seqpacket_timeout covers SOCK_SEQPACKET with SO_RCVTIMEO, but there
is no SOCK_STREAM test for a cumulative receive timeout across partial
reads.

Have the peer drip-feed one byte every 0.8s while the client issues
recv(MSG_WAITALL) with a 1s SO_RCVTIMEO. Without the timeout being
preserved, the wait budget is restarted after each byte and the recv
completes after several intervals. With the fix, the call must return
around the original timeout, either with EAGAIN or with a partial read
shorter than the MSG_WAITALL request.

Keep the data socket open until both sides confirm: the client writes
WAITDONE after recv returns, the server finishes sending all six bytes
and acknowledges, and only then is the socket closed. Failure paths
complete the same handshake so the server does not hang.

Signed-off-by: Ruide Cao <caoruide123@gmail.com>
Signed-off-by: Ren Wei <weir@nebusec.ai>
---
 tools/testing/vsock/vsock_test.c | 112 +++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
index 10b9074fb87f..868792f7729c 100644
--- a/tools/testing/vsock/vsock_test.c
+++ b/tools/testing/vsock/vsock_test.c
@@ -662,6 +662,113 @@ static void test_seqpacket_timeout_server(const struct test_opts *opts)
 	close(fd);
 }
 
+#define STREAM_RCVTIMEO_DRIP_BYTES	6
+#define STREAM_RCVTIMEO_DRIP_USEC	800000 /* 0.8s, inside the 1s timeout */
+
+/* Keep the data socket open until both sides confirm. The client
+ * writes WAITDONE when recv() returns, but must not close until the
+ * server has finished drip-feeding all 6 bytes and acknowledged;
+ * otherwise later sends hit EPIPE. Failure paths complete the same
+ * handshake so the server is not left in control_expectln("WAITDONE").
+ */
+static void test_stream_timeout_waitall_done(int fd)
+{
+	control_writeln("WAITDONE");
+	control_expectln("SRVDONE");
+	close(fd);
+}
+
+static void test_stream_timeout_waitall_client(const struct test_opts *opts)
+{
+	char buf[STREAM_RCVTIMEO_DRIP_BYTES];
+	time_t read_enter_ns;
+	struct timeval tv;
+	time_t read_ns;
+	int failed = 0;
+	ssize_t n;
+	int fd;
+
+	fd = vsock_stream_connect(opts->peer_cid, opts->peer_port);
+	if (fd < 0) {
+		perror("connect");
+		exit(EXIT_FAILURE);
+	}
+
+	tv.tv_sec = RCVTIMEO_TIMEOUT_SEC;
+	tv.tv_usec = 0;
+
+	setsockopt_timeval_check(fd, SOL_SOCKET, SO_RCVTIMEO, tv,
+				 "setsockopt(SO_RCVTIMEO)");
+
+	/* Enter recv() before the peer starts drip-feeding, so the first
+	 * byte cannot already be queued.
+	 */
+	control_writeln("CLNSENT");
+
+	read_enter_ns = current_nsec();
+	n = recv(fd, buf, sizeof(buf), MSG_WAITALL);
+	read_ns = current_nsec() - read_enter_ns;
+
+	/* Unfixed kernels restart the full SO_RCVTIMEO after each partial
+	 * read, so this recv() returns 6 bytes after ~4.8s. A cumulative
+	 * 1s timeout returns much sooner; use 2s as the cap so the two
+	 * outcomes cannot be confused.
+	 */
+	if (read_ns >= 2ULL * NSEC_PER_SEC * RCVTIMEO_TIMEOUT_SEC) {
+		fprintf(stderr,
+			"recv(MSG_WAITALL) exceeded SO_RCVTIMEO, %lu ns\n",
+			read_ns);
+		failed = 1;
+	}
+
+	if (n == sizeof(buf)) {
+		fprintf(stderr,
+			"recv(MSG_WAITALL) completed under drip-feed\n");
+		failed = 1;
+	}
+
+	if (n < 0 && errno != EAGAIN) {
+		perror("EAGAIN expected");
+		failed = 1;
+	}
+
+	if (n == 0) {
+		fprintf(stderr, "unexpected EOF on recv(MSG_WAITALL)\n");
+		failed = 1;
+	}
+
+	test_stream_timeout_waitall_done(fd);
+	if (failed)
+		exit(EXIT_FAILURE);
+}
+
+static void test_stream_timeout_waitall_server(const struct test_opts *opts)
+{
+	int fd;
+	int i;
+
+	fd = vsock_stream_accept(VMADDR_CID_ANY, opts->peer_port, NULL);
+	if (fd < 0) {
+		perror("accept");
+		exit(EXIT_FAILURE);
+	}
+
+	control_expectln("CLNSENT");
+
+	/* Drip-feed all 6 bytes even after the client times out, so an
+	 * unfixed kernel still collects a full 6-byte recv and fails.
+	 * The client keeps the data socket open until SRVDONE.
+	 */
+	for (i = 0; i < STREAM_RCVTIMEO_DRIP_BYTES; i++) {
+		timeout_usleep(STREAM_RCVTIMEO_DRIP_USEC);
+		send_byte(fd, 1, 0);
+	}
+
+	control_expectln("WAITDONE");
+	control_writeln("SRVDONE");
+	close(fd);
+}
+
 static void test_seqpacket_bigmsg_client(const struct test_opts *opts)
 {
 	unsigned long long sock_buf_size;
@@ -2739,6 +2846,11 @@ static struct test_case test_cases[] = {
 		.run_client = test_seqpacket_timeout_client,
 		.run_server = test_seqpacket_timeout_server,
 	},
+	{
+		.name = "SOCK_STREAM MSG_WAITALL timeout",
+		.run_client = test_stream_timeout_waitall_client,
+		.run_server = test_stream_timeout_waitall_server,
+	},
 	{
 		.name = "SOCK_SEQPACKET invalid receive buffer",
 		.run_client = test_seqpacket_invalid_rec_buffer_client,
-- 
2.47.3

