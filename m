Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795532;
	b=E9peX0KzQg0QJyYAv69521ucR1Jg0GfJ6lSOsg3y9ou2BNiqhwEeXNaGy4Y3ENAJ6lMY
	 dMxmG//4qEmDteMIhciuMNOATcbQHufqiMCjG17MQpvgAsn+9wjuvcT1IDhYFdljQXFPC
	 3aLERGHugDA0BZoafVa3umTPkFXHDPmiXRS2z7uaNr8KclpX8HLNJFYDLLlJoG/GDbeG1
	 4H/79t2WdbEI7RICygxBTUrLJ5jFvbqeDw3KYeaYcyfiGfIlzqYI0TxksUGTTReivHi/L
	 1XyjCGmazl5+BhWXC3yupp/kUa0RIAyG8OZiIdNQHoG3te3YBymZq+iglYtihMxIrkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=DWaReR4bzhmRE83sOuA7g3ELVWQ1hl3/rmqbCGqOefQ=;
	b=bsGiTAn2PV4W+/IkLSi8LsGPWAOxaLr3+C2qY7IxeOUX3xGxpFwzoxi6fPhXMV46BTAq
	 xWJ9f0TPKakSXvk7gsOOZ12s1b29S3raJcGOwOHs6Nt5Yq6JSHEeqoOubHx9egB2E7hTL
	 1k9MOexeuDlEdXIMWbyeAtUkbfmjnLCDxl1HcVHDER5iicJOU8EL5c5xeCdJeaXdLinrb
	 n1uCqPAujsJBdB25XomxtNaobQlZRTA2AzAle+qQAdz8WI1QPsoeAf5fHLKNAOqDvpXIp
	 c1nVGKN1V3M/TQJS9w2F4A4ssNA+hZGLfubQC8/pBSBIZr2F6sAZlqnL3X22qtpq1VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="lq4/rkdh";
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E9C606A882
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51E9C606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lq4/rkdh
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb8c46e240so1580822a12.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794795531; x=1795400331; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWaReR4bzhmRE83sOuA7g3ELVWQ1hl3/rmqbCGqOefQ=;
        b=lq4/rkdhDdU0t0E70SuVoJba0wQmoLrKwbrn8O3JbFcAAfV45VDoLiMD/FZehbloNZ
         drRcFUHXZkloYRO3fLyNd+BkGSKXZBWK3srw1dPNmeNI9yIGyNhIQVwzKcn2vv2PcyR1
         gm7yp+AiA2+pHVmm2JzhW6h0OjYPwg5bxue25aMzv9T6NWlcn73aPQI2hqMOHEMgp/Pf
         ercLRyUMDQoxcRhnIvTKsx7ywYxphOiQkNE/5gDBxIexNoY7p20dd3+QZ7+a3jx0a2OD
         CqFfvqtJaNscubjOKS7z/xtLxDF1B6+q1Zjyyfo2rygMKVGm/PDmW6X9YrOQ8mXqGB14
         2wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795531; x=1795400331;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWaReR4bzhmRE83sOuA7g3ELVWQ1hl3/rmqbCGqOefQ=;
        b=rSYhZjUeuenGG/Li9yhwXfhjhIOczUNqLHU8+JwGw9fflHJ5NgKkQH6qtQ57iazuRX
         Qel9IYmPtd4N6iXvCbeWbdrNP35mnwvW2HKV5zUJxq2HGxGiVKzkKdVFmnMt/GhlgDi2
         vlLdm0xg8lqTHQ9vDrgNGmt56pfutv607swhVVaotzsZIj7yuqdiYCfg/2uLCta0rGR3
         iRoEKnn291JvilD2iUWDW6H/OqWaQl1SCyE594kyHyPEOllg/4f1BBkZwQ2wEaqiVzxZ
         sij+cHN97WjWEeW4yVrzcmJNryM4yn+D2dYEb9wM1D4kVJpVZ9+flqOb/G+G1JmO1aQI
         7nyQ==
X-Forwarded-Encrypted: i=1; AL+hErFxmDdVIqmPh60eOZJYZywN2KU5jNpXsaxR9MbLUFqRL62jI3IkE0vLvnqDq/hOq+SVnllnhCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JlmSQLLTbuW3BSGDam1I5/K//F+1hKDLcDMGQG5KkYLiViVTA
	eba62L+NyMI355/SjeVUhaQWRuP+3KAMANy5De8PysQj6e8q8Qr3M8CktAy0jq2CiptUVJQiyGp
	/xSrPJw==
