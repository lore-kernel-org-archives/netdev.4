Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762227;
	b=Jg+Z3hsV1kqM+/cqpKAlxwV4eN1ho9qz+velGrB5ObYD0aO4XCaWSCDvkwzoZ+UWSvzE
	 7wQHC1/GEvtqDog783MMGvvJLX7hw0gF4eod4MfDgWudzyWju3ciKmVpc3b5/IPI0NHZE
	 PNo34Nq7N5il7dpSbL0aRtxaNuYfsEtc7AuBUtM9WU4axireXhQzuoM0qgdC71n1lORHu
	 6tSIE73+NKn4OfcECA530FFe4mgogPWgZLX/NT5hMsu9TD3Ei4Cc0/g7bifxMkatVGR1u
	 q3EZIQXtij2uWjq0p2ExkFcdYrq7kaGf/5SVeoKVBaHq1qnOce9oPUoWmbZgWqEb0hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zkI3ZaCVO6DFWoIiiuuohl1A00TTUY+rHg5pk5A5ReM=;
	b=F7Sj6u350/e1lwiTWPnxJewFb7zvAeWkcRArrV7hMOz9Xhv+bsOOAdAHZ39V6Kvblh3u
	 IcxrcuW5L8VcOJalqga13pHGd5F8KMGKoFohojkQfVYsjdVtu9lGhEx6GIZmW5ZS6nrj2
	 NUPAz5C5Bt7IzHwHPE/tGoBUIlMT3kzW5cFGOFVCchVGlBP5uZaFHc4aEmupn+QQb3ok7
	 uPz9COuK1NWhD24/IV0NDGA5ZDI0PcNIFviFzi0NhgP+TagrUat5RxesDS6zHPzr0P3Tg
	 eH+B9xSs7pcFliODS2gc/nYmu6e9dRfk8yI2mPTqJrU2ZtFHSqSoj3IAmA2vEt0UI8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N25xEqkv;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DC9606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 06:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1DC9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N25xEqkv
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3b4be95e0afso2302796a91.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 22:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762226; x=1796367026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zkI3ZaCVO6DFWoIiiuuohl1A00TTUY+rHg5pk5A5ReM=;
        b=N25xEqkv5pbmWpcUYO6PxJmIBAx0vL2XhBDLVkL/YevQdZaDsWIB7SomQ43Y1NP4np
         /ncFFwDk+/4rx+47PjGUHKBCG1F2yjNmYsSF07iVz2ZvRkjN2VcR0iQBPyHFMwmD+Esl
         0HEtj8HXHYPGI7wRHBmG820O7YXrZCb8SLFA/1DoekGvX/Ue9xJK4/+ztcrm3krQjJVz
         yM8CIxHEnVE0pJ5M17Sijlg/29qr1EMj7HSQLyAOOlvPGR9aSLb7Zr83QMLPW58w3Y9S
         trstm9drg+JkEQLJ/Lph/1iQwJnUU8BLd+cdtoA7jTc57CofSrO6fVnygCVTVHwz5Lmy
         2SZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762226; x=1796367026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zkI3ZaCVO6DFWoIiiuuohl1A00TTUY+rHg5pk5A5ReM=;
        b=1v95GXoH7MJTfd77vWS+FYyHY0kU9flhk7T7bz9nf9JdC7H2y5421MX0z6JEoUBcJo
         VKtAl0Gi17QbRocwoqjwDyjkH5mGYLckpBbWOqvzckD630QV3k5y76S+NzZHVQclayOj
         PEkVWxTlspCGy++opQA+J2saUPujl/yV6fJi1rHgsW6mmtao/zlcWTJpqTCDOC2ez5MF
         4kETe7TalrWl7siq5E/TL/PZpIRhR5kP8DHaS+uoQreMshT4zitYFx2SsiEtMQ+VPEWQ
         AwDAANewPL9WlpJmLRO497eDkomuL+mYpiOFbnkWjcxqfggKtY8TmjqJYKN233rx7gtE
         FXzA==
X-Forwarded-Encrypted: i=1; AL+hErGkCxclBw2S6+HLvfs9zlUHakhglTfZjJuXQF/Z+Gv9uXOGWNQ+cd+Ggq/LlevR1mUNQhNw6A0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wyXq1VVQQWxVFa/Eb6WmgKr6UPBXIXoqGdSsg/btiy+2FOMqe
	HTcfsAy2rjS9sYqSqa8aTlCiPy48t8U70a+GOO8HLHM8lXtSRK4Ny1Ug
