Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795582297;
	b=j/lAFr8eYcjzzl/yrf6vI9qi3jY+40FgandVdTJnx+y4FLwFot2Idf13lJxl+hxDttG+
	 Qg7RQ+nrxNZe7gdfMn4Yp0wQjAguB33VHHENi+WHqAEOAh8qtsUJdgKUHI3XlXkr223Ph
	 7k9c1oJWrZ+UBkWrOn5Oclhk/zMf4ZYLgQsI6UrPerAPcBXbAScsvzM08XpR345gOn3Qk
	 5ImKSzmWnJJJGM00e8lojPKJvDux2iCYpI2tEARETW9ldNSnkdEAYyGdgm/GtFML9uGqg
	 3h38JK3JqLZUT5LCfnh6S2cX22+dZO25EmYHU3dJUpA4EU3AF8/rGO3z1Z2uxrrer0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795582297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XO4TrpK9P96uCfE9RUiQZD2WOyvv7UkLXAlskXveiYg=;
	b=hpC8VcyV65ZHWesFKlfZITdpRD8ltn/BWkYeRivnXDjfBw14PC/30bIWMwrssm5mYHRx
	 4yvK6MkGX7R4tqt3Ct0a7ShbnFkozj0QWcgvmwN4PUcW1lkxMNQ8iXSO4fZAD5OmkundU
	 T4riUdlkIv7qYgIxrYYthA7Ncl3YSgpIKP/sOTp7qTiFzsYS+vwrU5GOS38DSgSGo1m5q
	 J6qOA9lGsfGPxlU6Pqv8A8SKWKzyeAHu+hudqfv4D2VGFCHWNcbctNiYPfBAONuDGwx1Z
	 LF12BWkYxHqs2KuggX4vJjbC+UjUt1Rz2PM0G94pxs2a0f4kV1vmAMSwoIebJDiV6+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=McoupJE6;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC337606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 04:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC337606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=McoupJE6
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so2252196a91.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795582296; x=1796187096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XO4TrpK9P96uCfE9RUiQZD2WOyvv7UkLXAlskXveiYg=;
        b=McoupJE6wFfgw5zfTpObm4Yqn1QNI/cTFKc6lB8T6YoB0iuTcnCCjvOMj3Ch8puAnA
         DyUDOkRXRv95zl1I73oN+tePX2MBItkbp6/x2/RhD70SiwnW2UZBU3rlFkqmDIKkfmvH
         fxMHfYQ79v23fyyi1XvIHiN+uXteKV5jCoURlmhFsvXxRAfIr2cdchzTYPUgEdNjf40F
         7lsKXVSVgrvWTkiRDIInkGPU3Ap9hglh5xTrgOxmBnXQTzRaIyw/bSpO1NK+F/BIu5zX
         YBCX7iMYxRv9R+k3Tatp1CGyXzzc/0OkiIg7AnZZ/8U+gtwnIkEONyabaf2owP4oP2yr
         +Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795582296; x=1796187096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XO4TrpK9P96uCfE9RUiQZD2WOyvv7UkLXAlskXveiYg=;
        b=IUktg6uezwap4HVONHupkwmLGidiD+rmTABKUCP5/zO5K9asWeSBV7Mhc6Tu4yHSFx
         1v8KSY0eG2xCtDWKkR2FSAeIkDTkwkjnWrLZ/K/oHSBnOqO5+1YAo68BWtHK/0YOTN3r
         1l6n1yElma0SO1moYkuZlcHgL+Te5l7ZckujadpmDU4qkyrhz3/c5/0J1JFlNeRyfosd
         jUrZELUHUGFv3XKkL6+obx8QFCd3bSMLRp7l7dGa77mMyTJ5Q/AYX0de145sG0C0o4Oy
         wQ/N7DTwuoMQRTrmkiuYW12M6mLAd7NSn67cSeK7FEfwiqMb+TR8eOC9fdkw/jMDA47G
         SosA==
