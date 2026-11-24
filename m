Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530722;
	b=JpmGzCXMsAJKJs5J62qWuKZr/5WQqiNAjXD1qHzntXfXJxYJ9dZUii/z1xyuX6UrGsrP
	 Ip8WSnq/xrE3N0DPAaU+YBHBqzvcxzMBp3bTGg4NuBTWoI9/tmiqSpMaeafLvBlYVy63u
	 0PEIBEh7JQ4fWHesGi79Y08AVj0puszW0YtFBfHjwnjBAxznUB19PaQjCbdFC6ceHZ6Bl
	 MyKN8GX92OWleuSQE60cAGTDWYjFZPXDj93MIX1mSZXOkVyS/Kn4ScYoDjm8Y0mbWqKsa
	 1s56iAGQMNgrG8YJOcSbl1duTMbM49EbXvChPqvAudRXQoYk6Gzw7TNqrUY4nMzYYng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dAalStsyfXudMpg2j2V+fdfxbWvoIc3klIPMOpbgtew=;
	b=CXrPAj5wfLF3Jw6EU++3lW9FUh4nH0ZAU5+lC1b8HuLw+qkxe4fQpP/Qp/zarDIF6D5Y
	 U0KKjp/aetgoXiE4oF+SM2a5BcrlIbCiYIVPoyEZqgtOqlanfOBJLKk5zwA+8mYLOZtTf
	 rwmQqTKWbOQL1izBh4bOE0g/kbnMzvzu3lobCLuucXqp7mFcZSBMeV0JY5s5vp11UCDq9
	 vPbg8tmHzh2CYr2fcjg8zSOZoDUfvoO5mk3nGUY18fp4S3LuYIuWYi/0lFmRu1tCx53Xv
	 1Ld3COiNm0VzVhQGyqbk8rdsp5YmXWbZlCwTUslqsY6vLHs7NJHhrZ3t3AMiM2K+c9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cN6AA1Jo;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADCB606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ADCB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cN6AA1Jo
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so1291514b3a.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795530722; x=1796135522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dAalStsyfXudMpg2j2V+fdfxbWvoIc3klIPMOpbgtew=;
        b=cN6AA1Jo5PTed4Fuh1Z32tEBYOm+rwHdXRbPRhYueW20CqSPtk5CMVk+ar2L4h8YfR
         YDfoP1ddutTvohm8JkfBJLQP0L/rIc9rfdbeXoNlv3i9kStKCiUWl/2Sh+S6aZ7Oh0nI
         uiHQ6sCsJF7cXiyTzuRvHbYEFWH8L0zvTYAIn9VvopHd/ImDLgymUzizDWmswczd6OoC
         95DbOCDWTgzTefd+29AaCAuvjTrJjaRcqjUhesHuJlSjw/59rnscG053hvpwnIKHtUp4
         uROQuVFyxnBuPUVhEMOF6213D+8WP86Q6TxVERdTqqEF4/BA1Jq46UwVUH0b+LX+qI2s
         r32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530722; x=1796135522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dAalStsyfXudMpg2j2V+fdfxbWvoIc3klIPMOpbgtew=;
        b=IBf3nHd065AguDUdr8p9pqf/fQeh/GwON6rRMpM/uUML63CMvj6iazISSM+s1+zYlX
         mjSjoqJP9GbzAGv0VEoNF11Su5sMIxNmqhXBNoxpgdFNIV1Ur9y5hzuFTSJuLstMZsXv
         4kKQ20Z+Sn+iwr9zgDv+3cqxcKbg2IL+yvbQQakgA6tQ4NyIVcfzHPUpb9vmzh+l6yWD
         4IRjehTRIht+nPjVnF+8rUbT6/Lqt+RhJbu33U7aD0/Ay5/HOcCS3jK31cJMNdM1UZ/s
         2a670MG9FXVBie4FGW6SXlx/RXDT7zgoD9EA939aFJzK5NvBAGjLo7gNa8g+K+raQ07j
         uXFw==
X-Forwarded-Encrypted: i=1; AL+hErH17erDZ9Ozy5/a0MQ35zHY7DlPP6ZP/mfU5OOVfKLdCTYLcbjGTesGGTt7UJpfiXXq3nGX/68=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pibklVuOQdxyJjEZMNL/UArsKlt9ELna9xb5+0k8NZiYnoudT
	jy5Z/T0BMhVa0nkPKN95bxen8mPm3a2hI5He1ZIpRYXBC/Bs9Z9cZeJU