X-Received: from pggo5-n2.prod.google.com ([2002:a05:6a02:8285:20b0:cc7:e0b2:a5a2])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7e87:b0:3eb:afe0:20aa
 with SMTP id adf61e73a8af0-3f7a71c3db4mr6777677637.20.1794795530506; Sun, 15
 Nov 2026 18:18:50 -0800 (PST)
Date: Mon, 16 Nov 2026 02:18:20 +0000
In-Reply-To: <20261116021845.2533130-1-kuniyu@google.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116021845.2533130-1-kuniyu@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116021845.2533130-4-kuniyu@google.com>
Subject: [PATCH v1 net-next 3/4] selftests: af_unix: Remove MSG_OOB tests.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

We will drop MSG_OOB support.

Let's remove msg_oob.c, MSG_OOB variants and flags field
in scm_rights.c.

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 .../testing/selftests/net/af_unix/.gitignore  |   1 -
 tools/testing/selftests/net/af_unix/Makefile  |   1 -
 tools/testing/selftests/net/af_unix/config    |   1 -
 tools/testing/selftests/net/af_unix/msg_oob.c | 958 ------------------
 .../selftests/net/af_unix/scm_rights.c        |  45 +-
 5 files changed, 1 insertion(+), 1005 deletions(-)
 delete mode 100644 tools/testing/selftests/net/af_unix/msg_oob.c

diff --git a/tools/testing/selftests/net/af_unix/.gitignore b/tools/testing/selftests/net/af_unix/.gitignore
index 954f0958dd03..b926e7f9625f 100644
--- a/tools/testing/selftests/net/af_unix/.gitignore
+++ b/tools/testing/selftests/net/af_unix/.gitignore
@@ -1,5 +1,4 @@
 diag_uid
-msg_oob
 scm_inq
 scm_pidfd
 scm_rights
