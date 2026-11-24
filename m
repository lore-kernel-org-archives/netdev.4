Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530715;
	b=n85KnPwmDNlyx8cWLjGIqDIanm788AJe9InLXi0HupczRucejJJDvrcJouAeNI3COaPJ
	 rst1x6MY6bnf1znHs60XXCwvOL2CuZnHfYWx0Qrm36fRb6R5ZXQAi9WrQgWWmTGwyjEWi
	 NiBVneEUHirZa/898zRkXBYBrPtL0+qe/3pD3Ef8H3nmmF3qloUk1kCMEhTbxckwE9SMF
	 TZzkYsEGs/s82ooDptOrElmAKRMUQB5AmIAYgX/cBcBHmSC106JoCe43ZFODQx7iy2x4H
	 3tTpq3AJWj0iDQR3rvsC541qS98x4xvSqndamCX0O2tDcRIBIVcS1HGrZbWS6Em8ENA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uZ2nv19VYG29QEUsKhjFZiIjPyzoB2HzMjwa1gkZtBE=;
	b=rvJzCCqPwXEQImZUReFI/hGK7Qu6/iupOY31gAjh10apWNsZ8EGadAwFKWL57fLniT9A
	 NSIt0CWt1DNVxmLxpLsl+tZ41UpAFLlTf7a71PoOFEE0LyLmnnolrH8wquBhzaVbrsk3m
	 MZnRfLyyRcisNm1ar7aTMDyoopUqcKLS9waLTd/FL3YuazVmRa/ZArIdAcuPcORshQKhw
	 Eze0wIL1bpoYjwLGMm5k5DX8nQone6v9b59PcXmYAPvQpQVIW7TjKn8GQ9PPxGyRZCw03
	 O+M7U1N7j901sb8oxwKZIFTMb7REOlpELW+F1JtGjl1H2TH4lHEF8S9Dsxr7NbVYjTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZFPSpwn;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347AD606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 347AD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZFPSpwn
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so3727334a91.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795530714; x=1796135514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZ2nv19VYG29QEUsKhjFZiIjPyzoB2HzMjwa1gkZtBE=;
        b=eZFPSpwn+EWv3WI7oq8FlcFGbwsio7In32Q9BXJj5JT7LzvUi+kuUNm1OptvAjCIym
         aF8gEZ7GN0JzTzjRlSQ3RzWTQdd1+ELxeIAcrsblcQ1cDQsbrRnXpt+qp6NBBwMlAAlI
         8dmX7Soe+UgAiA/D0pjjKxJ71j8a3BiSOsVHvYDirhOXjv2CCz65FPRAx2J+gZxPH3X/
         Wfji9sW+KxmqfmoK0xns6FC+klWB+WlypOLzUqUiwa+utnziBtEUEndtzhsyOeCrhJMH
         CUAU99cpqBKX1trCjELPtos3AEXJ5UWjnA8HDPZIaR5qYjzl/vWzUSFJR2woUvkguqGi
         L9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530714; x=1796135514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uZ2nv19VYG29QEUsKhjFZiIjPyzoB2HzMjwa1gkZtBE=;
        b=vDBOrHGacb6JuXi3iMvQyd5nGlGgGC4dBLaF6kwSMNVGS8WJH2GkeZNEX4W71/FgfM
         Vg8xuCRlZ3oxap1v/RKGyHIBh3Goy8Xv6isQkgxDhLfOPXS2J/+b5O4c+BMM+JzUZ5kf
         rpDEeQWQb8PGkQNUghndpabATpRwAasmD9KJstFrY4EwdW8DeEBXEq2nOt1Yj5pn2vgz
         RQmfSuVMK/kdtQurXfdZBsE17x7e8vfmYRHirXBmvvZaQxBecn04F5uaFLFdlaovM6dy
         UO3Hb5QtC73HwTwp0MQw1TQmCzJIVgoYt93Yb/FMF7EpDeZZnB7em/W7GuDbH4t4djtB
         LPjg==
