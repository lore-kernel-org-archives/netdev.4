Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533184;
	b=dRh7X8OmoLwDoPFLwEvSYdgXE6vcF2mrYl2kIpfFRq9OAu03vGXyPxZAjtJ/8ZsidbUS
	 XYBrMDlmvBre9xX+bUpzQcbo6sBxN0SU/QWTydWGh10zwRxVjI5IRbOYmBQJSIl/H4ioy
	 Z7DIIbGaao9vTjfNwJvk4IoxwcfAcgIK1+dY0RXB/pQrhqT7G9u+tdRjNZcaAiTdlM4HC
	 m2lmW8tGpwcOiWvutMBTaWqVGVDTC5/FXkdeD+RDXieWSb1LQ2wx4UAXUHmK4mZs7XZO5
	 MYeV6Pp0pb3jEgFYIOT3kRSqNzQ5kRBuIW8SJxqUiv5knTdf5EOEcSDYyIOAQFpvhXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vpd0lROsX5a/XF56z2hf5LS7nxFovlUX1TJjxvTaxHs=;
	b=TIKHSh60MfRy2shBA5hXf1JrYRjvaOQ1tLqIMTPdRgYBxTogmIUK7YukO0bT62q18AXH
	 hFaj3QPeN7syW4eDDb6jFX0MuohzJ0ygXBIAwvVtGOnp98sh4tleiyQY25ZwZo6z0E8jy
	 2qHDVg+2xCshjvNE1afiPfpe9MMcrlYX5fHBYwtTIm8DBnSv7EnN3QzPNl+N8yXqZvE7a
	 3GnZzv4iLuDs4Veq9x22fNoTwCLVzHQlZemi7Me8iZJBiZh9rnROVp9IirdPhl+KDOmxo
	 i0t8mh/yzcZbjzHHl9FPmAG+VIspC0G8gDDSymJqAHHDgtwK05AiBp4QlNWez6EWMjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=H7SZps7d;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DE1606A334
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DE1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=H7SZps7d
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso56692515e9.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795533182; x=1796137982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpd0lROsX5a/XF56z2hf5LS7nxFovlUX1TJjxvTaxHs=;
        b=H7SZps7dlT2FpBTrfNfi1083KMNJ6FiEwqlfaapdzLdWZBI+eeY1Pb6ifPToJr7B/K
         vQbD11jgSjp/S27apFzaF+EhrM+K50VmbgQ8hYz/sQIp4tcYP4H0avpBpNcvmj9d1/w4
         6HFQrkIMlzUJXuaIufsTJGnKy68XrhN5h+st0203hwZU6Vf6UWz0Slc1j2Btf/hILZ98
         ESj0LVOCEW2c8lMpNn+9hh1nHkcVpMu1zLS5+LTePpzX8O+bllmzvUe7WRJ4bLe6S5ye
         mY9wdv2ojMEzwpyixY4ElFWst1uf7BcRod9xjmQBqCXDwIGrCgpAqWhxIsggYFOcAcEt
         yOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795533182; x=1796137982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpd0lROsX5a/XF56z2hf5LS7nxFovlUX1TJjxvTaxHs=;
        b=eDf2wYRyu5Wm+uyZ2LBzxWugJR+GT5xABf46WWOtGmkpNPADBWvpcKCyv85DcmUHJ+
         /BEsED3scCNNF1BCQ7fxklKAyu2mOCtoRDqkzoPkzflXLM81Mce5HRLGTnMc2j62GH8n
         JCJMZ7gaISlnkl3H5chq8mquIqMoBmuoqcJWimvBfJEBo2LkJIir7qfh6aLrhFtUNBAW
         8fqb1Cw4EtVWvi7ak5mq8KSCGe7/mnT5dGZMd3qKXF9ksljCebpYnGls+ovWNRb6uHA2
         oueuN0g7nRwch/iwGXwCk2Enbqnzx4mzKzg2kU8kMV8/h/b52V9fNtMWKIFHETuL69qE
         wPwQ==
