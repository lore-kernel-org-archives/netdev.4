Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749126;
	b=npFX3aIAJ2NXml4/OZb/TdNhuFt6+sQlkuFlxi8LFdL98NLhfFnXlZReIG0AOgNnJknV
	 U/oTMDubdUN5+TwFAbGlhzF4GOvOFC7nCQ2vUACopZff0j1OJSzrQBVf7D27Hzq2h4LNM
	 Mi7cBTHqHXui3xPOLP/ILR6eHoileYlPGcTKoc5CoqlHy3wKXBLlNLzTDno0GIO0nZRu9
	 gQ3cCeSbDGxuxoMDnE/u8vAmOh/qNOpftLxalR/aivtYjPmko56gEQp5IMppvd5aRVy4H
	 89ZLaMJi+k31/8jLHdXzDY7MPKh0mmfdrvJAlIESE0+lQCnS52jbONpPgFqVKmGHBEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749126;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Scanned-By;
	bh=pXZoABMJxnv660Z8EavSHK9f3CBrQH3Sb4rvVymGMpo=;
	b=V3c3pdFHxsRW7xtc5meC26qSE/2lqJTl7dFGQRyhTtjUBCoomqtBQvFjgjgivHFhiiFM
	 a/tg/Qm6KTwi6MbqfmdSsCercLw/68N8+XJ/McNaoUM4uJ8AESiEGX3fUln6VoNyOhE20
	 +GO/bdc8kOgiDST+q3FBn4eXZYnnCSzjlRXUc8uu2FlZaG6yXZ9/Rc986M+kCC4BbABRG
	 e05XiXtWoKios/k8INbMzAnFS0Py0cicM0GbSYVHQzWRaHmWNpOPKb/DjjAHm5TwUozOo
	 saLDXajuHdA9bMs/D73nxRyJVwHRkWeSXFTBpUsXGXvbzaKvPiIv0DcxKQ/P670P/zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="aMXaC/8Z";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DF2606A31D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 13:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1DF2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aMXaC/8Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794749125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=pXZoABMJxnv660Z8EavSHK9f3CBrQH3Sb4rvVymGMpo=;
	b=aMXaC/8Zlq3a5EmLIAWiMBkQhVT02zWeYzxZHndckHefs9plhqyEtNX0xWPo+BVlc47yF3
	2aDOrl95gr9PAVI11IRPBErAlzV9aYja1LLYqF6b1LTTDQbc/cDy55PtdVKMfi42GkvvCP
	IDoJXXUBbnmHAta6IRW5Fj3kFPeqY9M=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-7-tmEBoLgnN0m2AEUkmSZkrQ-1; Sun,
 15 Nov 2026 08:25:19 -0500
X-MC-Unique: tmEBoLgnN0m2AEUkmSZkrQ-1
X-Mimecast-MFC-AGG-ID: tmEBoLgnN0m2AEUkmSZkrQ_1794749118
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 59C9A180035E;
	Sun, 15 Nov 2026 13:25:18 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 3DD0C30001BE;
	Sun, 15 Nov 2026 13:25:16 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Sun, 15 Nov 2026 14:25:18 +0100 (CET)
Date: Sun, 15 Nov 2026 14:25:15 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Allison Henderson <achender@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Joel Granados <joel.granados@kernel.org>, edumazet@google.com,
	horms@kernel.org, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: [PATCH v2 net-next 2/5] net/rds/ib_sysctl.c: move sysctl-only code
 under CONFIG_SYSCTL
Message-ID: <avmyu2SQTjdC_jjd@redhat.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avmymGvelu00X5EH@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Collect all code used only when CONFIG_SYSCTL=y into a single block and
wrap it in #ifdef CONFIG_SYSCTL. rds_ib_sysctl_init() no longer needs the
IS_ENABLED() check.

Add the corresponding init/exit stubs for the CONFIG_SYSCTL=n case.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
Reviewed-by: Allison Henderson <achender@kernel.org>
Tested-by: Allison Henderson <achender@kernel.org>
---
 net/rds/ib_sysctl.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/net/rds/ib_sysctl.c b/net/rds/ib_sysctl.c
index bc97a3eecad6..0b336ff03ae9 100644
--- a/net/rds/ib_sysctl.c
+++ b/net/rds/ib_sysctl.c
@@ -36,19 +36,10 @@
 
 #include "ib.h"
 
-static struct ctl_table_header *rds_ib_sysctl_hdr;
-
 unsigned long rds_ib_sysctl_max_send_wr = RDS_IB_DEFAULT_SEND_WR;
 unsigned long rds_ib_sysctl_max_recv_wr = RDS_IB_DEFAULT_RECV_WR;
 unsigned long rds_ib_sysctl_max_recv_allocation = (128 * 1024 * 1024) / RDS_FRAG_SIZE;
-static unsigned long rds_ib_sysctl_max_wr_min = 1;
-/* hardware will fail CQ creation long before this */
-static unsigned long rds_ib_sysctl_max_wr_max = (u32)~0;
-
 unsigned long rds_ib_sysctl_max_unsig_wrs = 16;
-static unsigned long rds_ib_sysctl_max_unsig_wr_min = 1;
-static unsigned long rds_ib_sysctl_max_unsig_wr_max = 64;
-
 /*
  * This sysctl does nothing.
  *
@@ -61,6 +52,14 @@ static unsigned long rds_ib_sysctl_max_unsig_wr_max = 64;
  */
 unsigned int rds_ib_sysctl_flow_control = 0;
 
+#ifdef CONFIG_SYSCTL
+static unsigned long rds_ib_sysctl_max_wr_min = 1;
+/* hardware will fail CQ creation long before this */
+static unsigned long rds_ib_sysctl_max_wr_max = (u32)~0;
+
+static unsigned long rds_ib_sysctl_max_unsig_wr_min = 1;
+static unsigned long rds_ib_sysctl_max_unsig_wr_max = 64;
+
 static struct ctl_table rds_ib_sysctl_table[] = {
 	{
 		.procname       = "max_send_wr",
@@ -105,6 +104,8 @@ static struct ctl_table rds_ib_sysctl_table[] = {
 	},
 };
 
+static struct ctl_table_header *rds_ib_sysctl_hdr;
+
 void rds_ib_sysctl_exit(void)
 {
 	if (rds_ib_sysctl_hdr)
@@ -114,7 +115,19 @@ void rds_ib_sysctl_exit(void)
 int rds_ib_sysctl_init(void)
 {
 	rds_ib_sysctl_hdr = register_net_sysctl(&init_net, "net/rds/ib", rds_ib_sysctl_table);
-	if (!rds_ib_sysctl_hdr && IS_ENABLED(CONFIG_SYSCTL))
+	if (!rds_ib_sysctl_hdr)
 		return -ENOMEM;
 	return 0;
 }
+
+#else
+
+int rds_ib_sysctl_init(void)
+{
+	return 0;
+}
+
+void rds_ib_sysctl_exit(void)
+{
+}
+#endif
-- 
2.55.0