X-Forwarded-Encrypted: i=1; AL+hErEODsbJaMrBjk6wu4oX+IfA8QJ/aWpUrTuto0ipsfdHJ7fZ5l4/QXCO7D6h9SZ1c9ArxyqNYAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wsKfaftTzKUAEejCx5hop7h9aKHjwhS8f+uyzutbLFjBqpUx4
	z8vDj9Lc9kGU3igNc0S+yuISQJ8eAGQf+bDGps/Opil+hCTvmd5JVpSa
X-Gm-Gg: AZFdTZcQwsagQ4C26ZgBe4PHbBu5YKev+lNnaKt51rqpoDTpzDulnefm24CKU9FypEt
	o6xah4+dkT5ewjnnPfYDA1fmXFWBdzQNLnoBouNIiG6zd5KylVXpS6s6MOU7Xy1hkBSkH8BBW56
	KK66YiatBIUlANnge8GNN0XuNJ+f6afyJE9cEC5ylbtU/UXV5eh7CGGQ9mP4JUCP2U97QYHlg00
	mry/A8C4/tCYGjjG69RaMe5ZSkpJ4dBBuELukWGTIP+NJOlGy+Z5lOd+GnqgUpVIzUVCFscsCGd
	/urCsJ5yjv0tg7+6/L/r0RY+Kyy+9pH/Xz+iQYmJwdtYaN0SQXG1KgE2cMvNLFh9Fe7F73jt1Tr
	kO+OC+Hwjjq7a5I0NUv9otskbO8/zSYO9DG3sJw6t3PeS9H2q+im8sa0KoC+z0Y+UwIifBRWj9l
	TBnRjMartR0MQfHSjMQtuQJsvuuBzvj7AKeSVDNfLpMEPZtfsCKRDOx+vZnfwaIVqyGcaFKbTlW
	3DMP42LJz+NYjckl02uQYAH/5ehYd0DiietuqsLWKesKGhqtZpYcAw8XdlwK4Jggrc927TVTzGk
	ej/dcSdpO+K86MRYWH0R2GuKqiZfNQ+A0S81tD6QIBjj7SdtBmPE6eUylFgyIYpb
X-Received: by 2002:a17:90b:4ccb:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b41c7b67femr15911910a91.3.1795582295961;
        Tue, 24 Nov 2026 20:51:35 -0800 (PST)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm9457209a91.5.2026.11.24.20.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:51:35 -0800 (PST)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Amery Hung <ameryhung@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	"D. Wythe" <alibuda@linux.alibaba.com>,
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
Subject: [PATCH bpf-next v2] bpf: Reject sleepable struct_ops programs without check_member
Date: Wed, 25 Nov 2026 04:50:52 +0000
Message-ID: <20261125045105.2326120-1-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Any struct_ops program can be loaded as sleepable, and it is up to each
struct_ops to reject that in check_member. tcp_congestion_ops, Qdisc_ops
and smc_hs_ctrl have no check_member, although the kernel calls most of
their members in softirq, under a spinlock or under rcu_read_lock(). A
sleepable program attached there is entered through
__bpf_prog_enter_sleepable(), and lockdep reports "BUG: Invalid wait
context".

Reject sleepable programs in the verifier when the struct_ops has no
check_member, and drop the check in bpf_tcp_ops that is now the
default. Qdisc_ops init and destroy run under rtnl and can sleep, so
give bpf qdisc a check_member that still allows sleepable programs
there.

Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
v2:
- Fix the default in check_struct_ops_btf_id() (Alexei)
- Keep sleepable Qdisc_ops init and destroy (Alexei)
- Target bpf-next

v1: https://lore.kernel.org/bpf/20261124143123.1182108-1-rhkrqnwk98@gmail.com/

 include/linux/bpf.h    |  3 ++-
 kernel/bpf/verifier.c  |  4 ++++
 net/ipv4/bpf_tcp_ops.c | 11 -----------
 net/sched/bpf_qdisc.c  | 19 +++++++++++++++++++
 4 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 4e9a4d15af0e..95835534b065 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -2253,7 +2253,8 @@ struct btf_member;
  * @check_member: When defined, a callback invoked by the verifier to allow
  *		  the subsystem to determine if an entry in the struct_ops map
  *		  is valid. A nonzero return value means that the map is
