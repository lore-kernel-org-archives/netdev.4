Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205203;
	b=hLhpS+ST8Cqa4/XxPJ/XcNAfipmlreP97fXZqx1QaECEWHPhZk6fsp2mFg3cyiz1hKEQ
	 B/WSgqAEpGIu4zBckMxUQLMv5+C3cxmLrqFseNicoT37YXRVjn/FshpD8S+92TEh6q29l
	 QORLZItBDUFsE9pKbpcTMgUh+SlGXyl6cXiXVG3p7cxHnfXW/osiVRDhfwPXmOVL9jgWz
	 crtx/c5rKc4i08sKffREy8pr/Pr0XVYssQW7EPpYE1ebPs117hQU1nAYdHwfhMu7sjS3v
	 A3B1lDd1w2n5HXSOg4TJnNQhiiB2QwFQNz4toNHSzpo6KXGOLr5e5wXXwr9D8Afwoug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5VbTKyUQtrAhX3grORwqbl6JK+pg2ixihCAArXS2TXE=;
	b=GRk6M7V3YvPPyQ3zcz6qUT9w1FclwQrA9Sd5T2EclM8Wo+DOI230Ri/d/cwa7V/9UqNc
	 pehcEfLG9hbEWZ3ZM6bFPDfVxVQcZzZGvs84BUSGXMKjQU47wURp7aZPoGyVt67YfHRK3
	 zs/1WP5D2J7tXjBcIsEKZkCfU0s8jg2GvlJdkaH5jJeb7+GUg7mYE++3YBXL1Q6z3YR/E
	 TFS0ri2/2bodYGd2+JvUXCDJBkV+UAxjSvFDb+B1urclmexYSApq98Ph2NpNL1qwCBYUr
	 U5EXQTDTt9beCoV5DZ2cvCC4KGd/eeVG00A5q5TkbBu1Hq5UepC/R5ZG/0yebgsMi8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ViIAh6mj;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52D9606A6D9
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 20:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C52D9606A6D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ViIAh6mj
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ccca948203aso1454389a12.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795205200; x=1795810000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5VbTKyUQtrAhX3grORwqbl6JK+pg2ixihCAArXS2TXE=;
        b=ViIAh6mjzBzn9IlM0DwNU0438MM2fVuM9DDLogvaV1d6GAkYu2LI0tzY4FJy9uGQxS
         6bSlXKebplEx28kyQJdlhkZZA53gf3jUtAZrSq2FA6mr8DtC2TtQTh22x2p5jozMElep
         DMvkCWz7uLzHfdIpQafXEsP9ezmIlpqUbJ9GRxKOBGMNirDizuFWc+z2bH5o4C4BhxIZ
         Ilq/Ta1Qh0uUz/FDatdPeoaq06rmCWPblhWEFUMZBg+D0mqWjuam85s1zMEY9Elcrzu0
         xwfGrS6Z6GyzxemmbrBb+wsCEeBie0MQnmTN+ShNVfGm7TgxSXMVRcQyCw88Hg68cMFB
         Ww7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205200; x=1795810000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VbTKyUQtrAhX3grORwqbl6JK+pg2ixihCAArXS2TXE=;
        b=STEK1/vimIni5W5jz1LTPhypV+CPUAkWIrNz+2d66tZz8xiYsOioqZ4cVx41YPjtwE
         Um3X261orN22JoHGZOa75yijJbJOP+1YmYWMh1AUrwD7ktcSizQm13hMyL5KPNkfh0oS
         TZnSId6vS45ROvDIbrD6DAQBypA7OZ+g0p/yR9L5Mnsm9LtF2UZOC7fFOm1Gc9zH15q7
         IGERB5M3sm+A8OdNW1bASTrlfpdGQUOqPWbVre7wQ17pR0jFXQDgGCimVwBpCpWCxjtN
         XcIEz3Isz3tVU44O5r3Ul43FBo5cZjwUrwW7H+y/ZffpDyxAW9vHGiEA2Xd7vMR4l45e
         onlQ==