X-Forwarded-Encrypted: i=1; AL+hErFaMPnJ246smCan9w50iSof2LKGc5z9frobiY8KIwKdVS166oBp8760oHxCD1v2+Fp4n1LhF2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+htDQd8Rnj30B9SSJWggZqwfc/24W/k646jKPdow8saWBE7Q0l
	UCkdoOnWE2XwjWVranNSkFTeCpOdutOHourIjYCxGYT4tgbzc6u0kfKBLYm6kdCP7jA=
X-Gm-Gg: AZFdTZeNHrvyVagIhvNn9AcxlHT/JCaMS9DR2grO00NpKNp3CsZ7ToJ1DW7+9gxYY8l
	VXj5KfH3wJo1xfLAiLudsfqNqywL+mRoAAg30Btm9kv+w7gQMMpZIhjtU/I7AJQZHrhN37PdU3G
	NLR+cNotMzDnEbdw5lxjQ1Z0E/Pjt3OODMQHUEbT78Ijrlj0kz+1l5p23g09vizDXtTWYyBESXz
	KaZ4e23DzR/ETXKirnCoi/sJwXqcWQSoolwv0mnLQeT8R1014be/iaVwGwKJZnANRfiIlUxLIQ0
	qjEWGQcC95TA+Z8VxRVNv5d5VBu0dxpCQoO0ql+W7qbnMzNGd6kjfJ8QtGuCLNJH9PahRolSA/B
	oDBBsQktU/BWjquKDvxYNrYDR5jYrb8R9YH/lfCS/aCD4yEv9hzJaOBnD/CFHHO7FwBiY3iuXdW
	8ElRj8/BAVk3/oWk73tdskoyn06+wndGk0SKXUqkH+H1NcV8lTCqAE4YlYDRuC2alVjuCe+jyz+
	4Ytfm1ghDCroEf2fZjLachGchltv86AKksDSo0NTvBzPjgA7KhX3uch1WopP3X9lC9OfqY1g2Ux
	uDtS8qtdNDFvBh+WjXpoFKHVc+Orcfw1y5+eiTgrsPDmmVXMu7Y=
X-Received: by 2002:a05:600c:820c:b0:4bb:7987:fbbc with SMTP id 5b1f17b1804b1-4bb887c29b4mr273103965e9.1.1795533182447;
        Tue, 24 Nov 2026 07:13:02 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906e4ce6sm244162175e9.4.2026.11.24.07.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:13:01 -0800 (PST)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: bpf@vger.kernel.org
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>
Subject: [PATCH RFC bpf-next 3/4] bpf: support bpf_sk_assign in netkit tx path
Date: Tue, 24 Nov 2026 17:12:43 +0200
Message-ID: <20261124151244.1423343-4-razor@blackwall.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124151244.1423343-1-razor@blackwall.org>
References: <20261124151244.1423343-1-razor@blackwall.org>
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

Let netkit programs assign a socket in the receiving network namespace,
for example a transparent proxy listener on the host for traffic coming
from a pod.

A netkit program runs with skb->dev already set to the peer and on
NETKIT_PASS the skb goes straight to __netif_rx() on that peer. The
assigned skb therefore doesn't travel the tx path of the sending side, so
transmit code doesn't need to understand the new ownership.

General tc egress assignment stays unsupported.

netkit records the skb it is running programs for in the BPF net
context and the helper only takes the netkit path for that skb.
A clone made with bpf_clone_redirect(), test runs, cls_bpf and act_bpf on
egress still get -EOPNOTSUPP.

The backlog queue outlives the RCU section so the skb takes a reference
with sock_pfree_ref even for SOCK_RCU_FREE sockets such as tcp
listeners.

Signed-off-by: Nikolay Aleksandrov <razor@blackwall.org>
---
 drivers/net/netkit.c           | 10 ++++++++++
 include/linux/filter.h         |  4 ++++
 include/net/netkit.h           | 15 +++++++++++++++
 include/uapi/linux/bpf.h       |  9 +++++++--
 net/core/filter.c              | 13 ++++++++++---
 tools/include/uapi/linux/bpf.h |  9 +++++++--
 6 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/drivers/net/netkit.c b/drivers/net/netkit.c
