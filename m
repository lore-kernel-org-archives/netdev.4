Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830707;
	b=XgMCdZ8gESp5WV04SEFXFqajr8EmZoUljCqFIkY9f50EToB5wtxGtp/+M/J5dirjvc8n
	 ejm4CVYoH/TP371fwUWOHTf9mUJi0O84pUaLz1AjYGd/1Q+tCTC7lLx+P8NZcDp0TfuQU
	 Ok5wXr/OvPlGqEWE+JlhfBaKV5+HstFOcdj8yjS+fBU4tjAhJRZHg4pzFJ3o9A+Ypgpif
	 n/Oc6Fdyvn1N2/HGIPPp2HWWGuP244raIEQYOO8BeyZmiYuLW2e+68S4mOBQNzjrREvni
	 nKI/qmPxlEo4pOdv7OuENqaYEk1yzcXEwkUn4YELhnuOqjDauWSBn2p6/JOsXvVl11Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=rpNZEkssaLAsymmxs92N94pcsrg9VZFrpliq2QFm7YY=;
	b=wcXHGpg2VJ5ikYpC0pXSmXFCkdJYQwjEkv84i94Ux4z+df5G9jMrj1MPWYFPEHOvTa7r
	 QyPQJQ+oBDV4JyadccwMInS3xiXI9sgmzMFWNa8b0vjywhC5rOW35iZZZIJwsBp6Fe0qn
	 VMikZ9WoxlzIyP0eQxoPP2r0f2PRshVb/9zhioUCWFZm2NQl2SgS8Bvm2ibY7r1OHmPSq
	 JxqQa889IadLnnT6MhluJm+ipD8xk61pBgnaXx/WvTIS9q1q2vw3HQTLFb5WmrCsxEhb9
	 aZVoeyLvJ0v6xAWqysajmrKyzPOLdjGnG1TW7Z4pTzxnyTu7chlXn5ULrNNjPwXtl5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRsKrGJZ;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B56F606A8A7
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:05:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B56F606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dRsKrGJZ
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-675617e81f9so3332821d50.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 04:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830706; x=1795435506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rpNZEkssaLAsymmxs92N94pcsrg9VZFrpliq2QFm7YY=;
        b=dRsKrGJZidblvqRbsCPv0AiSCkg+DQGrLRK93lDiQLSocgZ8vO2vJQiIgxEYHqjP4z
         xKTP5ooseru/ohMBHUHI8rFaiHdKYLBXELVQ5ejvhOQUyyasItWeJb44JVXxkZZTomzW
         3EeMoqzEgw5PZuQZapMb8GY/qpGcYC9J3scDq8ziS2WnnlwkmVSPu+MpuHBDX3RsDgCc
         2GmDPZk/siFDIEpnbQO4XaXYysI0gov1i2xeb9hDFds7lnegBm5nQqbIsyBrmYZRHBuD
         MuMTOUF/Zhvjg6t9WFcaPHfGrJbev8r4LrFZwHLqIEoRmJ2C+XTzvQ7dASmavBMyGryY
         rf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830706; x=1795435506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rpNZEkssaLAsymmxs92N94pcsrg9VZFrpliq2QFm7YY=;
        b=eqRxGEAg0hjvN2BGvaH6z+vo9kM/xNePpd+pzrVTd/AWDHQ0bZZmqKfQZkdcYldvgC
         f/1MZojmR3wH9hJAiI/pNB4rpFvY6gi/bic3cZAVC+64dwIoxPCLMxzzB3S6YkCy9Ts1
         5QfrtTp07rYx/vt3h1MmwzSZHpaFIcNKx8iw63QwHPTeu+WWXcucyrVMFRx2FYkhA9OS
         BAQP0S1jSgaUEvRxXI6HiDBWPl9cyqoAtp+yzusfzIYZkywmIIAK8FARJM8dXpSnQT7A
         88XKQnyvok1oGWYf1VfqBWmXGuQ/vEETKESNfEios1tYZk6gmweFtVkum8skqiLposZo
         p0Dg==
X-Gm-Message-State: APuU4Z/vzEvwth5zn9Yp1UzkR9UVG54yWV+uwzz/GjdPzLnt+KSDBY7p
	Izzz6tN1YWRViSn/BUStpTqPR6lG6p6J1epASyh+aLzOiPdiKIWZLDBx
