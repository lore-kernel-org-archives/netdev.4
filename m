Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795069087;
	b=K24R93J4G3ObockoxxbUxPwxqTF57hZsLutrfVfVcwNivZM4/ojVMwDHYGD+3jMIMP5t
	 5vbAIT6Ct99XNXvcXS9lgrGygsVzd2tIVsxSpnVE89aKFmtfBMAjAWYeolgEyh4neqC78
	 X3O0Pm666mZT9NSoGMnNHm+Mq1d5zYCyx1VXZQ66c/hurX6T5g/g1KMueg5g7FXrH4LIR
	 G6WlPC2hKebicdzUQ3MkYR2A9c0ufzfVeEzFcN4X4SJ2OwvGQtgmnbqVyp9PeqvSW9oFM
	 7mY+NwbnLj6xc3TLTSSP4UIeRNlZMjLVqujevgF9D22fYncKK66SwGIDBcO5ybb2lHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069087;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cQhLGX092VFRl67tQ9qHxUslSGV7iUjL213pV0nCfHE=;
	b=FQnGeRlravUxgNwM53U0vXbb23jUfNW2yMiKe9gN7JQ3/H1pyzhN/n8C+NlL4cgdcOWs
	 A4t4jkBgMNHmTmQyagf/sXcEqMQraBGdOqN/ZsfwTlxa3UtYKKzjPxqXzlK6VOf9TXbKX
	 zOLwZWXyovNHxIF3eYnj01zrmmuF5IJflTem30LgRlTmTDvgoAoZHWBL4cwDXDzfbqcLB
	 fiR8RFEdLYLv0WSvy+pjGX6veRUqPPykEvyg5hjrbDYlVe0GYEcnUwNjoi3Tadh/TYbMj
	 KVgGWvZpCofS0RiumA32CHpkIX4q6j1hCNp77ZYFc2o5PubZitVoawfQhJcYsqsSJ2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KsA+2kaG;
	arc=none smtp.remote-ip=95.215.58.230
Received: from mta1.migadu.com (out-230.mta1.migadu.com [95.215.58.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E8B606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E8B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KsA+2kaG
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5fumGNfa6wdHoTGYmvcSwtkIJ8obNdvtuOJVAx6Kbfo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795069084; v=1; x=1795673884;
 b=KsA+2kaGnmjc8/gwaDd3KNDW3zkpehDxqXE8HVpoIj0wuHFBIDVQLZvWSCAaTyVOJjzj7u4C
 Xg9ftH3vjcj407fPdkGVr0M43cdvnzKQROtFIya5h2Sj+R4Y5bUGmVoyRJf8wIYhjEG8TNLCeLm
 DH3lc0BMfroQ/BB2kyY4wBVI=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 75e9ea414a091c0e;
	Thu, 19 Nov 2026 06:18:04 +0000
X-Mizu-Trace-ID: 75e9ea414a091c0e
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: linux-kernel@vger.kernel.org,
	pablo@netfilter.org,
	fw@strlen.de
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Patrick McHardy <kaber@trash.net>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	netdev@vger.kernel.org
Subject: [PATCH nf] ipv4: fix conntrack defrag forwarding after ip_frag_reinit()
Date: Thu, 19 Nov 2026 14:17:50 +0800
Message-ID: <20261119061751.222641-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
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

q.max_size and max_df_size are used by ip_frag_reasm() to set
IPCB(skb)->frag_max_size and the DF bit of the reassembled packet.

ip_frag_reinit() reuses the queue for a new datagram but does not
reset them, so the new datagram inherits them from the old one.

On a router with conntrack defrag, if the largest fragment of the old
datagram had DF set and was larger than the egress MTU, a new datagram
without DF gets DF set after reassembly and is rejected with
ICMP_FRAG_NEEDED, even though all its fragments fit.

Reset both fields.

Fixes: 5f2d04f1f9b5 ("ipv4: fix path MTU discovery with connection tracking")
Fixes: d6b915e29f4a ("ip_fragment: don't forward defragmented DF packet")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 net/ipv4/ip_fragment.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/ipv4/ip_fragment.c b/net/ipv4/ip_fragment.c
index ef7fd61284a3..0688be8142c4 100644
--- a/net/ipv4/ip_fragment.c
+++ b/net/ipv4/ip_fragment.c
@@ -250,6 +250,8 @@ static int ip_frag_reinit(struct ipq *qp)
 	qp->q.flags = 0;
 	qp->q.len = 0;
 	qp->q.meat = 0;
+	qp->q.max_size = 0;
+	qp->max_df_size = 0;
 	qp->iif = 0;
 	qp->ecn = 0;
 
-- 
2.43.0

