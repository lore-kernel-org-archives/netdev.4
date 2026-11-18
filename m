Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.88
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794977565;
	b=vDLK7AuzafNMp+3H+Fqw0VjLVCqFCAh9/iK40E/BWVWE3Qfb3JXkrzImdKJbIpkLxwtf
	 TtzqQCiPBAAPOzMUODehnnlITcVrQ4XLndjF6C2foRslFwiEpUQxUhvsIZHs+sMHUnPaC
	 w+teaJlfYnvO2FijFpXfWxxYoBGoTMKCehoGHuVNLauUo2h4hyNQcDm5NXF56Tjd8J1XW
	 H29igBEHLLa8S6Owuael2DRe8epPDed/i6pwRS2MdAxGjwC6BDDi03pJDAM3lUP7I0REz
	 InPDCfEJeSHvjQtDc4wGhNsztrnzVVUulhPDfL2v3Bjkxbe5qid93cpxZtsWudPydwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794977565;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G7ZZkWCBO853HCoEXyIwq4y+pHwPka2GFSwE47Aas9E=;
	b=drtEtVsNHhJunEdf6zbGznCaHTEJpR9v0owvu/Rc+QleJx989Ihv/pPUMsX9P1YMFwB/
	 0y79XINNRCLFjZutrizmzN4yuN2X6h5LDvUFmMvXDk57UqLp9fAQw3yXnNw2LqhqZq31K
	 39hu7J7rVB5hP/38BeV3LVRH2alGbfFkeEWFiMJHre9NCuoYVQDUD3jOKlB5MLlrd9+IV
	 N2anK+Y0IP/eJgH0NYpmCUqoUO/tH8wktRmIYa6Q4tvr1Gp6oXvWsCThH9QQ5uskH58qt
	 SYMcmPU0AvbTcEWPngtsw0hJp8ZCcyhpspUIZ0c48Sf8q+Ro35bwbldA8V9Z3f3dU4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PndBQl6p;
	arc=none smtp.remote-ip=91.218.175.88
Received: from mta0.migadu.com (out-88.mta0.migadu.com [91.218.175.88])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1078606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 04:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1078606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PndBQl6p
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=caMkaf1hdlpPhTM1AENWdwVoKOBLWXFUn5bma+9de4s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794977562; v=1; x=1795582362;
 b=PndBQl6pvl9awmtocWdhfYBoNRdwLFy1WUSmoXorLlPoRiWIEpQxBUhsYyRnj4jvMWCl4kEm
 jNydffGxl7UEbXgzQF+8dZ5InjQiWhtsMaeAQOzJ+v/maHiq1Ppw4Ev23fLfhmM3BBU3Dd1e2Es
 H6qkmZotdR6tsycMbRoweNLE=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b870d3e5a101f7ca;
	Wed, 18 Nov 2026 04:52:42 +0000
X-Mizu-Trace-ID: b870d3e5a101f7ca
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Matthieu Baerts <matttbe@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"D. Wythe" <alibuda@linux.alibaba.com>,
	Dust Li <dust.li@linux.alibaba.com>,
	Sidraya Jayagond <sidraya@linux.ibm.com>,
	Mahanta Jambigi <mjambigi@linux.ibm.com>,
	Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	linux-kernel@vger.kernel.org,
	mptcp@lists.linux.dev,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-s390@vger.kernel.org
Subject: [PATCH net-next v2 3/5] mptcp: annotate data-races around pernet sysctls
Date: Wed, 18 Nov 2026 12:51:18 +0800
Message-ID: <20261118045137.174026-4-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118045137.174026-1-jiayuan.chen@linux.dev>
References: <20261118045137.174026-1-jiayuan.chen@linux.dev>
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

enabled, add_addr_timeout, checksum_enabled, allow_join_initial_addr_port,
stale_loss_cnt, close_timeout, pm_type and syn_retrans_before_tcp_fallback
are read by their ctrl.c helpers without any lock while the sysctl
handlers update them with WRITE_ONCE(), and the path_manager handler
stores pm_type with a plain write. Add READ_ONCE() to the readers and
WRITE_ONCE() to that handler.

