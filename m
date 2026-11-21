Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257264;
	b=s7rL9GcyGTvuwEkSb/+XO7tbhNSrTKZQ2+f5HN2ZK8RTEbrsEl3cw6wQUQrVY36o0Jbb
	 k+t3mJq0mDUF2dotaZ0oOuOMv02AUbCwDui8o6Hz+ONXO6uDhxABlYj/k5XuzA3Gzx5We
	 GCLasgdg7TY/Q6lFvmIM7+Kpv71bDU2ZcB21CVyiqUwks0FJoKrtShwS2EW7eivmEIyyp
	 16Qu2gqLCz4PIkGzLqpzQW9e8CLRPjqIbBK/4a04TKlM7xIhumGWIT1NZdekhjXByNLKd
	 liYKQFEAQ7nDbQVQxnMEa8qg0hNmj8DutYYyeJkYP/ojTsnH3KgilT0pk4Uy9a2f7Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257264;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Nc48zS1pvPQXpcOFDxpy9yc01fZs/NHTVYQQcYjGPTc=;
	b=GLlQLZgvwaSbXw4R4UHnfRSMP5mwrStX0dmRixF7cQg1Y6bRnDb3FVNZSOUaSxPNN40P
	 rjaDc6r17b0nCPG7vHYqfswOmumBXk5Jadf1zR7eEdgvHNAnNGmhRDBbhON+thH9FnDZ4
	 q0TWOSylPDR2ypa14bJFdbgKM8QLYPYH558ggv6mXWnPoSglcvG4LXoMBmtNGc6cU15L2
	 brnezDgL/2ptEDJsLg6lh903kBjXTdKm1KEf3pYnL+dsGoAPLAjt8D40hUICXzLpMeKD6
	 2/gt+fTgS9IhC4wqw247MYNw3X4knuZY10ucXzSeSCWSQbLUKKjvuVvsXoZWba+NTtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IlIE+6d0;
	arc=none smtp.remote-ip=91.218.175.244
Received: from mta0.migadu.com (out-244.mta0.migadu.com [91.218.175.244])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA00606A325
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DA00606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IlIE+6d0
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=d0Zx0VgqM4r7n2EGcrwfr6pCsmUZw+5S5+NxgBb7BDY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795257261; v=1; x=1795862061;
 b=IlIE+6d0Fw2t21lFD3sbsZIe4TxndE7H7JkCpuaGK+XAELCyU8pjSnZRnTwutev/Ed6PtN89
 u45KqRx5hrHlaKNxGi4TafWfSocwjdtMs49Ra1s3mj2M+ppZF+VPdiLcmN2RnQa3P4yc2ki91gq
 paiEPltMTNLysFd8LbxBa23k=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ebcdaf32079d6eb0;
	Sat, 21 Nov 2026 10:34:21 +0000
X-Mizu-Trace-ID: ebcdaf32079d6eb0
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org,
	ast@kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Sechang Lim <rhkrqnwk98@gmail.com>,
	Mattia Meleleo <mattia.meleleo@coralogix.com>,
	Michal Luczaj <mhal@rbox.co>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 04/11] bpf, sockmap: Fix empty sk_msg queued by ingress redirect
Date: Sat, 21 Nov 2026 18:30:05 +0800
Message-ID: <20261121103222.88209-5-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121103222.88209-1-jiayuan.chen@linux.dev>
References: <20261121103222.88209-1-jiayuan.chen@linux.dev>
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

An SK_MSG program can pop the whole message with bpf_msg_pop_data() and
then redirect it with BPF_F_INGRESS. tcp_bpf_send_verdict() does not
check for that and calls bpf_tcp_ingress() with nothing to send. Its
do-while loop still walks the empty ring, charges zero bytes and queues
a zero sized sk_msg on the peer's ingress_msg.

__sk_msg_recvmsg() hits the zero length element first, returns -EFAULT
and never dequeues it, so every later message on that socket sits
behind it and recvmsg() keeps failing. Only tearing down the psock gets
rid of it.

Return early from bpf_tcp_ingress() when the message is empty. SK_PASS
and egress redirect already send nothing in that case.

Fixes: 7246d8ed4dcc ("bpf: helper to pop data from messages")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 net/ipv4/tcp_bpf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv4/tcp_bpf.c b/net/ipv4/tcp_bpf.c
index e59103e77aa5f..7191b95c7b1c7 100644
--- a/net/ipv4/tcp_bpf.c
+++ b/net/ipv4/tcp_bpf.c
@@ -39,6 +39,9 @@ static int bpf_tcp_ingress(struct sock *sk, struct sk_psock *psock,
 	struct sk_msg *tmp;
 	int i, ret = 0;
 
+	if (!msg->sg.size)
+		return 0;
+
 	tmp = kzalloc_obj(*tmp, __GFP_NOWARN | GFP_KERNEL);
 	if (unlikely(!tmp))
 		return -ENOMEM;
-- 
2.43.0

