Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396991;
	b=ybwiiIvvn7M5g6h0Svc5w5ivHqrta/8bRYv2EoC0uFrOmAOZt9Rel4ujsJ/7x2IVLNPg
	 TrtKLm8pI0RCKBiQxJ7qD1+TqzNtjnCKIYCN2WBPX3TZUoqFXOAmoNaStt430RRKB+13y
	 K+x7a23L5GKrHTriIjJ1h8k/dASge+LUs+vDbq+SjRQxrlgPEw8PbXao+fymkYGzeoiek
	 VDdXdLdIS7LMXlxrV3o9e6pUD/J0D1KvcHKOdcExaFg2RSLPahEQLf/H01nF/yIwwDHIo
	 gCwu6X8wT19OMssjj2Sd2wcZZH2tb1UOagVZifAPqD5bDjdl6uArNQDIvv0F8cL4gQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=VrsRfKDaeRM/QRQs0v0E1mQH4y0dNu7zDHVPAnHGwRI=;
	b=d8jfk7HG6omCbmw6KmdFlmhoX4vfo7M1wlvQp2kj8XXu/3kkjGO/8COb0Zb0Z9vgh4di
	 C0jpAiAtIjiopQBpEAPf8uKpje8bgs/TXelCtup1m2Gl6GBdBj8rnBuCyMuEdL4L7OE9Q
	 uIjYjDXAXwKvpmCXLCO9QZIzEWpwYYOPvvZzfOKfR16G38/gNye17pEoXIT6goBestzMu
	 kTnK/ey3N0LzqHJZoYz2ylAWdVeuORh73RTAUtFipkPUKDeIVmJARvVY0XDubSx05RUcj
	 fBcqN2EAUBgG9cEPdKprZMffE1KNOYbe7lpQA0icaN/+zlnQWkPM30NDcaNo6HLEZ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iH5E6dH0;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C649606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C649606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iH5E6dH0
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5365f9a04c5so3507521cf.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396990; x=1796001790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrsRfKDaeRM/QRQs0v0E1mQH4y0dNu7zDHVPAnHGwRI=;
        b=iH5E6dH0H2wbHX6n6xgrGku9CMgEVlCrxy0LwyZx6wzSkf0MlcvGab5yb+9Z3Os2u3
         lt2hGKmz23ZenWh7aeDRvrx4wLi8GbxH5HMJ9Ot9A/ebu2Y6IJGOkXcRtXD1FVbOdo7b
         smJ0913ND9j6yl8HxFcTv9DCuKXquPv8OcfYnHhSWNq+564v8QEZ13BLXjVpLdZsxXsd
         cq8l3Gbn8VPF/RYpO02nCiC8F/ZiBshJ/MCK1L5KkMaHMnDNP6ZCZh0SkgHG2FP69rWG
         oXImx7CDTgMFNr9kTRGrHY5d03emRhMV2JL85dgxHeL+iuJwOUjC5n1Hnvp2pVY/m+bx
         yX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396990; x=1796001790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrsRfKDaeRM/QRQs0v0E1mQH4y0dNu7zDHVPAnHGwRI=;
        b=MHubBE0kHrk5wHje8FSWteQzrmMBqLf1H/STDgYVBGjwPALuv0YAJ1/IISkQWfnnHd
         YDQKLaxFLagnEiJD/xYxi3QRy5xhYBNgNGriQFVxV9+G8g3iQsNWR77MkcdikMfalVtb
         DY2Op6Xb1Kk6oNVWiQkhLmo+W2RvoTZzw8GoCliHEhnge/KiysKbNBC6ZIUtKMH+ZDzT
         5Zv7PabiXXGPGg5Dns5hxZkzK+Bzx+U0JlZxQsOuqGxRjwBGjLRjP18pH4+PuCbnJS3K
         1WEI7RPmNhGyzK4Dt3cpT7ujFtnT+NCFi66PcJ2jpH7nYO0TpzqL4FEgJmwChbQjojUw
         aaZg==
X-Gm-Message-State: APuU4Z9bQhnoFzkFLpQNZ7dFl79rGVuHhvdZw90mLPq/2qp56YkDUijE
	a/gcX+F5sti+2PV12ZRcUYhkfg/JRCxEAWuGtBKPer8JScrmnKcX0CyCS7NXD1pp