X-Gm-Gg: AZFdTZcGfxcQsKI6JnIhbIYEh9bFwxiUVXtmC1h0x/IW/rXDlZkxbv/+YHOw4UKeyVs
	yN+ZEfCKItZ59VpNBlOJ74P6+y4B0nEX9I1+uONo6WUjMHLAQhbLeUWtrTQorIUwmxXsvwjz/w2
	znZ7VGR+O+BvWQ70o1ylJa1nUZQIDJIZCjfpTB3DFiipnDPCLFgB4qJvZ1bKWIf+NAxgp9agcKk
	42EU0M9PHy0dFzRRgX0uZ7GyZ8UZIoiiVFzi00tsT9sK2wC+O7E2lHyG7CkHkOBsA5/f4nB6DKF
	44WH/cGYtW5d8LJWshpimMV5Ym+H1h91W8/zzfYUwXD1IQI3zoCnohQnBZGiiSrw41Vc3eSCEMx
	0CmaiSP4yCqWhumjtZYi1HE0QbSJWDkhkwCmB4tiDTYC7VItrbwU3v+fIcB0XVZ4jMgcjT75GAS
	iJ+xXxuFEI7gVKwJBOEmqlbg6Z5BQUKrJlc0kUbdQBZRwaoZeHZoPELn71eOGscGrmjEn0A2X2G
	eW7noNXtzAhhl5b+cqcYrP1p+d5bLQ4z5IiLz92kXEcM4X0uC0rX8boJAVksey0u5EIWx88wWOL
	xEWJqzwmibGZvbq+ZK775FWgIMFv5fcC9kFFOsfTV/u7tVZf9atdoNhnjl6pyZZCsAUZgDvDScd
	S
X-Received: by 2002:a17:90a:e705:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3b41c7e118emr23007990a91.5.1795762226024;
        Thu, 26 Nov 2026 22:50:26 -0800 (PST)
Received: from BSDHENRYMA-PC1.localdomain ([43.132.141.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d96bd3sm39498980a91.12.2026.11.26.22.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:50:25 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Xin Long <lucien.xin@gmail.com>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Vlad Yasevich <vladislav.yasevich@hp.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Simon Horman <horms@kernel.org>
Cc: linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] sctp: don't count pending-deleted addresses as survivors on bindx del
Date: Fri, 27 Nov 2026 14:50:17 +0800
Message-ID: <20261127065017.2922776-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.53.0
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

sctp_send_asconf_del_ip() uses sctp_find_unmatch_addr() to make sure a
bindx delete keeps at least one address in the association.  The lookup
counts entries that are already marked SCTP_ADDR_DEL by a previous
delete request as survivors.  With a peer that holds back the ASCONF
acks, two sequential bindx deletes each pass the check while together
marking every address for deletion.  Once the peer acks both deletes,
the association's address list is empty.

An empty address list breaks its consumers.  SCTP diag reads the list
head as an address and returns 16 bytes of association memory in
idiag_src.  A following bindx add builds an ASCONF from a bogus address
taken from the empty list head, whose address family matches no sctp_af,
and dereferences a NULL af pointer.

e.g. on mainline v7.4-rc4 (KASAN build):

 Oops: general protection fault (non-canonical 0xdffffc000000000b)
 KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
 CPU: 1 UID: 1000 PID: 81 Comm: poc-crash Not tainted 7.4.0-rc4 #1
 RIP: 0010:sctp_make_asconf+0xd9/0x280
 Call Trace:
  sctp_make_asconf_update_ip+0x243/0x540
  sctp_send_asconf_add_ip+0x366/0xc90
  sctp_setsockopt+0x1986/0x9410
  do_sock_setsockopt+0xb2/0x160
  __sys_setsockopt+0xdd/0x140

An address that is already being deleted cannot serve as the remaining
address, so skip SCTP_ADDR_DEL entries in the survivor lookup.  The
existing keep-last handling then holds the final address back, same as
it already does for a single-address delete.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: f57d96b2e92d ("[SCTP]: Change use_as_src into a full address state")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/sctp/bind_addr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/sctp/bind_addr.c b/net/sctp/bind_addr.c
index 31737f144c7f0..e20006b9f12e4 100644
--- a/net/sctp/bind_addr.c
+++ b/net/sctp/bind_addr.c
@@ -445,6 +445,12 @@ union sctp_addr *sctp_find_unmatch_addr(struct sctp_bind_addr	*bp,
 	 * can't change.
 	 */
 	list_for_each_entry(laddr, &bp->address_list, list) {
+		/* An address already being deleted cannot serve as the
+		 * one remaining address.
+		 */
+		if (laddr->state == SCTP_ADDR_DEL)
+			continue;
+
 		addr_buf = (union sctp_addr *)addrs;
 		for (i = 0; i < addrcnt; i++) {
 			addr = addr_buf;
-- 
2.39.5