index 75a1a561e5aa..d32d98cad6f6 100644
--- a/drivers/net/netkit.c
+++ b/drivers/net/netkit.c
@@ -53,15 +53,25 @@ static __always_inline int
 netkit_run(const struct bpf_mprog_entry *entry, struct sk_buff *skb,
 	   enum netkit_action ret)
 {
+	struct bpf_net_context *bpf_net_ctx = bpf_net_ctx_get();
 	const struct bpf_mprog_fp *fp;
 	const struct bpf_prog *prog;
+	struct sk_buff *prev = NULL;
 
+	if (bpf_net_ctx->ri.kern_flags & BPF_RI_F_NETKIT_SK_ASSIGN)
+		prev = bpf_net_ctx->sk_assign_skb;
+	bpf_net_ctx->sk_assign_skb = skb;
+	bpf_net_ctx->ri.kern_flags |= BPF_RI_F_NETKIT_SK_ASSIGN;
 	bpf_mprog_foreach_prog(entry, fp, prog) {
 		bpf_compute_data_pointers(skb);
 		ret = bpf_prog_run(prog, skb);
 		if (ret != NETKIT_NEXT)
 			break;
 	}
+	if (prev)
+		bpf_net_ctx->sk_assign_skb = prev;
+	else
+		bpf_net_ctx->ri.kern_flags &= ~BPF_RI_F_NETKIT_SK_ASSIGN;
 	return ret;
 }
 