X-Gm-Gg: AZFdTZfDfPaz3ZOvZDA4qcBLo9607m+wCmXHd1NVTPfptp23vjRvjokflxRSZcHAil5
	KyFvywX/KNAbh4FPuzAePsQvVoSuQSnnKWvuFtNitDs+2tydQIQii5NPNLY0XThvfuQtSMI/bIX
	8Qsdg1i8Adffxrh+S0Y+e961SlZ1CWDsXFXg7hDsCCi8gFcFNMraIb0uWLFtd9l/cqDbwzEwzUk
	eacU0OwUjUKFlMlUbjfG8Mo9lfCp7/4TLj9VjqURaIMclMMVFrsFleqRd63WxcJUhjkcwDdiTAd
	uh6m7s0L2aor4Ov2hOQLAbJwRBypLq3HBM290c4OMS1yMmU9MSgJZfG9/nWzs10jQEWkmWUaRfs
	n3T15Q7n2I2VJtgpZ4Ssc8ejQSAOEIMiqlS/emJvgLbTvPMgOOMfI2BJN+nu1lmDZWLaIJnApiU
	MHolSsS4KxSKgsZyVc5obDjjF1hV1SkbIMZ2Lcu5sx8Qt6FbtTvB0FCyKNoVr3w4BoKnYUvSV4a
	ijv1AhA/6J1jXA7D1njzJnFj7A7CkgqfYCNYefxlTqGOKR06nIORwkuhkTekYUTqgRxjVCKieVc
	ABUqwqMjFs7P+GVj9XqXU9t3L0tXmg0Di8D9iD8mqeZRgoEuyDw9ZMRPSvxlK8pZQox32kW5FtM
	BRtIBXnD9z8yHZbSlwUkhkt34T506g+toYeFwyxIwTXzZjDob4BAvn0kQMcxknXB+n7b0PGNq+F
	WFDSYBHmNSpDs7vXXwlg==
X-Received: by 2002:a05:622a:4e95:b0:536:141d:d427 with SMTP id d75a77b69052e-55d76ae8343mr164579311cf.73.1795396990227;
        Sun, 22 Nov 2026 17:23:10 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882e2c6sm86898611cf.12.2026.11.22.17.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:23:09 -0800 (PST)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>,
	linux-sctp@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Subject: [PATCH net-next] sctp: copy endpoint settings to accepted and peeled-off sockets
Date: Sun, 22 Nov 2026 20:23:09 -0500
Message-ID: <48580ca6a02b588e9c24444801109506da11a9d2.1795396989.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
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

As gomaja noticed, when accept() or SCTP_SOCKOPT_PEELOFF creates a new
socket, sctp_endpoint_new() initialises the new endpoint from the network
namespace sysctls and from the compiled-in AUTH defaults rather than from
the listening socket's endpoint. If an association restart (RFC 9260
section 5.2.2) arrives on the accepted or peeled-off socket, the restart
INIT ACK is built from the new endpoint, so it negotiates capabilities
based on the namespace sysctls instead of what the listening socket
configured:

 - Feature flags (PR-SCTP, ECN, RECONF, ASCONF, I-DATA) in the restart INIT
   ACK follow the namespace sysctls rather than what the listening socket
   set via SCTP_*_SUPPORTED socket options.

 - AUTH HMAC and chunk lists revert to the kernel defaults (SHA-1 only,
   empty chunk list) instead of what SCTP_HMAC_IDENT and SCTP_AUTH_CHUNK
   set on the listening socket.

Copy the feature flags and AUTH configuration from the old endpoint to the
new one in sctp_sock_migrate(). Add sctp_auth_ep_copy() to deep-copy the
HMAC list, chunk list, and shared keys from one endpoint to another. This
ensures that association restarts on accepted and peeled-off sockets
negotiate the same capabilities as the original handshake.

Signed-off-by: Xin Long <lucien.xin@gmail.com>
---
 include/net/sctp/auth.h |  2 ++
 net/sctp/auth.c         | 47 +++++++++++++++++++++++++++++++++++++++++
 net/sctp/socket.c       | 17 +++++++++++++++
 3 files changed, 66 insertions(+)