KCSAN reports it when net.mptcp.enabled is changed while MPTCP sockets
are being created:

  BUG: KCSAN: data-race in mptcp_is_enabled / proc_dou8vec_minmax

  write (marked) to 0xffff8d724248abc9 of 1 bytes by task 733 on cpu 3:
   proc_dou8vec_minmax+0x1ab/0x1f0
   proc_sys_call_handler+0x282/0x3a0
   proc_sys_write+0x13/0x20
   ...

  read to 0xffff8d724248abc9 of 1 bytes by task 735 on cpu 1:
   mptcp_is_enabled+0x33/0x50
   mptcp_init_sock+0x35/0x300
   inet_create+0x4a6/0x8e0
   ...

  value changed: 0x00 -> 0x01

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
Reviewed-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
---
 net/mptcp/ctrl.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/net/mptcp/ctrl.c b/net/mptcp/ctrl.c
index 63c5747f0f63c..164f79b9deb0e 100644
--- a/net/mptcp/ctrl.c
+++ b/net/mptcp/ctrl.c
@@ -50,39 +50,39 @@ static struct mptcp_pernet *mptcp_get_pernet(const struct net *net)
 
 int mptcp_is_enabled(const struct net *net)
 {
-	return mptcp_get_pernet(net)->mptcp_enabled;
+	return READ_ONCE(mptcp_get_pernet(net)->mptcp_enabled);
 }
 
 unsigned int mptcp_get_add_addr_timeout(const struct net *net)
 {
-	return mptcp_get_pernet(net)->add_addr_timeout;
+	return READ_ONCE(mptcp_get_pernet(net)->add_addr_timeout);
 }
 
 int mptcp_is_checksum_enabled(const struct net *net)
 {
-	return mptcp_get_pernet(net)->checksum_enabled;
+	return READ_ONCE(mptcp_get_pernet(net)->checksum_enabled);
 }
 
 int mptcp_allow_join_id0(const struct net *net)
 {
-	return mptcp_get_pernet(net)->allow_join_initial_addr_port;
+	return READ_ONCE(mptcp_get_pernet(net)->allow_join_initial_addr_port);
 }
 
 unsigned int mptcp_stale_loss_cnt(const struct net *net)
 {
-	return mptcp_get_pernet(net)->stale_loss_cnt;
+	return READ_ONCE(mptcp_get_pernet(net)->stale_loss_cnt);
 }
 
 unsigned int mptcp_close_timeout(const struct sock *sk)
 {
 	if (sock_flag(sk, SOCK_DEAD))
 		return TCP_TIMEWAIT_LEN;
-	return mptcp_get_pernet(sock_net(sk))->close_timeout;
+	return READ_ONCE(mptcp_get_pernet(sock_net(sk))->close_timeout);
 }
 
 int mptcp_get_pm_type(const struct net *net)
 {
-	return mptcp_get_pernet(net)->pm_type;
+	return READ_ONCE(mptcp_get_pernet(net)->pm_type);
 }
 
 const char *mptcp_get_path_manager(const struct net *net)
@@ -230,7 +230,7 @@ static int proc_path_manager(const struct ctl_table *ctl, int write,
 				pm_type = MPTCP_PM_TYPE_KERNEL;
 			else if (strncmp(pm_name, "userspace", MPTCP_PM_NAME_MAX) == 0)
 				pm_type = MPTCP_PM_TYPE_USERSPACE;
-			pernet->pm_type = pm_type;
+			WRITE_ONCE(pernet->pm_type, pm_type);
 		}
 	}
 
@@ -551,7 +551,7 @@ void mptcp_active_detect_blackhole(struct sock *ssk, bool expired)
 
 	net = sock_net(ssk);
 	timeouts = inet_csk(ssk)->icsk_retransmits;
-	to_max = mptcp_get_pernet(net)->syn_retrans_before_tcp_fallback;
+	to_max = READ_ONCE(mptcp_get_pernet(net)->syn_retrans_before_tcp_fallback);
 
 	if (timeouts == to_max || (timeouts < to_max && expired)) {
 		subflow->mpc_drop = 1;
-- 
2.43.0

