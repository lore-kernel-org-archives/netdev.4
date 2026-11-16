Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795530;
	b=UkDSgqWLjBfxTPNpiEFkp2G8HgC594LBFMnVZrEbWwkT76jxwU0hCPVCSjfEgunIeItB
	 gjPB7vhfMP618qhU41/z0yHdFLW8nD/3RcvY/gZceDWxtcANT4NgRa0HxWrQJcnxI1MCC
	 uNgb5Eh2nAhIZhJAAjNPsr2qHRJksg5JrFqRrwUWDYjjcbdXJF3MFv7ZwKzyzTZz+boLJ
	 W+rMWW7LxBgfR+uoEbPAmzo9a31dz6JaU1v34HetlMVsSDw0FH8NUfZDrpQ4G1d8iA0Bm
	 fuyrQy9rYzg2QPAVd8UZtAWjz90J+0wDFOsRjtOys9f8LYqqPttsexIQMW55np8uExg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=mDU7d++9XV6m2DXK53K/gwKKWKdcT47vGxaP9IlrYfM=;
	b=p1MsZIolt8hYVod6pVV6mH/xkek1OGp6opNxNPkVPTXh4uMULyHyr6ixbaHTSAO7JCNy
	 q2Ss2DOjC94QmMk8lMODey7KF09HqTjJXNnFRS52eOaG/pI4JXkzB5TiWjGu1D5uYFAXu
	 AJZ86WxqpjtOoku/EDmbO25tYerXJUwhx6h+W/AsrDsDX6q9DsmpxvmLCQhNSTuTShsX+
	 BpWl8wkF/yIXLIod2hb6uFhLqQco4kgzAXEx/0qlWQsb6LE+zD8iUwt4kSCOTTmQ2htoj
	 i45OZkEV5vcj4INBWDZqJMpT3rFdKZ7fdcPbBEX6flug+1TBXN13e4P7O6b1UsGx8qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cI47gOEe;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E3E606A31F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0E3E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cI47gOEe
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so1043723a91.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794795529; x=1795400329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mDU7d++9XV6m2DXK53K/gwKKWKdcT47vGxaP9IlrYfM=;
        b=cI47gOEe/1/dWLgczvIIgoTAdggZLX3vt7xB70FDZi5S2WqSwMKUDRcJfe1Rx2Jef6
         OOPEXqtiaWbu3Ioujwb2zb4hvBj08HzdN/6U3dK79HuVMKVzpnbLdy+NWNcnkWqUWuVK
         ixswREhvnVcu+Ge06+qPUNyTuZLph/GsaLRqWjuUtZweWeAv6NcW+La/bG224wuSBuzg
         ykwK9jXbxQQHdWtl1F0aJZ5TXPXeYdTSQ92W9V9AN/dzYc2q3lcGtnuIKjAEJb0CRRjH
         DBEKDR6JqmGIl6XoLHn2RvbCcEFQW/hz1mNCnwEB2hlsW6lCDrGBprRcMIZZW4oifAH5
         K2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795529; x=1795400329;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDU7d++9XV6m2DXK53K/gwKKWKdcT47vGxaP9IlrYfM=;
        b=Tp4HKpviIHu5lQ2AhnNqkAm4tSQfgOQYx2U1EPWur9revSZmQ46sA4OFsKKzfzYEN1
         CQlbJflfiBiAIWrw8XI4wZfrswiorAqcfu5bntG1gbi76SpLWBp5suAOPgHdtj5/azsI
         I3n9UKdp1jmbUxlcjBaddNas3msqcJKsMJiU0TdxE4i8OjJMR4x5V8cQyIP8WdGFWY+6
         7JH2toVuf2YT7IoRA7HPwzznk+CyA+yCC6y5PVXZEK8fF7TNFeM0vrj3VrmvU+EXGd6n
         0AXDYryCx5fO61G7bIhvk5BBsz9o055TIP43zUVmUsT0qoFi9NoBcVgCW8vsreVad3py
         KdDQ==
X-Forwarded-Encrypted: i=1; AL+hErEFAEQy8Qmju6Hsxin+d7S4OmjWgGbA6x/r2eBo5X5afZa8Oqk3++iZIDSvDAvlM9gC1TWcbuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z90mDmdDlRxnU3eVzjhSTQFvf9uSSJhqmv5XQfXmDJ/12WiJf
	whkcTMSQfYJRxjper26hQ4h1YXuxvEkANznSoJXGGURn8W/TaXF044hFOLZXtTTZMc7qvQ8r5zL
	sejQHNw==
X-Received: from pjbbj17.prod.google.com ([2002:a17:90b:891:b0:3ae:349e:2bcd])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c02:b0:3b1:922a:7b22
 with SMTP id 98e67ed59e1d1-3b1b0d77ae9mr9727852a91.60.1794795528987; Sun, 15
 Nov 2026 18:18:48 -0800 (PST)
