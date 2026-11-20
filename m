Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196629;
	b=22V77ICkstkT9DpogTzw23jCGptWzJm3OKK7nmlaWNvbc3f5gVb2PqXvks1VXxsrHSj7
	 X4rDJewDKJC024SMCKUhhe0Lo19S+ntjCn5BsjjQHLQgGUZ3B4W18HWQ8JeG0UjiCoeiV
	 xqxnzczXeavmyCZzNSJ/uWqY4Il3nlF1ISsSNlclRTWUJtflCRUqOE79bZLob1NiNgjr+
	 o/oD5SLtH2C22dNjhbsF42TjMwdrKF/mq04Hc0ZnNIX8UfoY02AEBnvvgCWlxpGpuiVLX
	 rSvu2QoJZ4bY/+6aX/iVjQ/twWvk0uHoqIJ/HPxIvLRM4iLViYsQASgLmMd5EQDf5gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Lk7Qvdty/kP051BKcCJgvdEe/6/wWSs6Fi35IE/5fU4=;
	b=2BJsj8eaKauxxnUoTUdikzKh8U0ce4X6lxn1KeTXh3WQRIra3fBalhohhmyKsm26O/B7
	 XdFT3FhLLOEo5eT5HAhUuoccTC26NFiRvtvuLtTSYV7fNVHyRG4eddv3e0jUlntjVVcUE
	 EkqBsRaY7u9spBYpBGrYkTY5olrNXsP3klzS6gzXtPo5r2lZSaQD/NZVz5cab5oIhgoa1
	 ni+uFMYYRdiBzbrL3s2gScA/ppG/Tq8priMTLKuT8nRp16FvzZDgj3uw2WNOnk7NoI/DJ
	 3KcwE4mHCuj/Pzv/gYu8dNI+u9xYY3/ajSXmwNOf0B7pPM8+yJ93oqMFW5wSIThUrKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cXhwszKz;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EAC606A7D3
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01EAC606A7D3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cXhwszKz
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-99e740a7131so405382241.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196628; x=1795801428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lk7Qvdty/kP051BKcCJgvdEe/6/wWSs6Fi35IE/5fU4=;
        b=cXhwszKzmi1uRYcxKJ7V8hxhEioP8bAdekNIhlMKyG0EqFYvPG3AlJsX987pmURtlV
         NHDTiFkp89uslxjmENfjeHiiXwFHdQmrsMOWuTgTYbQYjxFYfUqF6x1lkDbxOV4nJgfn
         L2SCtwuOtfucDNTpFxKZyEvJ0JU9lDco0gd26MoeBlmAeGZbvLxrJjrI+axboUV6hFW+
         mbk6fhkbleUXrB7PeVdg64yH5waz74ZIPbyI8xatcH9dzfUzlGBWgF+TgCw58YMXu/1a
         q3/wd+ThUp+ANBNrCo0Z8Idxe64USQvfjvt4EQAvb7RFHa6cDoz/N2ddiGVvtRLIBm8T
         2Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196628; x=1795801428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lk7Qvdty/kP051BKcCJgvdEe/6/wWSs6Fi35IE/5fU4=;
        b=rBYHQGSf6FqEDXA5t9yqjK5+hzLVK/ZZPtNUAkUe1U3NF9lTJWn+fQAdJm4bfgdgui
         n0YYvJ3qQE1VxqoC2i5JWINiF3UM0NVW4DuCmoWzetofoctJQBe1Jp4ByDiHGAYxss2O
         u5QEwKpWNxYl+hzOPaXqkCn4hvMos6dZ5LGhDG6vdGbHXzoUPVdYKE55rQK3MgfjgitF
         leomQ9bCQOkklnXf1m14XROVhLg6boVq1H+yHTqgPwNKZyDYa3DSgM1p7ugbgfNpcf32
         oCmP6zrd3z2TighpJiuMtGXDesBqlpxZElwQAQrph3mVHVI3dqHf0PZw8Isks2Eh7JJP
         Y7vQ==
X-Forwarded-Encrypted: i=1; AL+hErHvk9QhXlIfuj+UfmqyIkgQabXzHFaas1QueykcAoP/W2TgltSMN0fw4rw64dNBOZlgxttaYUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S83iYbWhalqtw5ryMh7tBCMPS6Fmxml5w6OrDeIp1SY0eY3A9
	4C8RTLTuO0Dg1YSevb+6v1deFlQ511NgevvxIlHqmJujOzgbIiy+kuRJ
