Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116123;
	b=rKgeQmJgH/FyDWvNfZxKM4OXpnUhMqNsVm+aoKjY0yW6Dv3yTPjOVp4BYpqmi7lrlUiJ
	 RgmVZ/BEi79da63N8HqkeqtHnveUnERbmsizwEmCN0RK8YnIZ1h+q8fA6EfDimaTjhueb
	 3y1qvxRvcO6JX8qKdtASaIPxmsEXDvE8uan1frJ214n23jf544hUt4cJC9+0bEpnuIeZX
	 F0MOG9I4aAqx9q/jWJKHOEeLkmLkSZmuJG/7/OIRJUtNYgFoaw3HtbeW5r//rNoAQF+NK
	 frYT9ylbwsVGKM4kZZ2UJ/wT3wLmZkCjwbtsLB6YK2cjF0ChCJ4eeEsU+/7NlYIm+7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=gIWylxu69Ioq+u8Mm1LXBIh3r/He82QwlSQoOVn3GZY=;
	b=1RNTWgfhVNk+q22bFAWTJ5uKjGsJK+eYQEy1KjBg+Tm7tQLyLk5uiQUPLXcjBXPySCHe
	 J7EIzmUZZ0znCUJBc+Uf30lW4lnNxr5nnErUrhjXZaZrFuXbMvUjEsA8Xoyo/3+T+6TPB
	 d5MKTbDegi0LrFbqlqzN0XNBlXRHzMBG0FnF2TonePwQEVDHVvhAdb8bTwwxzZvDOvMsa
	 eDtaKweZnsYeMyUDRwPEiSR/3jzwnDsD6fClPplksqJI3dCNTpbAoD8Y5Sal4bTchLmr0
	 5Mw9PqZPI/5BCR2Jjrcm+milOPjRBHoVuU96dAjh+xVG6nGxQQSW4xI+fsNOWh6VJLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aIFZTVoc;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1723606A32F
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1723606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmnk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aIFZTVoc
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a82fb7e71eso28302f8f.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 11:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116121; x=1795720921; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gIWylxu69Ioq+u8Mm1LXBIh3r/He82QwlSQoOVn3GZY=;
        b=aIFZTVockyKyuUbXwL2uczLP4xw+tljzW+quEjvI7ZvGqsLnEFcTlV0VbOIyjpnMG1
         sUnktRuFlyma/srYcFsDIcJDuoWaYay8hWxd2ylJLFTF5nNh09YR94bctYwlwUtIQcxN
         dIQlAwVKfDl0ql30GpyjxxndwwJv1VmGmqUjsj9E7F9boKpfe6wfIjc4Snv5mdZlaYZw
         8Femv2LprG7EqEZW7k5Ad+oEclPrdWGAxTxyT04QHptnpOR2/8tzvRgZwLcBexfjF7Mx
         CenYwQqEeatVc/HOVE49zxMFX4QrcNeog7am6MFqacGg+AgwMq0DprIJQS++i9BwIXK7
         7GDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116121; x=1795720921;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gIWylxu69Ioq+u8Mm1LXBIh3r/He82QwlSQoOVn3GZY=;
        b=idwXf4APHAPyOZJn3l3aucjymYez5NNccsEuc47AWCGH8xShzaNLx/HuLyMX5IPPM+
         nYLTzc049lTegOo21sEn4TRmVgEQZc8cJoDBY4a+0gQBsY0ITrbnefdjYXy1WIsv1q82
         Jxd9BlXnkD3LMypj5GbtSaLEuvztaCQDnwaFo3Q0U1VU3MdznMkZz6ER6PsePlRzJLLq
         NjTmp563UclMgpXZdnAdq4MuHf386SCWxW+iDM0f239WJ/Wt6qwXLpnsif5mJnDfq2ZK
         Cm+mcHdgBcQCKHiaGINtNatAUuGXFuzVVug610vVqiU1ER9OyMmLu/rlu7cdetQF/A6K
         JiEg==
X-Forwarded-Encrypted: i=1; AL+hErFLFsnnXvV0qDKdKh6OQeHuF9lbEU/9co6QMkCGCaFQSyws+dEV7hlckID0jM1VxMs2MKJNAaY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mmTMCTAlybxIB45HXLZbsTT4eT/j3zQuTm+XeJeGTweRiziKd
	6QfXjM22KmM/fmdyhgNTX7xmHwk3MxWUUwnsqTjnKmv4cAKB52KGWQIJiw3ynepz/WdkR+Uqmw=
	=