X-Gm-Message-State: APuU4Z/RUpXWQbLBLUB9QScDnizeIkDo0n51DIrjJCpOWxJtWFBmboRv
	ZP905z4d32YaSuNA06fjsCvVWmHA12hb7DJDEMQB/FM+k9vuOMLEyqXnkM+yT2iP4QX6REil57j
	kZQjLiaQ=
X-Gm-Gg: AYBFou22bSdvzmFIaAYCrwKfdhlhUUouh+2pu2mIOH2HkZkuJLmUpusHEltdkL+0W2n
	0jv6dEMLM2sop13kUntCwnkVlNK4ZoDFkHepajWgBfvEy7GjeMzarDkS1JFrZR7WoVtNPhKfirk
	aF+9XXmsAqTnUyLM5wyq6S0UgGTb0cCfgACJboJyCejUFq0ohW3jbVzl67uNOjy4yjj0vglmRBS
	UJB9O5c5DtigsdaUnmi853xb1j7hXesMJAa1RSS/jg45C8oStXL5KuQP9lQ1j+cCDvZZ6DdaRCm
	zQEzg77XwCRYiYFvO2o/BnBiI73Gco9aEDxuQMUAn9fvz0JVG/XTqZbXM+iSayqouKdVrrVKMzM
	xK4h059d4qB81QDyO5lefqt+JQDj+3VdxElmrkJaigdzYSQd+oCkPkteye9iSMA7UpPVutPrNxn
	gCIVnYMslIhde/azaiH5rPjJn4RQNlSn/+9ohVPh3U8GvyZBRPSuH5N6G6EVlKyfwwuzmGAG0xg
	t6x/4GKW4dI7O0pNVq1sKOxkddeX08Q0w8YWXR3bPwgLHvVD4MMQu8ItNZaAJs1JeFhRl+Gv3bL
	ZN6a1uDbDsUR9Qnf1wQRGFToAGHuifrXHlW/5q3PIjwUMHl0pES3Z8l74R7P8bjQxIqY
X-Received: by 2002:a05:6a21:e089:b0:3f9:20d7:984a with SMTP id adf61e73a8af0-4014a17aa71mr5227956637.13.1795205200153;
        Fri, 20 Nov 2026 12:06:40 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm1619282a12.18.2026.11.20.12.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:06:39 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	Yuen Su <zypulsecore@gmail.com>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC next-net 2/3] ipv4: accept the reported route type when deleting a blackhole nexthop route
Date: Fri, 20 Nov 2026 12:01:29 -0800
Message-ID: <20261120200635.95798-3-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120200635.95798-1-stephen@networkplumber.org>
References: <20261120200635.95798-1-stephen@networkplumber.org>
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