- *		  invalid and should be rejected by the verifier.
+ *		  invalid and should be rejected by the verifier. When not
+ *		  defined, the verifier rejects sleepable progs.
  * @init_member: A callback that is invoked for each member of the struct_ops
  *		 map to allow the subsystem to initialize the member. A nonzero
  *		 value means the member could not be initialized. This callback
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index e7013ed8cadd..8c7e43220df3 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -23934,6 +23934,10 @@ static int check_struct_ops_btf_id(struct bpf_verifier_env *env)
 				mname, st_ops->name);
 			return err;
 		}
+	} else if (prog->sleepable) {
+		verbose(env, "member %s of struct %s cannot be sleepable\n",
+			mname, st_ops->name);
+		return -EINVAL;
 	}
 
 	if (prog->aux->priv_stack_requested && !bpf_jit_supports_private_stack()) {
diff --git a/net/ipv4/bpf_tcp_ops.c b/net/ipv4/bpf_tcp_ops.c
index 2ba73dd6c52c..4e54165a3928 100644
--- a/net/ipv4/bpf_tcp_ops.c
+++ b/net/ipv4/bpf_tcp_ops.c
@@ -301,16 +301,6 @@ static int bpf_tcp_ops_init_member(const struct btf_type *t,
 	return 0;
 }
 
-static int bpf_tcp_ops_check_member(const struct btf_type *t,
-				    const struct btf_member *member,
-				    const struct bpf_prog *prog)
-{
-	if (prog->sleepable)
-		return -EINVAL;
-
-	return 0;
-}
-
 static int bpf_tcp_ops_init(struct btf *btf)
 {
 	return 0;
@@ -329,7 +319,6 @@ static const struct bpf_verifier_ops bpf_tcp_ops_verifier = {
 static struct bpf_struct_ops bpf_tcp_ops = {
 	.verifier_ops = &bpf_tcp_ops_verifier,
 	.init_member = bpf_tcp_ops_init_member,
-	.check_member = bpf_tcp_ops_check_member,
 	.init = bpf_tcp_ops_init,
 	.validate = bpf_tcp_ops_validate,
 	.name = "bpf_tcp_ops",
diff --git a/net/sched/bpf_qdisc.c b/net/sched/bpf_qdisc.c
index 5691c13781a8..61a19713c5ec 100644
--- a/net/sched/bpf_qdisc.c
+++ b/net/sched/bpf_qdisc.c
@@ -356,6 +356,24 @@ static const struct bpf_verifier_ops bpf_qdisc_verifier_ops = {
 	.gen_epilogue		= bpf_qdisc_gen_epilogue,
 };
 
+static int bpf_qdisc_check_member(const struct btf_type *t,
+				  const struct btf_member *member,
+				  const struct bpf_prog *prog)
+{
+	u32 moff = __btf_member_bit_offset(t, member) / 8;
+
+	switch (moff) {
+	case offsetof(struct Qdisc_ops, init):
+	case offsetof(struct Qdisc_ops, destroy):
+		break;
+	default:
+		if (prog->sleepable)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int bpf_qdisc_init_member(const struct btf_type *t,
 				 const struct btf_member *member,
 				 void *kdata, const void *udata)
@@ -446,6 +464,7 @@ static struct bpf_struct_ops bpf_Qdisc_ops = {
 	.reg = bpf_qdisc_reg,
 	.unreg = bpf_qdisc_unreg,
 	.validate = bpf_qdisc_validate,
+	.check_member = bpf_qdisc_check_member,
 	.init_member = bpf_qdisc_init_member,
 	.init = bpf_qdisc_init,
 	.name = "Qdisc_ops",
-- 
2.56.1

