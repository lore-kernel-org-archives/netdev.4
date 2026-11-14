Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673610;
	b=ZwQ8WCKYNO96XTP26GyuJHpgpLobFlthrzbiZ8DrlbYfmSYwxY/bH/B8LKRU+l1UwqdM
	 ZcpvOz7Q77hOBC0B4fCQ3DyosyVE20sojnNdhxsGMnGvIahf0VjfZiM3wOpyzQn9iw9fa
	 ErHPzW6sq+dntyYTPUyEd24jyJ0UxgRsC6bs1GkfIq9j4vntnjnXQclv6b7i4L1od7Xv9
	 g0NIMXGl6U+dD5NrQHqLrLBPpSlfrS22kH9XoSKY5KN0FdruHRN1NC8futytVfn7rPS08
	 XUK20j7uHzFruOvVP5V17txIRqmpfZfQ/RWSOjtZRhpbleKhy3bmm2r0n4Pkc4i5J1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=soJ4jjpDPBCnxqBMue7ymudhbAVotnUPrgSAUa7XWXo=;
	b=ACRJ/PlCUBG1nGhqcIj23LjyEuux5eMbn3Zu514o0kHZbnSDILQLUA6OtB9YGHKVZn0R
	 XBO9+DA7+I9+xMWc+RULihNF+45O9DGLOxKQn3paKTHk3X3D+sLf4x7UTdnneLlDric+U
	 R+pTvzZDnP5ap7Rn0G8YjinHqk0tILLreoZcQWFMC5V7Kvr4TSIUwWj8G0vPGNzJSwi2A
	 MLEtz+zLz1yWr5H/yijPDhIVksbRJqAsqGVaUAqJccktC6ERx7r+uRFUlZGmgCgrReG86
	 I1aVK6XVKRDQPNcF1miTnw68j90AdKjquqqFjyT/yW6/6wovr12GPdQUnXvNKVQj9HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PE367vk;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15936606A8A5
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15936606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PE367vk
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ede35b0cf2so16036205ad.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673609; x=1795278409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soJ4jjpDPBCnxqBMue7ymudhbAVotnUPrgSAUa7XWXo=;
        b=0PE367vkhMov64BmEHF86qirTh/Zmd0NSzk3nADN94n23tbjdGS+qcKsgD5PGI3qnx
         yWS8iMxIyoa7AAlQ/E37sXKWDZ0+MS9yIZjfrfdMjNC0Thf3pkkl97FYGRClRhuBLLzg
         rXhivnz0kCOlq35pKwouKf2g6hOCQSXTAqM5Y/YWkXGv5wB0VXPgv86XY1C/3vkGX1C3
         UayUE200nbgk91Nfnq/GPSxl/SWuSLMWf7Goo0bAmUTk0fUHufyu5eWQF61zNx+lw+uN
         Ar/i/zGogt3DIeWHK4PF2jWmZNM/Jrz4VMNNfHsc+sOwaN0k9om0F8t0CLzw2J38YpEm
         ZmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673609; x=1795278409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=soJ4jjpDPBCnxqBMue7ymudhbAVotnUPrgSAUa7XWXo=;
        b=ATAX+p/RlwFTOBUxUJfCQ1OA+Su6UVeXlBUZhCqJz/JbTucPGz2l+nTtSf3bYb0FxB
         ZUnRIErPH0bv9CWS0QeN4UhFoP1uVX+u2kFmkYRirzmaXppc5C17UJ1pjT+hqs5//uDk
         Y1hTR8RcCCQkPrRz0pxnP67el7v969u0TTWyCi0i7DaQdOXTqCw9ujFW/7frDlU0CiPs
         oHKbatHeoBcrMom6FG6p2CdwlvB0eFSJMZ62dzS6PJ8ZPb+VZYoXXnyIxMirh4iXaBHM
         7FRsQ392G0NgD3i8MMwRpIZuS3acNu8Dj5RUcaoctTYmZWcHGzuJRfllOAgDbf8MhHYg
         HknA==
X-Forwarded-Encrypted: i=1; AL+hErGzdPWWCV9Qw1YM+OatTw8mDbrGsyTyn0vd9JVWfAvcO8xB/bv3OORUZAuQ06KFtinH7xdmpjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+daO+Q3qNvu0VyiAGPjB5fUZCCPnukzVttVq2/AIP0wqdiksjX
	4PszMCon5yujHIoQBsY2deLMKAp1Kt3EteojA2UV7xUqzGOW5a+ACFw7