X-Forwarded-Encrypted: i=1; AL+hErGpI/rPzwILOwXD07Sn6Kq5B4aZa4PGQzmjdr3IqX1Dwpltlqs6/9NQE/s7owjZJrlgE/xAQHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uPhlvGFT6yct/eUoM800DaZfxK+mRo8+aRDdq188ZGlZYht9B
	CbMa9jJ5kKf4qXpMrCMe0SnhNF7mducxMt9n0T2FAWFQDPtPo/lrIWRh
X-Gm-Gg: AZFdTZeBUTaeA+wAQtQR551SFhiPQSMYmK7dNgweSz+qGVWJJaRT3vlLvXVlVdsMapq
	zJhx+OdMj5H8voyUK12Hy6v4r4FgSzMaZKTqoAnJSNwEtpEHt/PL+/1ww9cJhlIucIf06/gW1c8
	c/rwKTnty4ilyn/3tKzxWtqVy9hNZsPTr9hR/qvodRi6/FKY0aBF2At74JvqG2FL4m+h9REMFFm
	AveiTqMS1wQbpmwoiFtss03mxc5bMUWWxUADbW5i6ZMl/z3WZRAHhZAc+2x+7RN7QOHdDEvRrO2
	f6gx1SfaHJzGk3ab9reZrvbhtos9NcatArHjOEXVg8w/w+3KUo9W2Gn9x5UVA3UAc6cA5fInTPB
	vxzCEPPAP8DhqxoonbqAzmZde9HUyKV8tgAJP14UrePBL2iogFTzj5H9P5cU55duPA92rlUNbgT
	2i9ofaUAvKz2p0gqLxH6EprfxYbxtcbZZ1a0rntuURRJOSPZy3v9FyAI8T0/RE2mhVx/tLSNKlx
	yjmehCHSTeIKVBuXrdOc7+GoUctTrKOHndCVl1JltntlYtiRPlaWsYxm5wCtpdke39BJnlv9dfB
	ODG/NVapLr3Yv6Ti+HQ6Y3T6ibH1xnjU1mg9TIwGrWVqYjz5j9/xL8SGndtvzvOY
X-Received: by 2002:a17:90b:4ad2:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3b41c99525fmr14250279a91.58.1795530714346;
        Tue, 24 Nov 2026 06:31:54 -0800 (PST)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm7171737a12.8.2026.11.24.06.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:31:53 -0800 (PST)
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
Subject: [PATCH bpf 2/3] bpf: net_sched: Reject sleepable programs in bpf qdisc
Date: Tue, 24 Nov 2026 14:31:14 +0000
Message-ID: <20261124143123.1182108-3-rhkrqnwk98@gmail.com>
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

A bpf qdisc program can be loaded with BPF_F_SLEEPABLE, but enqueue and
dequeue run with the qdisc root lock held and BH disabled.

bpf_Qdisc_ops has no check_member, so nothing rejects such a program.
Add one that rejects sleepable programs.

Fixes: c8240344956e ("bpf: net_sched: Support implementation of Qdisc_ops in bpf")
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 net/sched/bpf_qdisc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/sched/bpf_qdisc.c b/net/sched/bpf_qdisc.c
index 5691c13781a8..3dbe52a04fa2 100644
--- a/net/sched/bpf_qdisc.c
+++ b/net/sched/bpf_qdisc.c
@@ -356,6 +356,16 @@ static const struct bpf_verifier_ops bpf_qdisc_verifier_ops = {
 	.gen_epilogue		= bpf_qdisc_gen_epilogue,
 };
 
+static int bpf_qdisc_check_member(const struct btf_type *t,
+				  const struct btf_member *member,
+				  const struct bpf_prog *prog)
+{
+	if (prog->sleepable)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int bpf_qdisc_init_member(const struct btf_type *t,
 				 const struct btf_member *member,
 				 void *kdata, const void *udata)
@@ -446,6 +456,7 @@ static struct bpf_struct_ops bpf_Qdisc_ops = {
 	.reg = bpf_qdisc_reg,
 	.unreg = bpf_qdisc_unreg,
 	.validate = bpf_qdisc_validate,
+	.check_member = bpf_qdisc_check_member,
 	.init_member = bpf_qdisc_init_member,
 	.init = bpf_qdisc_init,
 	.name = "Qdisc_ops",
-- 
2.56.1