X-Gm-Gg: AZFdTZexiFAo8QdifyXbWVfBHkXrZcuqGTLnFLkkpcq8artJzNXODZWvkNqse59J3xg
	rIKv0seQqN4MbAgFDQl/TLlsKo2fZfH9wXMfsc4K4rujOt/ZDbvIiaexziwtFAXvAbm4JG4kji+
	KTc6uA+QZqxqUW80gIMOBw2J9Et4aSXT3k4Qj3PLw1RpngWgYSqDKfM4VZYUPY0EwoWJanWBiqs
	qXbM0kwNtw21mKGIvrt+rCnv0lxXpAtggxnq/s3UnRzeGY8VoP793Ll1ihnk803wAGdkTqTczbY
	VMshy3g4d60sM2TblqmFzdR3w3QXPltokXDYU/dcGNMrHwJ3IX5/JF1TGT80sUDPS51iJM/SSAM
	uT09hbtKItn086WLOupP6M6Iuhind8st3eo6GrdWdv9RJe/j0ruNBpNE0m1Qff0ZpoSHbbQaRee
	MgSJCwZgJ3jhgH85ITT+YA7cZRP4lFqR4IPRkXhpYP2UbPesaoBAB4/Pd/n29zBJpwJ4QzGQ61L
	MCGJ/8KLUnHB+T29h3YYaApfl5Zk0E7LNTdLOyOsMMtnwNb/SP1nG/kmetRRg0V1zjklDpJncGp
	phKY1bqg7PSNvKm5SLSP/6oI5A==
X-Received: by 2002:a05:690e:1287:b0:67d:a096:d8b7 with SMTP id 956f58d0204a3-67da096daffmr3722819d50.3.1794830706323;
        Mon, 16 Nov 2026 04:05:06 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:5::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a6210ffsm9648073d50.20.2026.11.16.04.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:05:04 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 16 Nov 2026 04:04:39 -0800
Subject: [PATCH net-next v4 4/5] selftests: drv-net: psp: factor out psp
 connection setup
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
Message-Id: <20261116-psp-v4-4-1a599df2aefa@gmail.com>
References: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
In-Reply-To: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.13.0

Lift out connection setup and PSP assoc uapi code in psp.py and
responder, so that the key exchange sequence can be used in other test
cases that start with a key exchange, but might choose to perform
additional tx/rx assoc calls afterwards.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v4:
- drop closing the data socket on conn_setup_psp() failure; preexisting
  and not needed by the series

v3:
- take key lengths from the kernel's rx-assoc reply instead of a
  per-version table
- close the data socket in psp_responder if conn_setup_psp() fails
---
 tools/testing/selftests/drivers/net/psp.py         | 14 ++++-
 .../testing/selftests/drivers/net/psp_responder.c  | 73 ++++++++++++++--------
 2 files changed, 59 insertions(+), 28 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index c114d2245135..ce0ab6666603 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -467,10 +467,11 @@ def assoc_twice(cfg):
             ksft_eq(len(tx), 0)
 
 
-def _data_basic_send(cfg, version, ipver):
-    """ Test basic data send """
-    _init_psp_dev(cfg)
+def _establish_psp_conn(cfg, version, ipver=None):
+    """Establish a PSP connection and return after key exchange
 
+    Requires _init_psp_dev() to have been called first.
+    """
     # Version 0 is required by spec, don't let it skip
     if version:
         name = cfg.pspnl.consts["version"].entries_by_val[version].name
@@ -495,7 +496,14 @@ def _data_basic_send(cfg, version, ipver):
                         "version": version,
                         "tx-key": tx,
                         "sock-fd": s.fileno()})
+    return s
+
+
+def _data_basic_send(cfg, version, ipver):
+    """ Test basic data send """
+    _init_psp_dev(cfg)
 
+    s = _establish_psp_conn(cfg, version, ipver)
     data_len = _send_careful(cfg, s, 100)
     _check_data_rx(cfg, data_len)
     _req_echo(cfg, s)