X-Gm-Gg: AYBFou2oGLk8/QweHNJIpuh5j8WyEDLtcjfH61l6uMDczHGb8FKE0W1QzO/QbWHfQb5
	UJJWhlfYas69W96iyUdy/oS9WvLWO/h/opRA8csImJMxAvybvAxka7P9yNGcdgasv4YItVYIuiF
	v7vhGIO2aGYo6XoGP9Qu7Lno8xBsNykzKOorvoMYNHTo2IHcTg4NHQ1OxXrgeXZkOz8+ZbD7IIM
	xb4iKEfB9dxqV2Vuwggoanw9U9lFIon9yeVyjFJf0HtFdjHO10pO47BZRrtxEBCHnkePbOS6X1E
	oG0Xwyl4oOUqK9QoffeLaUxjjAde1dmRXmMDLSGEPYIHbdWDMcqCuA2rJhjOVsDU6WIuFQibf2T
	Pvc3R9IYHmqiVPMfA19Q16n8OpZbnP/kLmRR2bz9I9W54FZ6w4DK75eaLkkNjnfz5qS+BIZrYsc
	dN5lEhPM5oedhLKd/f76hOpBZhpSPhSvV303d+FjIGmv4LrEFymvP4fZeM4nchiIZXvv3VUK3x5
	azBElqND6J+qQnPC2qyasvBhLQg2IVIagvFcJnLoTbZCQEV+u0UfQUHE7Ust0q+/8hotOh3Emr8
	BdcqgKYXACnPMVfMusbv3koJ0L2LXJh3pi1MkE7aBPq4A9JsUxYcoMNc6yMe/NWC5mUTPdPfqlB
	uTldGw5dNwmEetsymq0QiZJse1vv2FcqoVKj82MAXXt6K7BRvPkIXNZ5Ptbg1m91UTs+dV56F1u
	l6qVxO1ZgvWVOL+yDYCnZa6iTWGyzXkWRGTmC+RW+M
X-Received: by 2002:a17:90a:d2cf:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3b1b0b669d6mr5757395a91.10.1794673609429;
        Sat, 14 Nov 2026 08:26:49 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm10229142a91.11.2026.11.14.08.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:26:49 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	rlmenge@gmail.com,
	egoriluk@gmail.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net v3 2/2] selftest: af_unix: Test scm_fds on dgram disconnect.
Date: Sat, 14 Nov 2026 16:26:32 +0000
Message-ID: <20261114162632.16346-3-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114162632.16346-1-sidchintamaneni@gmail.com>
References: <20261114162632.16346-1-sidchintamaneni@gmail.com>
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

Add dgram_disconnect_fdinfo in scm_rights.c verifying that scm_fds in
/proc/self/fdinfo/<fd> returns to 0 when a connected SOCK_DGRAM socket
with queued SCM_RIGHTS datagrams disconnects via connect(AF_UNSPEC) or
observes a dead peer in send().

Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 .../selftests/net/af_unix/scm_rights.c        | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/tools/testing/selftests/net/af_unix/scm_rights.c b/tools/testing/selftests/net/af_unix/scm_rights.c
index c165f250220a..19aa26c60f3b 100644
--- a/tools/testing/selftests/net/af_unix/scm_rights.c
+++ b/tools/testing/selftests/net/af_unix/scm_rights.c
@@ -395,4 +395,79 @@ TEST_F(scm_rights, mixed_lowpoint)
 	close_sockets(6);
 }
 
+static int count_scm_fds(struct __test_metadata *_metadata, int fd)
+{
+	char path[64], *line = NULL;
+	int scm_fds = -1, ret;
+	size_t unused = 0;
+	FILE *f;
+
+	snprintf(path, sizeof(path), "/proc/self/fdinfo/%d", fd);
+
+	f = fopen(path, "r");
+	ASSERT_NE(NULL, f);
+
+	while (getline(&line, &unused, f) != -1) {
+		if (strncmp(line, "scm_fds:", 8))
+			continue;
+
+		ret = sscanf(line + 8, "%d", &scm_fds);
+		ASSERT_EQ(1, ret);
+
+		break;
+	}
+
+	free(line);
+
+	ret = fclose(f);
+	ASSERT_EQ(0, ret);
+
+	return scm_fds;
+}
+
+TEST(dgram_disconnect_fdinfo)
+{
+	const FIXTURE_VARIANT(scm_rights) variant = {
+		.name = "UNIX ",
+		.type = SOCK_DGRAM,
+	};
+	FIXTURE_DATA(scm_rights) self = {};
+	struct sockaddr addr = {
+		.sa_family = AF_UNSPEC,
+	};
+	int ret;
+
+	ret = unshare(CLONE_NEWNET);
+	ASSERT_EQ(0, ret);
+
+	create_socketpairs(_metadata, &self, &variant, 2);
+
+	/* 1. Disconnect via connect(AF_UNSPEC) */
+	__send_fd(_metadata, &self, &variant, 0, 0);
+	ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[0]));
+
+	ret = connect(self.fd[0], &addr, sizeof(addr.sa_family));
+	ASSERT_EQ(0, ret);
+	ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[0]));
+
+	/* 2. Dead-peer disconnect via send() */
+	__send_fd(_metadata, &self, &variant, 1, 1);
+	ASSERT_EQ(2, count_scm_fds(_metadata, self.fd[2]));
+
+	ret = close(self.fd[3]);
+	ASSERT_EQ(0, ret);
+
+	ret = send(self.fd[2], "x", 1, 0);
+	ASSERT_EQ(-1, ret);
+	ASSERT_EQ(ECONNREFUSED, errno);
+	ASSERT_EQ(0, count_scm_fds(_metadata, self.fd[2]));
+
+	ret = close(self.fd[0]);
+	ASSERT_EQ(0, ret);
+	ret = close(self.fd[1]);
+	ASSERT_EQ(0, ret);
+	ret = close(self.fd[2]);
+	ASSERT_EQ(0, ret);
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

