Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257421;
	b=cM9P2BgGk/rXnQjdlrCd96lx8XfAmt94GoLFgq/kBpOU/wH5IEplIgQnmDQJp4i2/Meg
	 fzfOcUnIwasNEvhxIn4TQ7sm+oA05+F9sKRHbxk2kEWBH/j/TcWxb7psiIEIPOkxbDoR8
	 khPGdlp01iVE43yHJMJmabjBEwJo7kY30lZTPQBQNat9ZIhBLm6UOg+UVPQ7jVLodlTax
	 zX8+FO6JxXe8GbP757BpoF+ZLAm4RPBSRLMfscnap7yfzGk3QIcDgXaK2w1JLtct7yuP5
	 rg2KnU9i5ow99YHFTZdPokSHwuwzmweSradkucc2UN6llOiLVHEEOtToesct7Oy7GLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257421;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fVafo7VVGOAxU7xppUD22xBkgF56cPIMm8sSKGz3KtE=;
	b=wQD9MGkyNo8idnKVQMrd/Zd+aKabRdpFcjyUlqJlVYvV2jz14uDgVjZ+lgJu1llcmPAT
	 mJx2zULIdkdhVm/rCVb3FBfEy3uZMPOpXtVZDgr9EGI1fZgLgXlb13V63jUSwaKQmAbkJ
	 uB2av7Z1UzGUr46nhMxlqZ5qdSrisPVmmW9yoUBsaFuCUAVuaHLbhW2iCx705RGB17sM7
	 q5O+PTQmUqQrX8wENBFWc3RoPAJk5mpjrjYF2nHuR14b7FOIQGP/Xyu0E87Oke+ONUVO9
	 mg4IHBLMHqQdtDc/aDomqQzieeZbasXUyRjmVvZewcvDkp0EGAlvcwLPf1O4yMM7m1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="sRoH/BXB";
	arc=none smtp.remote-ip=95.215.58.251
Received: from mta1.migadu.com (out-251.mta1.migadu.com [95.215.58.251])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D662606A32A
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D662606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sRoH/BXB
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Dh7M6YJjkXymTwAnjqzCtNUHOOr/CM690rfac9vffno=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795257419; v=1; x=1795862219;
 b=sRoH/BXBJQtDmlXqIe5iHh9CoD0BstGHepwOhz3gbkGjtyqd02U22THBXWmPBf2D2Fab/nfM
 Y+bQL55Flq8ZBzbSarCDPdBhs9BCMjIyNvCDqxjK8PTkf8Aw18wlC1ErRKOYJsMrNY42vkAJg4r
 2K0IjLi5ulL1UYK/h1EOnEis=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d6b425b91883e4b8;
	Sat, 21 Nov 2026 10:36:59 +0000
X-Mizu-Trace-ID: d6b425b91883e4b8
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
	Michal Luczaj <mhal@rbox.co>,
	Mattia Meleleo <mattia.meleleo@coralogix.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 10/11] selftests/bpf: Fix errno expected by the wait send mem test of test_sockmap
Date: Sat, 21 Nov 2026 18:30:11 +0800
Message-ID: <20261121103222.88209-11-jiayuan.chen@linux.dev>
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

The test closes the redirect target while the sender waits for its send
memory. A part of the data has gone out, so sendmsg() returns that part
and the test calls sendmsg() again.

With apply_bytes, the previous patch keeps the verdict for the bytes that
were not sent. The next sendmsg() sends to the same target and returns
-EPIPE, instead of running the prog again, which no longer finds the
target in the map and returns SK_DROP, -EACCES.

Accept -EPIPE as well.

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 tools/testing/selftests/bpf/test_sockmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_sockmap.c b/tools/testing/selftests/bpf/test_sockmap.c
index aaf2050e88450..771146268df77 100644
--- a/tools/testing/selftests/bpf/test_sockmap.c
+++ b/tools/testing/selftests/bpf/test_sockmap.c
@@ -566,7 +566,8 @@ static int msg_loop(int fd, int iov_count, int iov_length, int cnt,
 			sent = sendmsg(fd, &msg, flags);
 
 			if (!drop && sent < 0) {
-				if (opt->tx_wait_mem && errno == EACCES) {
+				if (opt->tx_wait_mem &&
+				    (errno == EACCES || errno == EPIPE)) {
 					errno = 0;
 					goto out_errno;
 				}
-- 
2.43.0