Date: Mon, 16 Nov 2026 02:18:18 +0000
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
Message-ID: <20261116021845.2533130-2-kuniyu@google.com>
Subject: [PATCH v1 net-next 1/4] selftests: landlock: Replace MSG_OOB with O_ASYNC+F_SETSIG.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, "=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

AF_UNIX will drop MSG_OOB support.

scoped_signal_test.c uses MSG_OOB in fown.sigurg_socket and
trace_fown.deny_scope_fown to trigger SIGURG and exercise
security_file_send_sigiotask().

The same hook can be exercised via send_sigio() with a plain send()
by setting O_ASYNC and F_SETSIG with SIGURG on recv_socket.

Let's replace MSG_OOB with O_ASYNC and F_SETSIG so that the tests
do not depend on CONFIG_AF_UNIX_OOB.

Note that with O_ASYNC set on recv_socket, closing client_socket
while recv_socket is still open also triggers SIGURG for POLL_HUP
in unix_release_sock(), which would emit an extra
landlock_deny_scope_signal trace event in
trace_fown.deny_scope_fown.  Thus, the child waits for the parent
to close recv_socket via pipe_parent before closing client_socket.

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
Cc: "Micka=C3=ABl Sala=C3=BCn" <mic@digikod.net>
Cc: "G=C3=BCnther Noack" <gnoack@google.com>
Cc: linux-security-module@vger.kernel.org
---
 tools/testing/selftests/landlock/config       |  1 -
 .../selftests/landlock/scoped_signal_test.c   | 55 ++++++++-----------
 2 files changed, 22 insertions(+), 34 deletions(-)

diff --git a/tools/testing/selftests/landlock/config b/tools/testing/selfte=
sts/landlock/config
index 5568d7a4b2d7..fb617c1a4ce3 100644
--- a/tools/testing/selftests/landlock/config
+++ b/tools/testing/selftests/landlock/config
@@ -1,4 +1,3 @@
-CONFIG_AF_UNIX_OOB=3Dy
 CONFIG_AUDIT=3Dy
 CONFIG_CGROUPS=3Dy
 CONFIG_CGROUP_SCHED=3Dy
diff --git a/tools/testing/selftests/landlock/scoped_signal_test.c b/tools/=
testing/selftests/landlock/scoped_signal_test.c
index 259cdcc8aa5c..c4c365007370 100644
--- a/tools/testing/selftests/landlock/scoped_signal_test.c
+++ b/tools/testing/selftests/landlock/scoped_signal_test.c
@@ -405,24 +405,6 @@ static int setup_signal_handler(int signal)
 	return sigaction(SIGURG, &sa, NULL);
 }
=20
-/*
- * MSG_OOB might be disabled in the kernel via the CONFIG_AF_UNIX_OOB
- * switch, so this function can be used for probing for its availability.
- */
-static bool has_af_unix_oob(void)
-{
-	bool available =3D false;
-	int sp[2];
-
-	if (socketpair(AF_UNIX, SOCK_STREAM, 0, sp) =3D=3D 0) {
-		available =3D (send(sp[0], ".", 1, MSG_OOB) =3D=3D 1);
-		close(sp[0]);
-		close(sp[1]);
-	}
-
-	return available;
-}
-
 /* clang-format off */
 FIXTURE(fown) {};
 /* clang-format on */
@@ -473,8 +455,8 @@ FIXTURE_TEARDOWN(fown)
 }