diff --git a/include/net/sctp/auth.h b/include/net/sctp/auth.h
index 85efa65d3912..2ef52507bf11 100644
--- a/include/net/sctp/auth.h
+++ b/include/net/sctp/auth.h
@@ -106,5 +106,7 @@ int sctp_auth_deact_key_id(struct sctp_endpoint *ep,
 			   struct sctp_association *asoc, __u16 key_id);
 int sctp_auth_init(struct sctp_endpoint *ep, gfp_t gfp);
 void sctp_auth_free(struct sctp_endpoint *ep);
+int sctp_auth_ep_copy(struct sctp_endpoint *dst,
+		      const struct sctp_endpoint *src, gfp_t gfp);
 
 #endif
diff --git a/net/sctp/auth.c b/net/sctp/auth.c
index cbeb8a87a17a..e075297b9ead 100644
--- a/net/sctp/auth.c
+++ b/net/sctp/auth.c
@@ -1056,3 +1056,50 @@ void sctp_auth_free(struct sctp_endpoint *ep)
 	ep->auth_hmacs_list = NULL;
 	ep->auth_chunk_list = NULL;
 }
+
+int sctp_auth_ep_copy(struct sctp_endpoint *dst,
+		      const struct sctp_endpoint *src, gfp_t gfp)
+{
+	struct sctp_shared_key *sh_key, *new_key;
+
+	sctp_auth_free(dst);
+	sctp_auth_destroy_keys(&dst->endpoint_shared_keys);
+
+	dst->auth_enable = src->auth_enable;
+	dst->active_key_id = src->active_key_id;
+
+	if (src->auth_hmacs_list) {
+		dst->auth_hmacs_list = kzalloc_flex(*dst->auth_hmacs_list,
+						    hmac_ids,
+						    SCTP_AUTH_NUM_HMACS, gfp);
+		if (!dst->auth_hmacs_list)
+			goto nomem;
+		memcpy(dst->auth_hmacs_list, src->auth_hmacs_list,
+		       ntohs(src->auth_hmacs_list->param_hdr.length));
+	}
+
+	if (src->auth_chunk_list) {
+		dst->auth_chunk_list = kzalloc(sizeof(*dst->auth_chunk_list) +
+					       SCTP_NUM_CHUNK_TYPES, gfp);
+		if (!dst->auth_chunk_list)
+			goto nomem;
+		memcpy(dst->auth_chunk_list, src->auth_chunk_list,
+		       ntohs(src->auth_chunk_list->param_hdr.length));
+	}
+
+	key_for_each(sh_key, &src->endpoint_shared_keys) {
+		new_key = sctp_auth_shkey_create(sh_key->key_id, gfp);
+		if (!new_key)
+			goto nomem;
+		new_key->key = sh_key->key;
+		sctp_auth_key_hold(new_key->key);
+		list_add_tail(&new_key->key_list, &dst->endpoint_shared_keys);
+	}
+
+	return 0;
+
+nomem:
+	sctp_auth_free(dst);
+	sctp_auth_destroy_keys(&dst->endpoint_shared_keys);
+	return -ENOMEM;
+}
diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index bc68af88e271..bfd87be8ed54 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -9623,6 +9623,23 @@ static int sctp_sock_migrate(struct sock *oldsk, struct sock *newsk,
 	if (err)
 		return err;
 
+	/* Copy the endpoint's feature flags and AUTH settings from the original
+	 * endpoint so that restarts on the accepted or peeled-off socket
+	 * negotiate the same capabilities.
+	 */
+	newep->prsctp_enable = oldsp->ep->prsctp_enable;
+	newep->ecn_enable = oldsp->ep->ecn_enable;
+	newep->reconf_enable = oldsp->ep->reconf_enable;
+	newep->asconf_enable = oldsp->ep->asconf_enable;
+	newep->intl_enable = oldsp->ep->intl_enable;
+	newep->strreset_enable = oldsp->ep->strreset_enable;
+	newep->sndbuf_policy = oldsp->ep->sndbuf_policy;
+	newep->rcvbuf_policy = oldsp->ep->rcvbuf_policy;
+
+	err = sctp_auth_ep_copy(newep, oldsp->ep, GFP_KERNEL);
+	if (err)
+		return err;
+
 	sctp_auto_asconf_init(newsp);
 
 	/* Move any messages in the old socket's receive queue that are for the
-- 
2.47.1