X-Gm-Gg: AZFdTZcvqVqsdc8rAbgbLXYYSoWf8/S5pKml5/vDiaSBDQkPW7GTGi3rmILkp22+g9+
	EQbTju5KmaPTMtI7am8thpoIpHhe0UXdxFeqmZwZZqr5ekGI4AzJQ9uyxQPct0yzV1yX0lnTc3S
	giqlsZdhxGKPswUP3PyFZ5zgkGxzuktEQcY37CQbcN7w/c/DKqHWAFVL4xPMHSEZ8ZaI4lH57CC
	MM49ADogTxpGaY6CTGnMb5m5vPV7vNEsCm0kBkLWwR4qBop8Yyjuue7WRREMH4weAgnvC7F70Jz
	grM9c1soyfDOR5YlxkV6j5d55a5ypni2WUVBZsRVTwkIHR54F9zUtH6hiTCk1It7G+JaLVqpWw+
	3shxTeTXJyOXvPoRi5VuqCCU7YsoiWo+5Xbwmu7yzYghaZqqKStj9NEhuNopm0EmChZO9fOhlAQ
	RwPyL3TQ4d4TzKtSIFS0HKcHIn8McQOPTxVGfGO7C1KMZxY4+dfWa3DQGZXwY6r9cwhss1IkNbt
	khrIhk792hjGGDRnOwxDWTgFGHmV/JbbH9o9pAAF/Hp2EhhfGsfsoBrB+pU+6Y+2xEnEIcixNOx
	7lBmw1RYRJfmGcxAfsQz9Qo4lzpwNCCbQhjDNBgIyd0g8H7zg7JwD8JxULgz5ogsvP6Gw8qfYHl
	H7wfq/g08kA==
X-Received: by 2002:a05:6a20:a107:b0:3de:b0cc:b0ed with SMTP id adf61e73a8af0-4014c94a7aemr14594290637.18.1795530721628;
        Tue, 24 Nov 2026 06:32:01 -0800 (PST)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm7171737a12.8.2026.11.24.06.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:32:01 -0800 (PST)
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
Subject: [PATCH bpf 3/3] net/smc: bpf: Reject sleepable programs in smc_hs_ctrl
Date: Tue, 24 Nov 2026 14:31:15 +0000
Message-ID: <20261124143123.1182108-4-rhkrqnwk98@gmail.com>
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

An smc_hs_ctrl program can be loaded with BPF_F_SLEEPABLE, but
smc_call_hsbpf() calls syn_option and synack_option under
rcu_read_lock().

bpf_smc_hs_ctrl_ops has no check_member, so nothing rejects such a
program. Add one that rejects sleepable programs.

Fixes: 15f295f55656 ("net/smc: bpf: Introduce generic hook for handshake flow")
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 net/smc/smc_hs_bpf.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/smc/smc_hs_bpf.c b/net/smc/smc_hs_bpf.c
index 063d23d85850..66cf5143109a 100644
--- a/net/smc/smc_hs_bpf.c
+++ b/net/smc/smc_hs_bpf.c
@@ -82,6 +82,16 @@ static void smc_bpf_hs_ctrl_unreg(void *kdata, struct bpf_link *link)
 	smc_hs_ctrl_unreg(kdata);
 }
 
+static int smc_bpf_hs_ctrl_check_member(const struct btf_type *t,
+					const struct btf_member *member,
+					const struct bpf_prog *prog)
+{
+	if (prog->sleepable)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int smc_bpf_hs_ctrl_init_member(const struct btf_type *t,
 				       const struct btf_member *member,
 				       void *kdata, const void *udata)
@@ -130,6 +140,7 @@ static struct bpf_struct_ops bpf_smc_hs_ctrl_ops = {
 	.unreg		= smc_bpf_hs_ctrl_unreg,
 	.cfi_stubs	= &__smc_bpf_hs_ctrl,
 	.verifier_ops	= &smc_bpf_verifier_ops,
+	.check_member	= smc_bpf_hs_ctrl_check_member,
 	.init_member	= smc_bpf_hs_ctrl_init_member,
 	.owner		= THIS_MODULE,
 };
-- 
2.56.1