fib_dump_info() rewrites rtm_type to RTN_BLACKHOLE for a blackhole nexthop
object, before the nexthop_compat_mode bail-out:

	if (fi->nh) {
		if (nla_put_u32(skb, RTA_NH_ID, fi->nh->id))
			goto nla_put_failure;
		if (nexthop_is_blackhole(fi->nh))
			rtm->rtm_type = RTN_BLACKHOLE;

So rtm_type describes the nexthop object, not the alias, which keeps the
type it was created with. fib_table_delete() matches the stored type, so
the kernel won't delete a route using the type it just reported:

  # ip nexthop add id 301 blackhole
  # ip route add 192.0.2.0/24 nhid 301
  # ip route show 192.0.2.0/24
  blackhole 192.0.2.0/24 nhid 301 dev lo
  # ip route del blackhole 192.0.2.0/24 nhid 301
  RTNETLINK answers: No such process
  # ip route del unicast 192.0.2.0/24 nhid 301
  #

"ip route flush" echoes the dumped message back, rtmsg header included, so
it carries the rewritten type and fails with ESRCH. Because the rewrite
happens before the compat-mode check, this breaks flush even with
nexthop_compat_mode off, where there are no legacy attributes at all.

Accept RTN_BLACKHOLE on delete when the alias uses a blackhole nexthop
object, so a route can be removed using the type that was advertised.
"ip route flush type blackhole" works too: the type filter is applied to
the dump in userspace, so the kernel only ever sees the type it reported.

Dropping the rewrite in fib_dump_info() instead would change what every
existing dump reader sees.

IPv6 is unaffected, ip6_route_del() doesn't compare rtm_type.

Reported-by: Yuen Su <zypulsecore@gmail.com>
Link: https://lore.kernel.org/netdev/CAC9WPdwmM4=64DH5nY85srnLhRBS7PkjR9vrsALpob-GutbmZw@mail.gmail.com/
Fixes: 4c7e8084fd46 ("ipv4: Plumb support for nexthop object in a fib_info")
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 net/ipv4/fib_lookup.h    |  1 +
 net/ipv4/fib_semantics.c | 14 ++++++++++++++
 net/ipv4/fib_trie.c      |  2 +-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/fib_lookup.h b/net/ipv4/fib_lookup.h
index 0b72796dd1ad..5109cc197de2 100644
--- a/net/ipv4/fib_lookup.h
+++ b/net/ipv4/fib_lookup.h
@@ -40,6 +40,7 @@ struct fib_info *fib_create_info(struct fib_config *cfg,
 				 struct netlink_ext_ack *extack);
 int fib_nh_match(struct net *net, struct fib_config *cfg, struct fib_info *fi,
 		 struct netlink_ext_ack *extack);
+bool fib_type_match(u8 fc_type, const struct fib_alias *fa);
 bool fib_metrics_match(struct fib_config *cfg, struct fib_info *fi);
 int fib_dump_info(struct sk_buff *skb, u32 pid, u32 seq, int event,
 		  const struct fib_rt_info *fri, unsigned int flags);
diff --git a/net/ipv4/fib_semantics.c b/net/ipv4/fib_semantics.c
index db030bc26b6d..a089761e2104 100644
--- a/net/ipv4/fib_semantics.c
+++ b/net/ipv4/fib_semantics.c
@@ -1061,6 +1061,20 @@ int fib_nh_match(struct net *net, struct fib_config *cfg, struct fib_info *fi,
 	return 0;
 }
 
+/* fib_dump_info() reports a blackhole nexthop object as RTN_BLACKHOLE
+ * whatever type the alias has, so accept that type back on delete.
+ */
+bool fib_type_match(u8 fc_type, const struct fib_alias *fa)
+{
+	const struct fib_info *fi = fa->fa_info;
+
+	if (!fc_type || fa->fa_type == fc_type)
+		return true;
+
+	return fc_type == RTN_BLACKHOLE && fi->nh &&
+	       nexthop_is_blackhole(fi->nh);
+}
+
 bool fib_metrics_match(struct fib_config *cfg, struct fib_info *fi)
 {
 	struct nlattr *nla;
diff --git a/net/ipv4/fib_trie.c b/net/ipv4/fib_trie.c
index 523a5a4228d0..c67df5aa1b96 100644
--- a/net/ipv4/fib_trie.c
+++ b/net/ipv4/fib_trie.c
@@ -1726,7 +1726,7 @@ int fib_table_delete(struct net *net, struct fib_table *tb,
 		    (fa->fa_dscp != dscp))
 			break;
 
-		if ((!cfg->fc_type || fa->fa_type == cfg->fc_type) &&
+		if (fib_type_match(cfg->fc_type, fa) &&
 		    (cfg->fc_scope == RT_SCOPE_NOWHERE ||
 		     fa->fa_info->fib_scope == cfg->fc_scope) &&
 		    (!cfg->fc_prefsrc ||
-- 
2.53.0