diff --git a/include/linux/filter.h b/include/linux/filter.h
index 61448be53f8d..ddc4e6912e0c 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -981,6 +981,7 @@ struct bpf_nh_params {
 #define BPF_RI_F_CPU_MAP_INIT	BIT(2)
 #define BPF_RI_F_DEV_MAP_INIT	BIT(3)
 #define BPF_RI_F_XSK_MAP_INIT	BIT(4)
+#define BPF_RI_F_NETKIT_SK_ASSIGN	BIT(5)
 
 struct bpf_redirect_info {
 	u64 tgt_index;
@@ -998,6 +999,9 @@ struct bpf_net_context {
 	struct list_head cpu_map_flush_list;
 	struct list_head dev_map_flush_list;
 	struct list_head xskmap_map_flush_list;
+#ifdef CONFIG_NETKIT
+	struct sk_buff *sk_assign_skb;
+#endif
 };
 
 static inline struct bpf_net_context *bpf_net_ctx_set(struct bpf_net_context *bpf_net_ctx)
diff --git a/include/net/netkit.h b/include/net/netkit.h
index 9ec0163739f4..70992f145a63 100644
--- a/include/net/netkit.h
+++ b/include/net/netkit.h
@@ -4,6 +4,7 @@
 #define __NET_NETKIT_H
 
 #include <linux/bpf.h>
+#include <linux/filter.h>
 
 #ifdef CONFIG_NETKIT
 int netkit_prog_attach(const union bpf_attr *attr, struct bpf_prog *prog);
@@ -11,6 +12,15 @@ int netkit_link_attach(const union bpf_attr *attr, struct bpf_prog *prog);
 int netkit_prog_detach(const union bpf_attr *attr, struct bpf_prog *prog);
 int netkit_prog_query(const union bpf_attr *attr, union bpf_attr __user *uattr);
 INDIRECT_CALLABLE_DECLARE(struct net_device *netkit_peer_dev(struct net_device *dev));
+
+static inline bool netkit_runs_skb(const struct sk_buff *skb)
+{
+	struct bpf_net_context *bpf_net_ctx = bpf_net_ctx_get();
+
+	return bpf_net_ctx &&
+	       (bpf_net_ctx->ri.kern_flags & BPF_RI_F_NETKIT_SK_ASSIGN) &&
+	       bpf_net_ctx->sk_assign_skb == skb;
+}
 #else
 static inline int netkit_prog_attach(const union bpf_attr *attr,
 				     struct bpf_prog *prog)
@@ -40,5 +50,10 @@ static inline struct net_device *netkit_peer_dev(struct net_device *dev)
 {
 	return NULL;
 }
+
+static inline bool netkit_runs_skb(const struct sk_buff *skb)
+{
+	return false;
+}
 #endif /* CONFIG_NETKIT */
 #endif /* __NET_NETKIT_H */
diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 62de0919db72..25f89f3cca1e 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -4611,7 +4611,10 @@ union bpf_attr {
  *		**bpf_clone_redirect**\ () or other methods outside of BPF may
  *		interfere with successful delivery to the socket.
  *
- *		This operation is only valid from TC ingress path.
+ *		This operation is valid from TC ingress and from netkit
+ *		programs. In netkit programs, only full TCP and UDP sockets
+ *		are accepted, and the *skb* then holds a reference on *sk*
+ *		until the receive path consumes it or the *skb* is freed.
  *
  *		The *flags* argument must be zero.
  *	Return
@@ -4624,7 +4627,9 @@ union bpf_attr {
  *		**-ENETUNREACH** if the socket is unreachable (wrong netns).
  *
  *		**-EOPNOTSUPP** if the operation is not supported, for example
- *		a call from outside of TC ingress.
+ *		a call from outside of TC ingress or netkit programs, or, in a
+ *		netkit program, a socket other than a full TCP or UDP socket or
+ *		an *skb* that already carries a socket it does not own.
  *
  * long bpf_sk_assign(struct bpf_sk_lookup *ctx, struct bpf_sock *sk, u64 flags)
  *	Description
diff --git a/net/core/filter.c b/net/core/filter.c
index 3206b40887c5..a8e7b46bd648 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -8132,21 +8132,28 @@ static const struct bpf_func_proto bpf_tcp_gen_syncookie_proto = {
 
 BPF_CALL_3(bpf_sk_assign, struct sk_buff *, skb, struct sock *, sk, u64, flags)
 {
+	bool from_netkit = netkit_runs_skb(skb);
+
 	if (!sk || flags != 0)
 		return -EINVAL;
-	if (!skb_at_tc_ingress(skb))
+	if (from_netkit) {
+		if (!sk_fullsock(sk) || (!sk_is_tcp(sk) && !sk_is_udp(sk)) ||
+		    (skb->sk && !skb->destructor))
+			return -EOPNOTSUPP;
+	} else if (!skb_at_tc_ingress(skb)) {
 		return -EOPNOTSUPP;
+	}
 	if (unlikely(dev_net(skb->dev) != sock_net(sk)))
 		return -ENETUNREACH;
 	if (sk_unhashed(sk))
 		return -EOPNOTSUPP;
-	if (sk_is_refcounted(sk) &&
+	if ((from_netkit || sk_is_refcounted(sk)) &&
 	    unlikely(!refcount_inc_not_zero_acquire(&sk->sk_refcnt)))
 		return -ENOENT;
 
 	skb_orphan(skb);
 	skb->sk = sk;
-	skb->destructor = sock_pfree;
+	skb->destructor = from_netkit ? sock_pfree_ref : sock_pfree;
 
 	return 0;
 }
diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
index 62de0919db72..25f89f3cca1e 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -4611,7 +4611,10 @@ union bpf_attr {
  *		**bpf_clone_redirect**\ () or other methods outside of BPF may
  *		interfere with successful delivery to the socket.
  *
- *		This operation is only valid from TC ingress path.
+ *		This operation is valid from TC ingress and from netkit
+ *		programs. In netkit programs, only full TCP and UDP sockets
+ *		are accepted, and the *skb* then holds a reference on *sk*
+ *		until the receive path consumes it or the *skb* is freed.
  *
  *		The *flags* argument must be zero.
  *	Return
@@ -4624,7 +4627,9 @@ union bpf_attr {
  *		**-ENETUNREACH** if the socket is unreachable (wrong netns).
  *
  *		**-EOPNOTSUPP** if the operation is not supported, for example
- *		a call from outside of TC ingress.
+ *		a call from outside of TC ingress or netkit programs, or, in a
+ *		netkit program, a socket other than a full TCP or UDP socket or
+ *		an *skb* that already carries a socket it does not own.
  *
  * long bpf_sk_assign(struct bpf_sk_lookup *ctx, struct bpf_sock *sk, u64 flags)
  *	Description
-- 
2.47.3