diff --git a/tools/testing/selftests/drivers/net/psp_responder.c b/tools/testing/selftests/drivers/net/psp_responder.c
index a26e7628bbb1..411a23be78d5 100644
--- a/tools/testing/selftests/drivers/net/psp_responder.c
+++ b/tools/testing/selftests/drivers/net/psp_responder.c
@@ -37,20 +37,15 @@ static struct {
 	unsigned char rx;
 } psp_vers;
 
-static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
+#define PSP_MAX_KEY_LEN		32
+
+static int
+rx_assoc(struct ynl_sock *ys, __u32 *spi, char *key, unsigned int *key_len,
+	 int data_sock)
 {
 	struct psp_rx_assoc_rsp *rsp;
 	struct psp_rx_assoc_req *req;
-	struct psp_tx_assoc_rsp *tsp;
-	struct psp_tx_assoc_req *teq;
-	char info[300];
-	int key_len;
-	ssize_t sz;
-	__u32 spi;
 
-	dbg("create PSP connection\n");
-
-	// Rx assoc alloc
 	req = psp_rx_assoc_req_alloc();
 
 	psp_rx_assoc_req_set_sock_fd(req, data_sock);
@@ -64,29 +59,28 @@ static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
 		return -1;
 	}
 
-	// SPI exchange
-	key_len = rsp->rx_key._len.key;
-	memcpy(info, &rsp->rx_key.spi, sizeof(spi));
-	memcpy(&info[sizeof(spi)], rsp->rx_key.key, key_len);
-	sz = sizeof(spi) + key_len;
+	*key_len = rsp->rx_key._len.key;
+	memcpy(spi, &rsp->rx_key.spi, sizeof(*spi));
+	memcpy(key, rsp->rx_key.key, *key_len);
 
-	send(data_sock, info, sz, MSG_WAITALL);
 	psp_rx_assoc_rsp_free(rsp);
 
-	sz = recv(data_sock, info, sz, MSG_WAITALL);
-	if (sz < 0) {
-		perror("ERROR: failed to read PSP key from sock");
-		return -1;
-	}
-	memcpy(&spi, info, sizeof(spi));
+	return 0;
+}
+
+static int
+tx_assoc(struct ynl_sock *ys, __u8 version, __u32 spi, char *key,
+	 unsigned int key_len, int data_sock)
+{
+	struct psp_tx_assoc_rsp *tsp;
+	struct psp_tx_assoc_req *teq;
 
-	// Setup Tx assoc
 	teq = psp_tx_assoc_req_alloc();
 
 	psp_tx_assoc_req_set_sock_fd(teq, data_sock);
-	psp_tx_assoc_req_set_version(teq, psp_vers.tx);
+	psp_tx_assoc_req_set_version(teq, version);
 	psp_tx_assoc_req_set_tx_key_spi(teq, spi);
-	psp_tx_assoc_req_set_tx_key_key(teq, &info[sizeof(spi)], key_len);
+	psp_tx_assoc_req_set_tx_key_key(teq, key, key_len);
 
 	tsp = psp_tx_assoc(ys, teq);
 	psp_tx_assoc_req_free(teq);
@@ -99,6 +93,35 @@ static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
 	return 0;
 }
 
+static int conn_setup_psp(struct ynl_sock *ys, struct opts *opts, int data_sock)
+{
+	char info[sizeof(__u32) + PSP_MAX_KEY_LEN];
+	unsigned int key_len;
+	ssize_t sz;
+	__u32 spi;
+
+	dbg("create PSP connection\n");
+
+	if (rx_assoc(ys, &spi, &info[sizeof(spi)], &key_len, data_sock))
+		return -1;
+
+	// SPI exchange
+	memcpy(info, &spi, sizeof(spi));
+	sz = sizeof(spi) + key_len;
+
+	send(data_sock, info, sz, MSG_WAITALL);
+
+	sz = recv(data_sock, info, sz, MSG_WAITALL);
+	if (sz < 0) {
+		perror("ERROR: failed to read PSP key from sock");
+		return -1;
+	}
+	memcpy(&spi, info, sizeof(spi));
+
+	return tx_assoc(ys, psp_vers.tx, spi, &info[sizeof(spi)], key_len,
+			data_sock);
+}
+
 static void send_ack(int sock)
 {
 	send(sock, "ack", 4, MSG_WAITALL);

-- 
2.52.1

