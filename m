Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530708;
	b=ZMHLaOsmUeM3VPU2VvhnRDe2CVeYfCvexNjx6VF40vCKLFe7YoA5WnOfw2RSY7BP789c
	 eeajwHaIUSpHul/IHqknjzpiGCxy4DnAaXMJwBpPtcUJWqL7x2ZB7EL6xFK3oe6gC+vGf
	 qUAQIbfHMyp+Uq2wBtEVzy0+bl8QffykMRWsQ+LywjLj9kFmh0r8Y0fYTcsI7pLo4RhnH
	 uIpwz8qjiiYNv0BVs2Ibg9Oe6+nh3Uffm6bK8FRIRPpyT55wZQm/Cgnx/XH1OSYl2TEzM
	 8B7sH6IjbPNSNgdEiuj13Oly6bxKGXqS9xMWQ1gr1fgtzjVyKC9A2oFX8MqrvDAJs+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e5nQK3hY4QWxDiFxG2TVLn0sC87qjDF+NBgRn5G+iKQ=;
	b=WlenbadnEKwGjrvSFzuVAuY5X/XuZqRwHAL3XBFlSQWBW3bufvQ1GaactmsM3gIhyEr8
	 RwXnO7WexAyd8fBDRt2apFan2z0N7SrIORcQ3QFInC93TL5jtt2Uu3MNanlVjiySqtBhY
	 /8532WKKya1KAI7WvGOSGbL/eAsl3OVYPRxmS8MNggtyF2AUTwbTNffDFtFq2ueCBdW/e
	 XTx2pB5WNhjuPFmm8+D7bVgqcJLFYrBIpwqHK2osV4SvTxc4RjuyPfEaOzT6nHUfU1T3J
	 8N6//mR2mwcWmuWJtFCvimbIPfe+ozkCq6qwX9GQ3Gh2LRLsmSPAzetkhctn8veMCYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AjEHrqNg;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64200606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64200606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AjEHrqNg
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so3727149a91.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795530707; x=1796135507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5nQK3hY4QWxDiFxG2TVLn0sC87qjDF+NBgRn5G+iKQ=;
        b=AjEHrqNgifqF8aPJ7EKJgLp2n35585eq5Lo7NlPgH7Ksj/AuHveZRs0v1+Jj/5Nk9K
         j+m9et26cCVsmUDROlNzguXU7+UAqRX9pNQL7hFerUbgazOwkPflbu4D2dCjEP9v318U
         qcBx5MXmk2SpLe7MhVmj7Gg5OXUqpZfTEYnUYDHGv+r2p9Hz6irlHYxkFGj8qj5h0SFY
         ovU0WeZu93+hL/FsH3taW3Bhd0qh6DJ7hxj19t4Nklc1hcnuguD/v+Bn9VvF03I+OyBm
         TOnOR0wxs8IQjc4nt34T2dTC9NQjZ8PdbM9CZoI00jbSq0z1/poyerK/kqKvJhrtWaIx
         ZxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530707; x=1796135507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5nQK3hY4QWxDiFxG2TVLn0sC87qjDF+NBgRn5G+iKQ=;
        b=TtIbx8zspYuVxar7nIA8SGvHeOhhJ18hZXMPTxSBMP3CoIzLI+NaNqC3XtxjP8a7VV
         p/8VsIJ4Qw7i4mVZSO9z6NQ/jGgjWaryU3KCwTVcyo8QgXWhDrCNxjvE6ahgjajRURZP
         i0uKOQgQLnDUiK/wiXl+nZujyvqaPaEfjK+RWUw4HvuGXXx6SL976HsekVsQCIBCtjhS
         ZMoLuqHS6lvnLUY/PADbEjZhgZWba5YvXeAFKKg6FWqSDDjkosq2igPARWWXNxoQTdYf
         jiFCalCCUQPdUvYidlBgQX6gXSuFcOaLVmMPggTSQaH39xUNXenRkelikwSAuGlha+0m
         fI7A==
X-Forwarded-Encrypted: i=1; AL+hErGZYPH/41uFhZv/YHxgEqdqucPozpnSax8j0cLogXrP8Zx45qTaL9UbdFTqoN+ym385zuEdGb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nebeJGIgGrSmvq2XpnaPMMbXRRvC0d2tHB6E5RPP+Y6jSRlSM
	N8BArRh2UIhYJ9vZnDjIA3iCw7isPCULHwmSgX39ucAY1dWsLl3xXIhF