X-Received: from wrmt2.prod.google.com ([2002:adf:e442:0:b0:48e:4e20:1349])
 (user=dmnk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4b0f:b0:48e:d7c:4bc8
 with SMTP id ffacd0b85a97d-4abad6a1782mr866576f8f.7.1795116120877; Thu, 19
 Nov 2026 11:22:00 -0800 (PST)
Date: Thu, 19 Nov 2026 20:21:59 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119192159.2646113-1-dmnk@google.com>
Subject: [PATCH mptcp-net] mptcp: gate diag sequence counters on CAP_NET_ADMIN
From: Dominik Maier <dmnk@google.com>
To: Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>
Cc: Geliang Tang <geliang@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mptcp@lists.linux.dev, 
	netdev@vger.kernel.org, dmnk+artist@google.com, 
	Dominik Maier <dmnk@google.com>
Content-Type: text/plain; charset="UTF-8"

In net/mptcp/diag.c, subflow_get_info() restricts MPTCP sequence-related
subflow attributes (rel_write_seq, map_seq, map_subflow_seq, ssn_offset)
to callers holding CAP_NET_ADMIN in the network namespace.

However, mptcp_diag_get_info() unconditionally exports mptcpi_write_seq,
mptcpi_snd_una, and mptcpi_rcv_nxt via INET_DIAG_INFO because
.idiag_get_info does not receive the caller's net_admin status. Any
unprivileged local user can therefore dump or query cross-UID MPTCP
sockets by token via SOCK_DIAG_BY_FAMILY and read live 64-bit MPTCP Data
Sequence Numbers.

Emit INET_DIAG_INFO from an .idiag_get_aux callback in mptcp_diag (which
already receives net_admin from inet_sk_diag_fill(), while msk never
sets icsk_ca_ops so netlink attribute ordering is unchanged) and zero
mptcpi_write_seq, mptcpi_snd_una, and mptcpi_rcv_nxt when !net_admin.
getsockopt(SOL_MPTCP, MPTCP_INFO) for the socket owner and token-based
lookup in mptcp_diag_dump_one() remain unchanged.

This issue was discovered with an AI-assisted code review tool (ARTIST)
and reproduced in QEMU/KVM on an unmodified v7.4-rc3 kernel without
kernel modifications or error injection; a standalone reproducer is
available on request. This revised .idiag_get_aux patch was
compile-tested with -Werror and checked with checkpatch.pl --strict; it
has not yet been runtime-tested against the reproducer or the MPTCP diag
selftests.

Fixes: ac3b45f60954 ("mptcp: add MPTCP socket diag interface")
Cc: stable@vger.kernel.org
Signed-off-by: Dominik Maier <dmnk@google.com>
---
 net/mptcp/mptcp_diag.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/net/mptcp/mptcp_diag.c b/net/mptcp/mptcp_diag.c
index 136c2d0..62d8f1f 100644
--- a/net/mptcp/mptcp_diag.c
+++ b/net/mptcp/mptcp_diag.c
@@ -193,10 +193,9 @@ static void mptcp_diag_get_info(struct sock *sk, struct inet_diag_msg *r,
 				void *_info)
 {
 	struct mptcp_sock *msk = mptcp_sk(sk);
-	struct mptcp_info *info = _info;
 
 	r->idiag_rqueue = sk_rmem_alloc_get(sk) +
-			  READ_ONCE(mptcp_sk(sk)->backlog_len);
+			  READ_ONCE(msk->backlog_len);
 	r->idiag_wqueue = sk_wmem_alloc_get(sk);
 
 	if (inet_sk_state_load(sk) == TCP_LISTEN) {
@@ -210,11 +209,29 @@ static void mptcp_diag_get_info(struct sock *sk, struct inet_diag_msg *r,
 			r->idiag_wqueue = READ_ONCE(lsk->sk_max_ack_backlog);
 		}
 	}
+}
 
-	if (!info)
-		return;
+static int mptcp_diag_get_aux(struct sock *sk, bool net_admin,
+			      struct sk_buff *skb)
+{
+	struct mptcp_sock *msk = mptcp_sk(sk);
+	struct mptcp_info *info;
+	struct nlattr *attr;
 
+	attr = nla_reserve_64bit(skb, INET_DIAG_INFO,
+				 sizeof(struct mptcp_info), INET_DIAG_PAD);
+	if (!attr)
+		return -EMSGSIZE;
+
+	info = nla_data(attr);
 	mptcp_diag_fill_info(msk, info);
+	/* Only export seq related counters to user with CAP_NET_ADMIN */
+	if (!net_admin) {
+		info->mptcpi_write_seq = 0;
+		info->mptcpi_snd_una = 0;
+		info->mptcpi_rcv_nxt = 0;
+	}
+	return 0;
 }
 
 static const struct inet_diag_handler mptcp_diag_handler = {
@@ -222,8 +239,9 @@ static const struct inet_diag_handler mptcp_diag_handler = {
 	.dump		 = mptcp_diag_dump,
 	.dump_one	 = mptcp_diag_dump_one,
 	.idiag_get_info  = mptcp_diag_get_info,
+	.idiag_get_aux	 = mptcp_diag_get_aux,
 	.idiag_type	 = IPPROTO_MPTCP,
-	.idiag_info_size = sizeof(struct mptcp_info),
+	.idiag_info_size = 0,
 };
 
 static int __init mptcp_diag_init(void)
-- 
2.56.1.750.gf70dc682cf-goog