diff --git a/tools/testing/selftests/net/af_unix/Makefile b/tools/testing/selftests/net/af_unix/Makefile
index 45b841758f1b..fb2e09f0f44b 100644
--- a/tools/testing/selftests/net/af_unix/Makefile
+++ b/tools/testing/selftests/net/af_unix/Makefile
@@ -7,7 +7,6 @@ CFLAGS += $(KHDR_INCLUDES) -Wall $(call cc-option,-Wflex-array-member-not-at-end
 
 TEST_GEN_PROGS := \
 	diag_uid \
-	msg_oob \
 	scm_inq \
 	scm_pidfd \
 	scm_rights \
diff --git a/tools/testing/selftests/net/af_unix/config b/tools/testing/selftests/net/af_unix/config
index 46450fea8407..549c33203c41 100644
--- a/tools/testing/selftests/net/af_unix/config
+++ b/tools/testing/selftests/net/af_unix/config
@@ -1,4 +1,3 @@
-CONFIG_AF_UNIX_OOB=y
 CONFIG_BPF=y
 CONFIG_BPF_EVENTS=y
 CONFIG_BPF_JIT=y
diff --git a/tools/testing/selftests/net/af_unix/msg_oob.c b/tools/testing/selftests/net/af_unix/msg_oob.c
deleted file mode 100644
index f051d79f7a8e..000000000000
--- a/tools/testing/selftests/net/af_unix/msg_oob.c
+++ /dev/null
@@ -1,958 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright Amazon.com Inc. or its affiliates. */
-
-#include <fcntl.h>
-#include <string.h>
-#include <unistd.h>
-
-#include <netinet/in.h>
-#include <sys/epoll.h>
-#include <sys/ioctl.h>
-#include <sys/signalfd.h>
-#include <sys/socket.h>
-
-#include "kselftest_harness.h"
-
-#define BUF_SZ	32
-
-FIXTURE(msg_oob)
-{
-	int fd[4];		/* 0: AF_UNIX sender
-				 * 1: AF_UNIX receiver
-				 * 2: TCP sender
-				 * 3: TCP receiver
-				 */
-	int signal_fd;
-	int epoll_fd[2];	/* 0: AF_UNIX receiver
-				 * 1: TCP receiver
-				 */
-	bool tcp_compliant;
-};
-
-FIXTURE_VARIANT(msg_oob)
-{
-	bool peek;
-};
-
-FIXTURE_VARIANT_ADD(msg_oob, no_peek)
-{
-	.peek = false,
-};
-
-FIXTURE_VARIANT_ADD(msg_oob, peek)
-{
-	.peek = true
-};
-
-static void create_unix_socketpair(struct __test_metadata *_metadata,
-				   FIXTURE_DATA(msg_oob) *self)
-{
-	int ret;
-
-	ret = socketpair(AF_UNIX, SOCK_STREAM | SOCK_NONBLOCK, 0, self->fd);
-	ASSERT_EQ(ret, 0);
-}
-
-static void create_tcp_socketpair(struct __test_metadata *_metadata,
-				  FIXTURE_DATA(msg_oob) *self)
-{
-	struct sockaddr_in addr;
-	socklen_t addrlen;
-	int listen_fd;
-	int ret;
-
-	listen_fd = socket(AF_INET, SOCK_STREAM, 0);
-	ASSERT_GE(listen_fd, 0);
-
-	ret = listen(listen_fd, -1);
-	ASSERT_EQ(ret, 0);
-
-	addrlen = sizeof(addr);
-	ret = getsockname(listen_fd, (struct sockaddr *)&addr, &addrlen);
-	ASSERT_EQ(ret, 0);
-
-	self->fd[2] = socket(AF_INET, SOCK_STREAM, 0);
-	ASSERT_GE(self->fd[2], 0);
-
-	ret = connect(self->fd[2], (struct sockaddr *)&addr, addrlen);
-	ASSERT_EQ(ret, 0);
-
-	self->fd[3] = accept(listen_fd, (struct sockaddr *)&addr, &addrlen);
-	ASSERT_GE(self->fd[3], 0);
-
-	ret = fcntl(self->fd[3], F_SETFL, O_NONBLOCK);
-	ASSERT_EQ(ret, 0);
-}
-
-static void setup_sigurg(struct __test_metadata *_metadata,
-			 FIXTURE_DATA(msg_oob) *self)
-{
-	struct signalfd_siginfo siginfo;
-	int pid = getpid();
-	sigset_t mask;
-	int i, ret;
-
-	for (i = 0; i < 2; i++) {
-		ret = ioctl(self->fd[i * 2 + 1], FIOSETOWN, &pid);
-		ASSERT_EQ(ret, 0);
-	}
-
-	ret = sigemptyset(&mask);
-	ASSERT_EQ(ret, 0);
-
-	ret = sigaddset(&mask, SIGURG);
-	ASSERT_EQ(ret, 0);
-
-	ret = sigprocmask(SIG_BLOCK, &mask, NULL);
-	ASSERT_EQ(ret, 0);
-
-	self->signal_fd = signalfd(-1, &mask, SFD_NONBLOCK);
-	ASSERT_GE(self->signal_fd, 0);
-
-	ret = read(self->signal_fd, &siginfo, sizeof(siginfo));
-	ASSERT_EQ(ret, -1);
-}
-
-static void setup_epollpri(struct __test_metadata *_metadata,
-			   FIXTURE_DATA(msg_oob) *self)
-{
-	struct epoll_event event = {
-		.events = EPOLLPRI,
-	};
-	int i;
-
-	for (i = 0; i < 2; i++) {
-		int ret;
-
-		self->epoll_fd[i] = epoll_create1(0);
-		ASSERT_GE(self->epoll_fd[i], 0);
-
-		ret = epoll_ctl(self->epoll_fd[i], EPOLL_CTL_ADD, self->fd[i * 2 + 1], &event);
-		ASSERT_EQ(ret, 0);
-	}
-}
-
-static void close_sockets(FIXTURE_DATA(msg_oob) *self)
-{
-	int i;
-
-	for (i = 0; i < 4; i++)
-		close(self->fd[i]);
-}
-
-FIXTURE_SETUP(msg_oob)
-{
-	create_unix_socketpair(_metadata, self);
-	create_tcp_socketpair(_metadata, self);
-
-	setup_sigurg(_metadata, self);
-	setup_epollpri(_metadata, self);
-
-	self->tcp_compliant = true;
-}
-
-FIXTURE_TEARDOWN(msg_oob)
-{
-	close_sockets(self);
-}
-
-static void __epollpair(struct __test_metadata *_metadata,
-			FIXTURE_DATA(msg_oob) *self,
-			bool oob_remaining)
-{
-	struct epoll_event event[2] = {};
-	int i, ret[2];
-
-	for (i = 0; i < 2; i++)
-		ret[i] = epoll_wait(self->epoll_fd[i], &event[i], 1, 0);
-
-	ASSERT_EQ(ret[0], oob_remaining);
-
-	if (self->tcp_compliant)
-		ASSERT_EQ(ret[0], ret[1]);
-
-	if (oob_remaining) {
-		ASSERT_EQ(event[0].events, EPOLLPRI);
-
-		if (self->tcp_compliant)
-			ASSERT_EQ(event[0].events, event[1].events);
-	}
-}
-
-static void __sendpair(struct __test_metadata *_metadata,
-		       FIXTURE_DATA(msg_oob) *self,
-		       const void *buf, size_t len, int flags)
-{
-	int i, ret[2];
-
-	for (i = 0; i < 2; i++) {
-		struct signalfd_siginfo siginfo = {};
-		int bytes;
-
-		ret[i] = send(self->fd[i * 2], buf, len, flags);
-
-		bytes = read(self->signal_fd, &siginfo, sizeof(siginfo));
-
-		if (flags & MSG_OOB) {
-			ASSERT_EQ(bytes, sizeof(siginfo));
-			ASSERT_EQ(siginfo.ssi_signo, SIGURG);
-
-			bytes = read(self->signal_fd, &siginfo, sizeof(siginfo));
-		}
-
-		ASSERT_EQ(bytes, -1);
-	}
-
-	ASSERT_EQ(ret[0], len);
-	ASSERT_EQ(ret[0], ret[1]);
-}
-
-static void __recvpair(struct __test_metadata *_metadata,
-		       FIXTURE_DATA(msg_oob) *self,
-		       const char *expected_buf, int expected_len,
-		       int buf_len, int flags, bool is_sender)
-{
-	int i, ret[2], recv_errno[2], expected_errno = 0;
-	char recv_buf[2][BUF_SZ] = {};
-	bool printed = false;
-
-	ASSERT_GE(BUF_SZ, buf_len);
-
-	errno = 0;
-
-	for (i = 0; i < 2; i++) {
-		int index = is_sender ? i * 2 : i * 2 + 1;
-
-		ret[i] = recv(self->fd[index], recv_buf[i], buf_len, flags);
-		recv_errno[i] = errno;
-	}
-
-	if (expected_len < 0) {
-		expected_errno = -expected_len;
-		expected_len = -1;
-	}
-
-	if (ret[0] != expected_len || recv_errno[0] != expected_errno) {
-		TH_LOG("AF_UNIX :%s", ret[0] < 0 ? strerror(recv_errno[0]) : recv_buf[0]);
-		TH_LOG("Expected:%s", expected_errno ? strerror(expected_errno) : expected_buf);
-
-		ASSERT_EQ(ret[0], expected_len);
-		ASSERT_EQ(recv_errno[0], expected_errno);
-	}
-
-	if (ret[0] != ret[1] || recv_errno[0] != recv_errno[1]) {
-		TH_LOG("AF_UNIX :%s", ret[0] < 0 ? strerror(recv_errno[0]) : recv_buf[0]);
-		TH_LOG("TCP     :%s", ret[1] < 0 ? strerror(recv_errno[1]) : recv_buf[1]);
-
-		printed = true;
-
-		if (self->tcp_compliant) {
-			ASSERT_EQ(ret[0], ret[1]);
-			ASSERT_EQ(recv_errno[0], recv_errno[1]);
-		}
-	}
-
-	if (expected_len >= 0) {
-		int cmp;
-
-		cmp = strncmp(expected_buf, recv_buf[0], expected_len);
-		if (cmp) {
-			TH_LOG("AF_UNIX :%s", ret[0] < 0 ? strerror(recv_errno[0]) : recv_buf[0]);
-			TH_LOG("Expected:%s", expected_errno ? strerror(expected_errno) : expected_buf);
-
-			ASSERT_EQ(cmp, 0);
-		}
-
-		cmp = strncmp(recv_buf[0], recv_buf[1], expected_len);
-		if (cmp) {
-			if (!printed) {
-				TH_LOG("AF_UNIX :%s", ret[0] < 0 ? strerror(recv_errno[0]) : recv_buf[0]);
-				TH_LOG("TCP     :%s", ret[1] < 0 ? strerror(recv_errno[1]) : recv_buf[1]);
-			}
-
-			if (self->tcp_compliant)
-				ASSERT_EQ(cmp, 0);
-		}
-	}
-}
-
-static void __setinlinepair(struct __test_metadata *_metadata,
-			    FIXTURE_DATA(msg_oob) *self)
-{
-	int i, oob_inline = 1;
-
-	for (i = 0; i < 2; i++) {
-		int ret;
-
-		ret = setsockopt(self->fd[i * 2 + 1], SOL_SOCKET, SO_OOBINLINE,
-				 &oob_inline, sizeof(oob_inline));
-		ASSERT_EQ(ret, 0);
-	}
-}
-
-static void __setblockingpair(struct __test_metadata *_metadata,
-			      FIXTURE_DATA(msg_oob) *self)
-{
-	int i;
-
-	for (i = 0; i < 2; i++) {
-		int ret, old_flags, flags;
-
-		old_flags = fcntl(self->fd[i * 2 + 1], F_GETFL, 0);
-		ASSERT_NE(-1, old_flags);
-
-		ret = fcntl(self->fd[i * 2 + 1], F_SETFL, old_flags & ~O_NONBLOCK);
-		ASSERT_EQ(0, ret);
-
-		flags = fcntl(self->fd[i * 2 + 1], F_GETFL, 0);
-		ASSERT_EQ(old_flags & ~O_NONBLOCK, flags);
-	}
-}
-
-static void __siocatmarkpair(struct __test_metadata *_metadata,
-			     FIXTURE_DATA(msg_oob) *self,
-			     bool oob_head)
-{
-	int answ[2] = {};
-	int i;
-
-	for (i = 0; i < 2; i++) {
-		int ret;
-
-		ret = ioctl(self->fd[i * 2 + 1], SIOCATMARK, &answ[i]);
-		ASSERT_EQ(ret, 0);
-	}
-
-	ASSERT_EQ(answ[0], oob_head);
-
-	if (self->tcp_compliant)
-		ASSERT_EQ(answ[0], answ[1]);
-}
-
-static void __resetpair(struct __test_metadata *_metadata,
-			FIXTURE_DATA(msg_oob) *self,
-			const FIXTURE_VARIANT(msg_oob) *variant,
-			bool reset)
-{
-	int i;
-
-	for (i = 0; i < 2; i++)
-		close(self->fd[i * 2 + 1]);
-
-	__recvpair(_metadata, self, "", reset ? -ECONNRESET : 0, 1,
-		   variant->peek ? MSG_PEEK : 0, true);
-}
-
-#define sendpair(buf, len, flags)					\
-	__sendpair(_metadata, self, buf, len, flags)
-
-#define recvpair(expected_buf, expected_len, buf_len, flags)		\
-	do {								\
-		if (variant->peek)					\
-			__recvpair(_metadata, self,			\
-				   expected_buf, expected_len,		\
-				   buf_len, (flags) | MSG_PEEK, false);	\
-		__recvpair(_metadata, self,				\
-			   expected_buf, expected_len,			\
-			   buf_len, flags, false);			\
-	} while (0)
-
-#define epollpair(oob_remaining)					\
-	__epollpair(_metadata, self, oob_remaining)
-
-#define siocatmarkpair(oob_head)					\
-	__siocatmarkpair(_metadata, self, oob_head)
-
-#define setinlinepair()							\
-	__setinlinepair(_metadata, self)
-
-#define setblockingpair()						\
-	__setblockingpair(_metadata, self)
-
-#define resetpair(reset)						\
-	__resetpair(_metadata, self, variant, reset)
-
-#define tcp_incompliant							\
-	for (self->tcp_compliant = false;				\
-	     self->tcp_compliant == false;				\
-	     self->tcp_compliant = true)
-
-TEST_F(msg_oob, non_oob)
-{
-	sendpair("x", 1, 0);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	recvpair("", -EINVAL, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	resetpair(true);
-}
-
-TEST_F(msg_oob, non_oob_no_reset)
-{
-	sendpair("x", 1, 0);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	recvpair("x", 1, 1, 0);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	resetpair(false);
-}
-
-TEST_F(msg_oob, oob)
-{
-	sendpair("x", 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("x", 1, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(true);
-
-	tcp_incompliant {
-		resetpair(false);		/* TCP sets -ECONNRESET for ex-OOB. */
-	}
-}
-
-TEST_F(msg_oob, oob_reset)
-{
-	sendpair("x", 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	resetpair(true);
-}
-
-TEST_F(msg_oob, oob_drop)
-{
-	sendpair("x", 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("", -EAGAIN, 1, 0);		/* Drop OOB. */
-	epollpair(false);
-	siocatmarkpair(false);
-
-	recvpair("", -EINVAL, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	resetpair(false);
-}
-
-TEST_F(msg_oob, oob_ahead)
-{
-	sendpair("hello", 5, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	recvpair("o", 1, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	recvpair("hell", 4, 4, 0);
-	epollpair(false);
-	siocatmarkpair(true);
-
-	tcp_incompliant {
-		resetpair(false);		/* TCP sets -ECONNRESET for ex-OOB. */
-	}
-}
-
-TEST_F(msg_oob, oob_break)
-{
-	sendpair("hello", 5, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	recvpair("hell", 4, 5, 0);		/* Break at OOB even with enough buffer. */
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("o", 1, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(true);
-
-	recvpair("", -EAGAIN, 1, 0);
-	siocatmarkpair(false);
-
-	resetpair(false);
-}
-
-TEST_F(msg_oob, oob_ahead_break)
-{
-	sendpair("hello", 5, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	sendpair("world", 5, 0);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	recvpair("o", 1, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	recvpair("hell", 4, 9, 0);		/* Break at OOB even after it's recv()ed. */
-	epollpair(false);
-	siocatmarkpair(true);
-
-	recvpair("world", 5, 5, 0);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	resetpair(false);
-}
-
-TEST_F(msg_oob, oob_break_drop)
-{
-	sendpair("hello", 5, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	sendpair("world", 5, 0);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	recvpair("hell", 4, 10, 0);		/* Break at OOB even with enough buffer. */
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("world", 5, 10, 0);		/* Drop OOB and recv() the next skb. */
-	epollpair(false);
-	siocatmarkpair(false);
-
-	recvpair("", -EINVAL, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	resetpair(false);
-}
-
-TEST_F(msg_oob, ex_oob_break)
-{
-	sendpair("hello", 5, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	sendpair("wor", 3, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	sendpair("ld", 2, 0);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	recvpair("hellowo", 7, 10, 0);		/* Break at OOB but not at ex-OOB. */
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("r", 1, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(true);
-
-	recvpair("ld", 2, 2, 0);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	resetpair(false);
-}
-
-TEST_F(msg_oob, ex_oob_drop)
-{
-	sendpair("x", 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	sendpair("y", 1, MSG_OOB);		/* TCP drops "x" at this moment. */
-	epollpair(true);
-
-	tcp_incompliant {
-		siocatmarkpair(false);
-
-		recvpair("x", 1, 1, 0);		/* TCP drops "y" by passing through it. */
-		epollpair(true);
-		siocatmarkpair(true);
-
-		recvpair("y", 1, 1, MSG_OOB);	/* TCP returns -EINVAL. */
-		epollpair(false);
-		siocatmarkpair(true);
-	}
-
-	resetpair(false);
-}
-
-TEST_F(msg_oob, ex_oob_drop_2)
-{
-	sendpair("x", 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	sendpair("y", 1, MSG_OOB);		/* TCP drops "x" at this moment. */
-	epollpair(true);
-
-	tcp_incompliant {
-		siocatmarkpair(false);
-	}
-
-	recvpair("y", 1, 1, MSG_OOB);
-	epollpair(false);
-
-	tcp_incompliant {
-		siocatmarkpair(false);
-
-		recvpair("x", 1, 1, 0);		/* TCP returns -EAGAIN. */
-		epollpair(false);
-		siocatmarkpair(true);
-	}
-
-	resetpair(false);
-}
-
-TEST_F(msg_oob, ex_oob_oob)
-{
-	sendpair("x", 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("x", 1, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(true);
-
-	sendpair("y", 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("", -EAGAIN, 1, 0);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	recvpair("", -EINVAL, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	resetpair(false);
-}
-
-TEST_F(msg_oob, ex_oob_ex_oob)
-{
-	sendpair("x", 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("x", 1, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(true);
-
-	sendpair("y", 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("y", 1, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(true);
-
-	tcp_incompliant {
-		resetpair(false);		/* TCP sets -ECONNRESET for ex-OOB. */
-	}
-}
-
-TEST_F(msg_oob, ex_oob_ex_oob_oob)
-{
-	sendpair("x", 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("x", 1, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(true);
-
-	sendpair("y", 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("y", 1, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(true);
-
-	sendpair("z", 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-}
-
-TEST_F(msg_oob, ex_oob_ahead_break)
-{
-	sendpair("hello", 5, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	sendpair("wor", 3, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	recvpair("r", 1, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	sendpair("ld", 2, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	tcp_incompliant {
-		recvpair("hellowol", 8, 10, 0);	/* TCP recv()s "helloworl", why "r" ?? */
-	}
-
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("d", 1, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(true);
-
-	tcp_incompliant {
-		resetpair(false);		/* TCP sets -ECONNRESET for ex-OOB. */
-	}
-}
-
-TEST_F(msg_oob, ex_oob_siocatmark)
-{
-	sendpair("hello", 5, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	recvpair("o", 1, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	sendpair("world", 5, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	recvpair("hell", 4, 4, 0);		/* Intentionally stop at ex-OOB. */
-	epollpair(true);
-	siocatmarkpair(false);
-
-	resetpair(true);
-}
-
-TEST_F(msg_oob, inline_oob)
-{
-	setinlinepair();
-
-	sendpair("x", 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("", -EINVAL, 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("x", 1, 1, 0);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	resetpair(false);
-}
-
-TEST_F(msg_oob, inline_oob_break)
-{
-	setinlinepair();
-
-	sendpair("hello", 5, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	recvpair("", -EINVAL, 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	recvpair("hell", 4, 5, 0);		/* Break at OOB but not at ex-OOB. */
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("o", 1, 1, 0);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	resetpair(false);
-}
-
-TEST_F(msg_oob, inline_oob_ahead_break)
-{
-	sendpair("hello", 5, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	sendpair("world", 5, 0);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	recvpair("o", 1, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	setinlinepair();
-
-	recvpair("hell", 4, 9, 0);		/* Break at OOB even with enough buffer. */
-	epollpair(false);
-	siocatmarkpair(true);
-
-	tcp_incompliant {
-		recvpair("world", 5, 6, 0);	/* TCP recv()s "oworld", ... "o" ??? */
-	}
-
-	epollpair(false);
-	siocatmarkpair(false);
-
-	resetpair(false);
-}
-
-TEST_F(msg_oob, inline_ex_oob_break)
-{
-	sendpair("hello", 5, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	sendpair("wor", 3, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	sendpair("ld", 2, 0);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	setinlinepair();
-
-	recvpair("hellowo", 7, 10, 0);		/* Break at OOB but not at ex-OOB. */
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("rld", 3, 3, 0);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	resetpair(false);
-}
-
-TEST_F(msg_oob, inline_ex_oob_no_drop)
-{
-	sendpair("x", 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	setinlinepair();
-
-	sendpair("y", 1, MSG_OOB);		/* TCP does NOT drops "x" at this moment. */
-	epollpair(true);
-	siocatmarkpair(false);
-
-	recvpair("x", 1, 1, 0);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	recvpair("y", 1, 1, 0);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	resetpair(false);
-}
-
-TEST_F(msg_oob, inline_ex_oob_drop)
-{
-	sendpair("x", 1, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(true);
-
-	sendpair("y", 1, MSG_OOB);		/* TCP drops "x" at this moment. */
-	epollpair(true);
-
-	setinlinepair();
-
-	tcp_incompliant {
-		siocatmarkpair(false);
-
-		recvpair("x", 1, 1, 0);		/* TCP recv()s "y". */
-		epollpair(true);
-		siocatmarkpair(true);
-
-		recvpair("y", 1, 1, 0);		/* TCP returns -EAGAIN. */
-		epollpair(false);
-		siocatmarkpair(false);
-	}
-
-	resetpair(false);
-}
-
-TEST_F(msg_oob, inline_ex_oob_siocatmark)
-{
-	sendpair("hello", 5, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	recvpair("o", 1, 1, MSG_OOB);
-	epollpair(false);
-	siocatmarkpair(false);
-
-	setinlinepair();
-
-	sendpair("world", 5, MSG_OOB);
-	epollpair(true);
-	siocatmarkpair(false);
-
-	recvpair("hell", 4, 4, 0);		/* Intentionally stop at ex-OOB. */
-	epollpair(true);
-	siocatmarkpair(false);
-
-	resetpair(true);
-}
-
-TEST_F(msg_oob, zero_buf_oob)
-{
-	sendpair("a", 1, MSG_OOB);
-	recvpair("", 0, 0, 0);
-}
-
-TEST_F(msg_oob, zero_buf_oob_blocking)
-{
-	sendpair("a", 1, MSG_OOB);
-	setblockingpair();
-	recvpair("", 0, 0, 0);
-}
-
-TEST_F(msg_oob, zero_buf_non_oob_oob)
-{
-	sendpair("ab", 2, MSG_OOB);
-	recvpair("", 0, 0, 0);
-}
-
-TEST_F(msg_oob, zero_buf_non_oob_oob_blocking)
-{
-	sendpair("ab", 2, MSG_OOB);
-	setblockingpair();
-	recvpair("", 0, 0, 0);
-}
-
-TEST_F(msg_oob, zero_buf_ex_oob_oob)
-{
-	sendpair("a", 1, MSG_OOB);
-	recvpair("a", 1, 1, MSG_OOB);
-
-	sendpair("b", 1, MSG_OOB);
-	recvpair("", 0, 0, 0);
-}
-
-TEST_F(msg_oob, zero_buf_ex_oob_oob_blocking)
-{
-	sendpair("a", 1, MSG_OOB);
-	recvpair("a", 1, 1, MSG_OOB);
-
-	sendpair("b", 1, MSG_OOB);
-	setblockingpair();
-	recvpair("", 0, 0, 0);
-}
-
-TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/net/af_unix/scm_rights.c b/tools/testing/selftests/net/af_unix/scm_rights.c
index c165f250220a..40459fb21b73 100644
--- a/tools/testing/selftests/net/af_unix/scm_rights.c
+++ b/tools/testing/selftests/net/af_unix/scm_rights.c
@@ -21,7 +21,6 @@ FIXTURE_VARIANT(scm_rights)
 {
 	char name[32];
 	int type;
-	int flags;
 	bool test_listener;
 	bool disabled;
 };
@@ -30,7 +29,6 @@ FIXTURE_VARIANT_ADD(scm_rights, dgram)
 {
 	.name = "UNIX ",
 	.type = SOCK_DGRAM,
-	.flags = 0,
 	.test_listener = false,
 	.disabled = false,
 };
@@ -39,7 +37,6 @@ FIXTURE_VARIANT_ADD(scm_rights, dgram_disabled)
 {
 	.name = "UNIX ",
 	.type = SOCK_DGRAM,
-	.flags = 0,
 	.test_listener = false,
 	.disabled = true,
 };
@@ -48,7 +45,6 @@ FIXTURE_VARIANT_ADD(scm_rights, stream)
 {
 	.name = "UNIX-STREAM ",
 	.type = SOCK_STREAM,
-	.flags = 0,
 	.test_listener = false,
 	.disabled = false,
 };
@@ -57,25 +53,6 @@ FIXTURE_VARIANT_ADD(scm_rights, stream_disabled)
 {
 	.name = "UNIX-STREAM ",
 	.type = SOCK_STREAM,
-	.flags = 0,
-	.test_listener = false,
-	.disabled = true,
-};
-
-FIXTURE_VARIANT_ADD(scm_rights, stream_oob)
-{
-	.name = "UNIX-STREAM ",
-	.type = SOCK_STREAM,
-	.flags = MSG_OOB,
-	.test_listener = false,
-	.disabled = false,
-};
-
-FIXTURE_VARIANT_ADD(scm_rights, stream_oob_disabled)
-{
-	.name = "UNIX-STREAM ",
-	.type = SOCK_STREAM,
-	.flags = MSG_OOB,
 	.test_listener = false,
 	.disabled = true,
 };
@@ -84,7 +61,6 @@ FIXTURE_VARIANT_ADD(scm_rights, stream_listener)
 {
 	.name = "UNIX-STREAM ",
 	.type = SOCK_STREAM,
-	.flags = 0,
 	.test_listener = true,
 	.disabled = false,
 };
@@ -93,25 +69,6 @@ FIXTURE_VARIANT_ADD(scm_rights, stream_listener_disabled)
 {
 	.name = "UNIX-STREAM ",
 	.type = SOCK_STREAM,
-	.flags = 0,
-	.test_listener = true,
-	.disabled = true,
-};
-
-FIXTURE_VARIANT_ADD(scm_rights, stream_listener_oob)
-{
-	.name = "UNIX-STREAM ",
-	.type = SOCK_STREAM,
-	.flags = MSG_OOB,
-	.test_listener = true,
-	.disabled = false,
-};
-
-FIXTURE_VARIANT_ADD(scm_rights, stream_listener_oob_disabled)
-{
-	.name = "UNIX-STREAM ",
-	.type = SOCK_STREAM,
-	.flags = MSG_OOB,
 	.test_listener = true,
 	.disabled = true,
 };
@@ -297,7 +254,7 @@ void __send_fd(struct __test_metadata *_metadata,
 	cmsg->cmsg_len = CMSG_LEN(sizeof(fds));
 	memcpy(CMSG_DATA(cmsg), fds, sizeof(fds));
 
-	ret = sendmsg(self->fd[receiver * 2 + 1], &msg, variant->flags);
+	ret = sendmsg(self->fd[receiver * 2 + 1], &msg, 0);
 
 	if (variant->disabled) {
 		ASSERT_EQ(-1, ret);
-- 
2.56.0.611.g1030f0b940-goog