X-Gm-Gg: AZFdTZcammF/c/zBW3R8ZihvAPMRypzrQ7i+L/I98WsGVtopIQ92+sKCxkmSuxlnoDI
	FTVlqOBftwCrjzLFrag7FeIZbxAqMLaZrP+FYNKfskkBsQ4BakT6oOG8schwBGHv43HhDgKiJmp
	uJr32kmzNZ0SrdFMHAiJrQBYOvoMMSdVJZ25eC5pus0VKYr+hvHMEkTkmWFcTFuTsZzglNaa/9n
	hSV+8kg8hMidfmDvFso0fggu3gZIsYFBa9Q8ZPS6woIRQhYDs6Acgaq4OmV2u+N7/q88A18g2OA
	kUosNuK4IZagB0/gbPGr9wnjnbAh1srTrZybl7K2uq7wdwOlA4uloztB7pgIW6V20b1OgOPWqKJ
	EjERQNWwvmy0wxP6I9R+1+L7u4/4c8G6l3DqfA6P8fdhAjTAadZBCuu8EKNQS78qR9/TsXwOt/+
	1x0BKG3cFVGFLA3eSjbFfExs5/0kppRCe4F5YeYHENOqkOT8fKhOLZGm5FILAD4uzAFjykMRdyF
	5svR0fatJ4U9l12jmTovcMub56KxZXZ4qPjaaB0RzHyxnS6meOpfAomTdIMIHZh/5d5Jnn0F4c6
	/Ejeg63UIQrMcEglBPfXrtpf8SQA/NifG43n2/e71vd/QtjtddahzBawh/MJErOaD6C+5gm+/+J
	Jf3pgHnPAzw==
X-Received: by 2002:a17:90b:1d03:b0:3b1:96fe:f5d2 with SMTP id 98e67ed59e1d1-3b41c9bacc7mr14862324a91.65.1795530707373;
        Tue, 24 Nov 2026 06:31:47 -0800 (PST)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm7171737a12.8.2026.11.24.06.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:31:47 -0800 (PST)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Amery Hung <ameryhung@gmail.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	"D . Wythe" <alibuda@linux.alibaba.com>,
	Dust Li <dust.li@linux.alibaba.com>,
	Sidraya Jayagond <sidraya@linux.ibm.com>,
	Mahanta Jambigi <mjambigi@linux.ibm.com>,
	Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	David Vernet <void@manifault.com>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org
Subject: [PATCH bpf 1/3] bpf: Reject sleepable programs in bpf-tcp-cc
Date: Tue, 24 Nov 2026 14:31:13 +0000
Message-ID: <20261124143123.1182108-2-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124143123.1182108-1-rhkrqnwk98@gmail.com>
References: <20261124143123.1182108-1-rhkrqnwk98@gmail.com>
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

A bpf-tcp-cc program can be loaded with BPF_F_SLEEPABLE, but the TCP
stack calls the congestion control ops in atomic context. For example,
tcp_set_ca_state() is called from tcp_v4_syn_recv_sock() in softirq with
the socket spinlock held.

bpf_tcp_congestion_ops has no check_member, so nothing rejects such a
program. Add one that rejects sleepable programs.

Fixes: 1e12d3ef47d2 ("bpf: Allow BPF_PROG_TYPE_STRUCT_OPS programs to be sleepable")
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 net/ipv4/bpf_tcp_ca.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/ipv4/bpf_tcp_ca.c b/net/ipv4/bpf_tcp_ca.c
index 2a71dc81562f..acd5e84a3dd9 100644
--- a/net/ipv4/bpf_tcp_ca.c
+++ b/net/ipv4/bpf_tcp_ca.c
@@ -208,6 +208,16 @@ static const struct bpf_verifier_ops bpf_tcp_ca_verifier_ops = {
 	.btf_struct_access	= bpf_tcp_ca_btf_struct_access,
 };
 
+static int bpf_tcp_ca_check_member(const struct btf_type *t,
+				   const struct btf_member *member,
+				   const struct bpf_prog *prog)
+{
+	if (prog->sleepable)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int bpf_tcp_ca_init_member(const struct btf_type *t,
 				  const struct btf_member *member,
 				  void *kdata, const void *udata)
@@ -335,6 +345,7 @@ static struct bpf_struct_ops bpf_tcp_congestion_ops = {
 	.reg = bpf_tcp_ca_reg,
 	.unreg = bpf_tcp_ca_unreg,
 	.update = bpf_tcp_ca_update,
+	.check_member = bpf_tcp_ca_check_member,
 	.init_member = bpf_tcp_ca_init_member,
 	.init = bpf_tcp_ca_init,
 	.validate = bpf_tcp_ca_validate,
-- 
2.56.1