X-Gm-Gg: AZFdTZcDXo9lRvUgq8YTBNG6uM6mXGwMCihvo32B9tN4zKSp9RmH4PMVvsrZB9BZ/Hx
	YVHwjNJPLkSTchwQQUE7ZQec9N/tMwq7+LMZOItosvtTnCKOg3BsNfO04x8n/uxpJgeiA2SdG6b
	j2MjAh1y2fka8g3F66d/CYowCDmaprdDZXG9sR2XQpAwtzE8tMWVVTg0pERebph4IvQgkHc82sO
	IJzkgiczw0ZK4SfMSrW+E0tZ3PIRRAkEE30YBjAzJ95VDyMvuZ9/f+6qt5ZXbFTrhM2NQog4fT3
	IYb3lDdu9T0sPIl4SsFVJv2g5KjyP2oZHNIVyaszirzeLIaEOs3rIlODSKf7Xb9z2lvDQh5pmCs
	KwaRV5Q6dc1tPGduX0jVnmHFmRIY4ZhsmyUIGCTgAPYcqqpc5bcDr+53OXpPEhU5fL+JzcYfGOK
	3NSKyt8YO8uDfzIU5CYrudLoOlc2u730+9kYAAxCjyxjMT9S6j2/fT4B3MUjuxIkX6AHg5ht0yr
	RoqS8U9FjfZGuMcOV7spghA22ioULJwSxwfdYfa5EVs8aJ8m4OpHffGyz8OLj7N4egzO2bO9TWT
	BRJqKhYPCOGKCcltZLLz6aXxyfgUxBqUQWXWZVw4qY9LMXc0+ODkbt5fiCmvUaCJQKnPDQ==
X-Received: by 2002:a05:6102:512a:b0:7d6:bae0:e431 with SMTP id ada2fe7eead31-7d73945d06amr2075398137.17.1795196627836;
        Fri, 20 Nov 2026 09:43:47 -0800 (PST)