=20
 /*
- * Sending an out of bound message will trigger the SIGURG signal
- * through file_send_sigiotask.
+ * Sending a message to a socket with O_ASYNC will trigger
+ * the SIGURG signal through file_send_sigiotask.
  */
 TEST_F(fown, sigurg_socket)
 {
@@ -485,9 +467,6 @@ TEST_F(fown, sigurg_socket)
 	int pipe_parent[2], pipe_child[2];
 	pid_t child;
=20
-	if (!has_af_unix_oob())
-		SKIP(return, "CONFIG_AF_UNIX_OOB / MSG_OOB not available");
-
 	memset(&server_address, 0, sizeof(server_address));
 	set_unix_address(&server_address, 0);
=20
@@ -521,14 +500,14 @@ TEST_F(fown, sigurg_socket)
 		 */
 		ASSERT_EQ(1, read(pipe_parent[0], &buffer_child, 1));
 		/* May signal itself. */
-		ASSERT_EQ(1, send(client_socket, ".", 1, MSG_OOB));
-		EXPECT_EQ(0, close(client_socket));
+		ASSERT_EQ(1, send(client_socket, ".", 1, 0));
 		ASSERT_EQ(1, write(pipe_child[1], ".", 1));
 		EXPECT_EQ(0, close(pipe_child[1]));
=20
 		/* Waits for the message to be received. */
 		ASSERT_EQ(1, read(pipe_parent[0], &buffer_child, 1));
 		EXPECT_EQ(0, close(pipe_parent[0]));
+		EXPECT_EQ(0, close(client_socket));
=20
 		if (variant->sandbox_setown =3D=3D SANDBOX_BEFORE_SETOWN) {
 			ASSERT_EQ(0, signal_received);
@@ -560,20 +539,22 @@ TEST_F(fown, sigurg_socket)
 		create_scoped_domain(_metadata, LANDLOCK_SCOPE_SIGNAL);
=20
 	/*
-	 * Sets the child to receive SIGURG for MSG_OOB.  This uncommon use is
+	 * Sets the child to receive SIGURG.  This uncommon use is
 	 * a valid attack scenario which also simplifies this test.
 	 */
 	ASSERT_EQ(0, fcntl(recv_socket, F_SETOWN, child));
+	ASSERT_EQ(0, fcntl(recv_socket, F_SETSIG, SIGURG));
+	ASSERT_EQ(0, fcntl(recv_socket, F_SETFL, O_ASYNC));
=20
 	if (variant->sandbox_setown =3D=3D SANDBOX_AFTER_SETOWN)
 		create_scoped_domain(_metadata, LANDLOCK_SCOPE_SIGNAL);
=20
 	ASSERT_EQ(1, write(pipe_parent[1], ".", 1));
=20
-	/* Waits for the child to send MSG_OOB. */
+	/* Waits for the child to send data. */
 	ASSERT_EQ(1, read(pipe_child[0], &buffer_parent, 1));
 	EXPECT_EQ(0, close(pipe_child[0]));
-	ASSERT_EQ(1, recv(recv_socket, &buffer_parent, 1, MSG_OOB));
+	ASSERT_EQ(1, recv(recv_socket, &buffer_parent, 1, 0));
 	EXPECT_EQ(0, close(recv_socket));
 	EXPECT_EQ(0, close(server_socket));
 	ASSERT_EQ(1, write(pipe_parent[1], ".", 1));
@@ -1085,11 +1066,15 @@ TEST_F(trace_fown, deny_scope_fown)
 		 */
 		ASSERT_EQ(1, read(pipe_parent[0], &buffer_child, 1));
 		/* Triggers the asynchronous SIGURG to this file owner. */
-		ASSERT_EQ(1, send(client_socket, ".", 1, MSG_OOB));
-		EXPECT_EQ(0, close(client_socket));
+		ASSERT_EQ(1, send(client_socket, ".", 1, 0));
 		ASSERT_EQ(1, write(pipe_child[1], ".", 1));
 		EXPECT_EQ(0, close(pipe_child[1]));
=20
+		/* Waits for the message to be received. */
+		ASSERT_EQ(1, read(pipe_parent[0], &buffer_child, 1));
+		EXPECT_EQ(0, close(pipe_parent[0]));
+		EXPECT_EQ(0, close(client_socket));
+
 		_exit(0);
 		return;
 	}
@@ -1114,19 +1099,23 @@ TEST_F(trace_fown, deny_scope_fown)
 		create_scoped_domain(_metadata, LANDLOCK_SCOPE_SIGNAL);
=20
 	/*
-	 * Sets the child to receive SIGURG for MSG_OOB.  This uncommon use is a
+	 * Sets the child to receive SIGURG.  This uncommon use is a
 	 * valid attack scenario which also simplifies this test.
 	 */
 	ASSERT_EQ(0, fcntl(recv_socket, F_SETOWN, child));
+	ASSERT_EQ(0, fcntl(recv_socket, F_SETSIG, SIGURG));
+	ASSERT_EQ(0, fcntl(recv_socket, F_SETFL, O_ASYNC));
=20
 	ASSERT_EQ(1, write(pipe_parent[1], ".", 1));
=20
-	/* Waits for the child to send MSG_OOB. */
+	/* Waits for the child to send data. */
 	ASSERT_EQ(1, read(pipe_child[0], &buffer_parent, 1));
 	EXPECT_EQ(0, close(pipe_child[0]));
-	ASSERT_EQ(1, recv(recv_socket, &buffer_parent, 1, MSG_OOB));
+	ASSERT_EQ(1, recv(recv_socket, &buffer_parent, 1, 0));
 	EXPECT_EQ(0, close(recv_socket));
 	EXPECT_EQ(0, close(server_socket));
+	ASSERT_EQ(1, write(pipe_parent[1], ".", 1));
+	EXPECT_EQ(0, close(pipe_parent[1]));
=20
 	ASSERT_EQ(child, waitpid(child, &status, 0));
 	ASSERT_TRUE(WIFEXITED(status));
--=20
2.56.0.611.g1030f0b940-goog

