Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610824;
	b=EBvr6S00GtctPl0Vk6GHV8wN+xW8il1OKY2kXDsXZBAwHXYnhk7dM2JynOVKrmi+mGFT
	 yRImY7tFSORYRFGP/IkMjHDB8MERY6gylso1vqrNO6ykqPL7EP8Xd3H+Cir8W/VwveWXQ
	 xegXxy87PhHB1TXrbzoxdgOU9To2atOS4Ul/q+oNOPTbETH0KKTS2wc9458eaAPga8beZ
	 fg4HpReUshNYy5gRUcpDZvEx/c4nvCMnigerVF401kSrSU4ts1Kx9e3TaJJnK8m+w+Grx
	 /p7kQw6nE9AQPMuNEvwxDSYjlPr9mpaIaEa5+kg6U6U36WKdip4yLa1iQE6bWJydN7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610824;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WKLeq57PGDEd4HRLeQ29cPTv5WJHJlL5Kr8i80uht18=;
	b=Skn7oODFbjSD9P1dvrklToPdJRtsEYE5qZ3MR8ngCiIA+wplVn+nWyG882rxxSwXuYPo
	 5X4u0FPeG2oBTrdfoCJJfhVfuP91J6gsE5xOAsaWAOKv0UDdGE3lPBsCAMp8Lk5hyBfqV
	 y78DXA/Spydpzs+wEOk0+9ZYRESc1DshZ6IybKKfmkxFu8TpbBeBUg/aE1A/YGkbnodkY
	 TH92FDvAnBGWPB98+eKq95v5/6zL8Fwy6ciFcyaYd02HUFLSX5J1ogkPmq6S2MEsAPGO+
	 mk6zxtQXKGqkjSE3D2/K1R3WrnwHv6irRF34pirMTKhLCOT3vAWD8EH6IzstD44yLPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C4pghcHR;
	arc=none smtp.remote-ip=95.215.58.116
Received: from mta1.migadu.com (out-116.mta1.migadu.com [95.215.58.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060CB606A334
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 12:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 060CB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C4pghcHR
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7N2mG8hlwARmTvtTPVydpG6bDGyyYoQuvvnSGfm7Oj4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795610822; v=1; x=1796215622;
 b=C4pghcHRtOYdeqwJdQetTAvZDL8u+Y4noydJZrICsXOTBw0VPM9rsXdTwwLlZ+HTXUXLZb+a
 4C7V9qgUz7RIMcoWS6knUAVwjnEOxUq2BnkGYO8herkShszn5dWnrHt/i64Rif3SGmqSQZlI9zq
 Kanf5zc0zbOJqq+AN7huvMnU=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7027d17222310f08;
	Wed, 25 Nov 2026 12:47:01 +0000
X-Mizu-Trace-ID: 7027d17222310f08
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: xxx@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] tcp: fix spurious RST when SYN_RECV race is lost
Date: Wed, 25 Nov 2026 20:46:52 +0800
Message-ID: <20261125124653.289409-1-jiayuan.chen@linux.dev>
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

When the last ACK of 3WHS and the first data packet are processed on
different cpus, both can find the same req. The winner creates the
child and adds it to the accept queue. If this makes the accept queue
full, syn_recv_sock() fails for the loser and tcp_check_req() sends a
RST when tcp_abort_on_overflow is set. Only after that it finds the
req was stolen, and the packet is fed to the child.

The client gets a RST for a connection the server has accepted, and
the server application can even read the data.

Drop the req first, and do not send the RST if another cpu already
took it.

Fixes: 079096f103fa ("tcp/dccp: install syn_recv requests into ehash table")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 net/ipv4/tcp_minisocks.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/net/ipv4/tcp_minisocks.c b/net/ipv4/tcp_minisocks.c
index a05bb02e204c..934012cdac27 100644
--- a/net/ipv4/tcp_minisocks.c
+++ b/net/ipv4/tcp_minisocks.c
@@ -962,6 +962,13 @@ struct sock *tcp_check_req(struct sock *sk, struct sk_buff *skb,
 	}
 
 embryonic_reset:
+	if (!fastopen) {
+		if (!inet_csk_reqsk_queue_drop(req->rsk_listener, req)) {
+			*req_stolen = true;
+			return NULL;
+		}
+		__NET_INC_STATS(sock_net(sk), LINUX_MIB_EMBRYONICRSTS);
+	}
 	if (!(flg & TCP_FLAG_RST)) {
 		/* Received a bad SYN pkt - for TFO We try not to reset
 		 * the local connection unless it's really necessary to
@@ -973,13 +980,6 @@ struct sock *tcp_check_req(struct sock *sk, struct sk_buff *skb,
 		reqsk_fastopen_remove(sk, req, true);
 		tcp_reset(sk, skb);
 	}
-	if (!fastopen) {
-		bool unlinked = inet_csk_reqsk_queue_drop(req->rsk_listener, req);
-
-		if (unlinked)
-			__NET_INC_STATS(sock_net(sk), LINUX_MIB_EMBRYONICRSTS);
-		*req_stolen = !unlinked;
-	}
 	return NULL;
 }
 
-- 
2.43.0