Received: from localhost.localdomain ([2603:9000:d440:53a:a9cf:4432:7fb7:e8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d784b3sm3571363137.2.2026.11.20.09.43.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:43:47 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Eric Garver <e@erig.me>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 4/4] selftests: net: Add UDP bind conflict tests
Date: Fri, 20 Nov 2026 12:43:41 -0500
Message-ID: <20261120174341.35873-5-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120174341.35873-1-juanagusnicco@gmail.com>
References: <20261120174341.35873-1-juanagusnicco@gmail.com>
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

Add tests for the three bind conflict fixes in this series:

- reuseport_scan_{address,device,hash2}: a SO_REUSEPORT bind is refused
  when a conflicting socket sits behind a compatible one, on the primary
  and on the secondary hash.
- disconnect_keeps_{device,scoped_device}: connect(AF_UNSPEC) keeps a
  device set with SO_BINDTOIFINDEX or with the scope id of bind().
- connect_device_ignored: a device set by connect() does not let a
  socket on another device bind next to it.

reuseport_share and disconnect_clears_connect_device check that the
sharing and the clearing that should still happen still do.

Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
---
 tools/testing/selftests/net/.gitignore        |   1 +
 tools/testing/selftests/net/Makefile          |   1 +
 .../testing/selftests/net/udp_bind_conflict.c | 228 ++++++++++++++++++
 3 files changed, 230 insertions(+)
 create mode 100644 tools/testing/selftests/net/udp_bind_conflict.c

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index 21412510ac26..35f6d5220156 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -56,6 +56,7 @@ tools
 tun
 txring_overwrite
 txtimestamp
+udp_bind_conflict
 udp_splice_checksum
 udpgso
 udpgso_bench_rx
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 9180b9bec515..16b804559051 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -202,6 +202,7 @@ TEST_GEN_PROGS := \
 	tap \
 	tcp_port_share \
 	tls \
+	udp_bind_conflict \
 	udp_splice_checksum \
 # end of TEST_GEN_PROGS
 
diff --git a/tools/testing/selftests/net/udp_bind_conflict.c b/tools/testing/selftests/net/udp_bind_conflict.c
new file mode 100644
index 000000000000..9a67f58c348a
--- /dev/null
+++ b/tools/testing/selftests/net/udp_bind_conflict.c
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Check that bind() refuses a UDP socket that overlaps another one in
+ * the cases that SO_REUSEPORT, disconnect and connect() used to let
+ * through.
+ */
+
+#include <arpa/inet.h>
+#include <net/if.h>
+#include <sched.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+#include "kselftest_harness.h"
+
+#define PORT	34567
+#define MAX_FDS	32
+
+FIXTURE(udp_bind_conflict)
+{
+	int fd[MAX_FDS];
+	int nr_fds;
+	int lo;
+	int d0;
+};
+
+FIXTURE_SETUP(udp_bind_conflict)
+{
+	ASSERT_EQ(unshare(CLONE_NEWNET), 0);
+	ASSERT_EQ(system("ip link set dev lo up"), 0);
+	ASSERT_EQ(system("ip link add d0 type dummy"), 0);
+	ASSERT_EQ(system("ip link set dev d0 up"), 0);
+	ASSERT_EQ(system("ip addr add fe80::1/64 dev d0 nodad"), 0);
+
+	self->lo = if_nametoindex("lo");
+	self->d0 = if_nametoindex("d0");
+	ASSERT_NE(self->lo, 0);
+	ASSERT_NE(self->d0, 0);
+	self->nr_fds = 0;
+}
+
+FIXTURE_TEARDOWN(udp_bind_conflict)
+{
+	while (self->nr_fds)
+		close(self->fd[--self->nr_fds]);
+}
+
+/* Bind a UDP socket to addr:PORT, on device @ifindex if not 0: through
+ * the scope id for a link-local address, SO_BINDTOIFINDEX otherwise.
+ * Returns the socket, or -errno.
+ */
+static int udp_bind(FIXTURE_DATA(udp_bind_conflict) *self, const char *addr,
+		    int ifindex, bool reuseport)
+{
+	union {
+		struct sockaddr sa;
+		struct sockaddr_in v4;
+		struct sockaddr_in6 v6;
+	} sa = {};
+	socklen_t len;
+	int one = 1;
+	int fd, err;
+
+	if (self->nr_fds == MAX_FDS)
+		return -ENOSPC;
+
+	if (inet_pton(AF_INET, addr, &sa.v4.sin_addr) == 1) {
+		sa.v4.sin_family = AF_INET;
+		sa.v4.sin_port = htons(PORT);
+		len = sizeof(sa.v4);
+	} else if (inet_pton(AF_INET6, addr, &sa.v6.sin6_addr) == 1) {
+		sa.v6.sin6_family = AF_INET6;
+		sa.v6.sin6_port = htons(PORT);
+		len = sizeof(sa.v6);
+		if (IN6_IS_ADDR_LINKLOCAL(&sa.v6.sin6_addr)) {
+			sa.v6.sin6_scope_id = ifindex;
+			ifindex = 0;
+		}
+	} else {
+		return -EINVAL;
+	}
+
+	fd = socket(sa.sa.sa_family, SOCK_DGRAM, 0);
+	if (fd < 0)
+		return -errno;
+
+	if ((reuseport &&
+	     setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, &one, sizeof(one))) ||
+	    (ifindex &&
+	     setsockopt(fd, SOL_SOCKET, SO_BINDTOIFINDEX,
+			&ifindex, sizeof(ifindex))) ||
+	    bind(fd, &sa.sa, len)) {
+		err = -errno;
+		close(fd);
+		return err;
+	}
+
+	self->fd[self->nr_fds++] = fd;
+	return fd;
+}
+
+static int disconnect(int fd)
+{
+	struct sockaddr sa = { .sa_family = AF_UNSPEC };
+
+	return connect(fd, &sa, sizeof(sa));
+}
+
+/* connect() to a link-local peer, which sets the device to @ifindex */
+static int connect_link_local(int fd, int ifindex)
+{
+	struct sockaddr_in6 sa = {
+		.sin6_family = AF_INET6,
+		.sin6_port = htons(PORT),
+		.sin6_scope_id = ifindex,
+	};
+
+	inet_pton(AF_INET6, "fe80::2", &sa.sin6_addr);
+	return connect(fd, (struct sockaddr *)&sa, sizeof(sa));
+}
+
+static int bound_ifindex(int fd)
+{
+	socklen_t len = sizeof(int);
+	int ifindex;
+
+	if (getsockopt(fd, SOL_SOCKET, SO_BINDTOIFINDEX, &ifindex, &len))
+		return -errno;
+	return ifindex;
+}
+
+/* The conflict scan used to stop at the first SO_REUSEPORT socket of the
+ * same owner that overlapped the new one, before reaching 127.0.0.2.
+ */
+TEST_F(udp_bind_conflict, reuseport_scan_address)
+{
+	ASSERT_LE(0, udp_bind(self, "127.0.0.2", 0, false));
+	ASSERT_LE(0, udp_bind(self, "127.0.0.3", 0, true));
+	ASSERT_EQ(-EADDRINUSE, udp_bind(self, "0.0.0.0", 0, true));
+}
+
+TEST_F(udp_bind_conflict, reuseport_scan_device)
+{
+	ASSERT_LE(0, udp_bind(self, "0.0.0.0", self->lo, false));
+	ASSERT_LE(0, udp_bind(self, "0.0.0.0", self->d0, true));
+	ASSERT_EQ(-EADDRINUSE, udp_bind(self, "0.0.0.0", 0, true));
+}
+
+/* More than 10 sockets on the port: the secondary hash is scanned. */
+TEST_F(udp_bind_conflict, reuseport_scan_hash2)
+{
+	char addr[INET_ADDRSTRLEN];
+	int i;
+
+	ASSERT_LE(0, udp_bind(self, "127.0.0.2", self->lo, false));
+	for (i = 3; i < 14; i++) {
+		snprintf(addr, sizeof(addr), "127.0.0.%d", i);
+		ASSERT_LE(0, udp_bind(self, addr, 0, true));
+	}
+	ASSERT_LE(0, udp_bind(self, "127.0.0.2", self->d0, true));
+	ASSERT_EQ(-EADDRINUSE, udp_bind(self, "127.0.0.2", 0, true));
+}
+
+/* Sockets of one owner that SO_REUSEPORT lets share a port still can. */
+TEST_F(udp_bind_conflict, reuseport_share)
+{
+	int i;
+
+	for (i = 0; i < 16; i++)
+		ASSERT_LE(0, udp_bind(self, "127.0.0.1", 0, true));
+	ASSERT_LE(0, udp_bind(self, "0.0.0.0", 0, true));
+	ASSERT_LE(0, udp_bind(self, "0.0.0.0", self->lo, true));
+	ASSERT_LE(0, udp_bind(self, "127.0.0.1", self->d0, true));
+}
+
+/* Disconnect used to clear the device the socket was bound to, leaving it
+ * on top of 0.0.0.0%lo where bind() had refused it.
+ */
+TEST_F(udp_bind_conflict, disconnect_keeps_device)
+{
+	int fd;
+
+	ASSERT_LE(0, udp_bind(self, "0.0.0.0", self->lo, false));
+	ASSERT_EQ(-EADDRINUSE, udp_bind(self, "127.0.0.1", 0, false));
+
+	fd = udp_bind(self, "127.0.0.1", self->d0, false);
+	ASSERT_LE(0, fd);
+	ASSERT_EQ(0, disconnect(fd));
+	ASSERT_EQ(self->d0, bound_ifindex(fd));
+}
+
+TEST_F(udp_bind_conflict, disconnect_keeps_scoped_device)
+{
+	int fd;
+
+	fd = udp_bind(self, "fe80::1", self->d0, false);
+	ASSERT_LE(0, fd);
+	ASSERT_EQ(0, disconnect(fd));
+	ASSERT_EQ(self->d0, bound_ifindex(fd));
+}
+
+/* A device that connect() set is still cleared by disconnect. */
+TEST_F(udp_bind_conflict, disconnect_clears_connect_device)
+{
+	int fd;
+
+	fd = udp_bind(self, "::", 0, false);
+	ASSERT_LE(0, fd);
+	ASSERT_EQ(0, connect_link_local(fd, self->d0));
+	ASSERT_EQ(self->d0, bound_ifindex(fd));
+	ASSERT_EQ(0, disconnect(fd));
+	ASSERT_EQ(0, bound_ifindex(fd));
+}
+
+/* A device that connect() set used to count in the conflict check, so a
+ * socket on another device could bind next to [::]:PORT and overlap it
+ * once it disconnected.
+ */
+TEST_F(udp_bind_conflict, connect_device_ignored)
+{
+	int fd;
+
+	fd = udp_bind(self, "::", 0, false);
+	ASSERT_LE(0, fd);
+	ASSERT_EQ(0, connect_link_local(fd, self->d0));
+	ASSERT_EQ(-EADDRINUSE, udp_bind(self, "::", self->lo, false));
+}
+
+TEST_HARNESS_MAIN
-- 
2.43.0

