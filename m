Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756763;
	b=Apji5dtuq1eFxvXX8JgnFeHTlp2/YcpMgH5sWDhPhO3DSFR7KM8jHesBikyWE6q7RkV1
	 v1iAB6AwGRma7wCPzjGdtAGgkFaksRtipspzfBEAEfE2v2QGT3p9lLYIJtMMetuQp0Mu7
	 K//XQ9Fu0q7Rm3AAhmxjAVm5kAmVkynfLcdb9VLt4GkEs/MndaRNeOZv5rd5d9uipmaiL
	 xlOh192nPMaaTpCOlMRtXm7wXe5HoClvu/p70hdZyhE/gB+Eks3f+waHvSEJ1PwzEXQcv
	 vgpUZis3oCtjC+dIfWhcXX1S7Je8vNW4yC8BACX5i44JAs4SlXy52XozBpyVSfelh0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s7zN/holnfSRWzR9Ve4qoAtn/yLgIqCtYRzUZEN6Hog=;
	b=RgGM52OfZo0Hm6uaJ/IJ+yioM14g3zVXiCHmV6LFZcUOtpRg/5OSp54+SHs5VVM4/Kz/
	 XKoJT7V0mLymjIrO/aTlPfY+CY0ZOl1OT2gq8TclGC6uBeW83NYdroNFSIZSJtQhZtuSn
	 1M41/csksafX0yB24O3QWebr22VCAIFkU2TdNKeCBVuoEyoBzMBLD4vci6sZ/3L14G5Fl
	 6kgN6qY3beswBP7q+kgVqELDbs1eS9QB9PxmAHI5BuxWLdWVDmd9bU8iNTERbgNg/Uh2y
	 kfVXNr+ZGHwa3OUEbJ/thkJF9NXJ25WgR9kAle8d/1aFYV6nCef8Sut3C3Yn1a5nlww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=WW1jphLi;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818C4606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 818C4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=WW1jphLi
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-385c497bf94so7102561eec.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 21:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1795756761; x=1796361561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7zN/holnfSRWzR9Ve4qoAtn/yLgIqCtYRzUZEN6Hog=;
        b=WW1jphLirbpb9MeuQf+6RLJ0qp4M/h6w1zvN7PlEApVWsGpkCF13nLQWmp831roIYD
         lv+GgF7+wAQ2CcGcaFHxWgxvH7Uq1+tRuVrIa3HjGAGTT7I6SAVnjh2A4mKqlP7NbLxQ
         +ej4NrKlT27BQFgeewMMfqetuMO+akQmjWasFZF9US1386YiRJvm8Jc+qot2QpUusFyx
         Pe9/X5YgR83dRFDAUtqypak5iZuqtuItkL+4xTlwjqNrn5iP3WISIc+jgmTko1LibhR4
         7kpGPRveVhlA9Kj7Q40n/y0O8WcMDxg0N0mPjuX9GOp9v6kLOj8NVMHsdpQlQ6uXlk1d
         AGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756761; x=1796361561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7zN/holnfSRWzR9Ve4qoAtn/yLgIqCtYRzUZEN6Hog=;
        b=VPxhFCMOybk4yo1HrgvXdTP3yArxXtQ6Q8Vak6wABwznsA5Cux7iwA6cToce3jz1i4
         XPCSRZ2VmH9W/1BbOzY+rv7XGrT4M66D1q59sSBAfNEN7PZGduFSWshSBTJjDugMeA5u
         zPLTfCAs6AAcHAXxSO3m5tQ9UcS4HuVIbkiX5D4bgjkii0PyDz6O5QQQUSQe/SLENeym
         vsXb7ULSrrFGabqeY39wdJj84cCHCLipsVbrCrfcaXYku0Ghs6ohpy8h9n9na76a0oPW
         7iznhc0po6jjSr1C6RT8cHMPNZBLDpwI0EVHu1F/ySgG+ziSQQOZW0bszFRc4mTOxcGd
         qqHw==
X-Forwarded-Encrypted: i=1; AL+hErE4WPiUfwv2BPyuBVq+veQRM6EQ+AEHXAQy4y6gIX2+tDgGPfdTmRkhPtzd9n8I1VSjUy7PBHo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fBAVHkLdxDu/bNbcFSqwqqtFQVf0Bp/3gxLXsody9Mm6JN/Lt
	2ABX66DxtW+omx6gbjUyaXez/F2KgtDVrm+5GG0r/FVfNSua4FifeICRZMNTwdPiGNQB
X-Gm-Gg: AZFdTZdb7posNU+2JS+daFGgVE0dHp6Sj6N9Me9nBW62281VcrviCsWmXqbz1Q7W8aX
	AfivxSqLXmC8FJqXAorwQFRLzM9A3WVmXlbavbZ2mX15U5/mJb8yAK2XSMdvkIdOMvh1AWErPMk
	395F2PgJwruwTOdMp8ijsiIxflRU6Ix+Qky/U2Dot58e/MznL9eH2ufn0b8hanXghL7zqB67aMl
	aAciS4H+u+ua+U09OZFUzEEgofneQeVVEItaym7wST2cW3TU1C7wVNy7dlNBNAlLdaYYCZ6UopT
	/eCHh/i/Z/yxrqqER7sZzfZepenW0lRjzix2dWfKJuZpbZDEkARL1CJlZzeo06YNIytY9UWgORn
	8HNA+VcyL3ZmM7XdU1n0Xgkm9hAnDJ2lJig1bHFdVldkQlndct6eD/xFUnU505AxcPkgdtnRmSj
	H6g6FX/aoOuKhVisuSw/oF+XLO/KjfRgf/PS9PP1QtcJXb1ZJoeShgz+4YXXSA8b+GeRFLzCYc5
	yrJBFlpZN5WP0/9LTf9tUKimlbAXKsL9lpENgQQG4lCTeHc2kdXk40AGgykVwodnNrvWV7q2vzR
	1aejcTHp/NjogHNY2hH1l6SYjHPr4XLGeeOS/98=
X-Received: by 2002:a05:7300:ce11:b0:385:774:fb23 with SMTP id 5a478bee46e88-3856e63b5cdmr24851388eec.6.1795756761365;
        Thu, 26 Nov 2026 21:19:21 -0800 (PST)
Received: from enjou-Legion-Y7000P-2019 ([174.136.206.51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm82950093eec.10.2026.11.26.21.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:19:20 -0800 (PST)
From: Ren Wei <weir@nebusec.ai>
To: virtualization@lists.linux.dev,
	netdev@vger.kernel.org
Cc: sgarzare@redhat.com,
	bobbyeshleman@meta.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	arseny.krasnov@kaspersky.com,
	vega@nebusec.ai,
	caoruide123@gmail.com,
	weir@nebusec.ai
Subject: [PATCH net 0/2] vsock: preserve receive timeout across partial reads
Date: Fri, 27 Nov 2026 13:19:12 +0800
Message-ID: <cover.1795587333.git.caoruide123@gmail.com>
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

From: Ruide Cao <caoruide123@gmail.com>

Hi Linux kernel maintainers,

We found and validated an issue in net/vmw_vsock/af_vsock.c. The bug
is reachable by an unprivileged local user who can connect to an
AF_VSOCK SOCK_STREAM service (the reproducer used VMADDR_CID_LOCAL).
We've tested it, and it should not affect any other functionality.

This bug is tracked at: https://bugtracker.nebusec.ai/f/13843

We will provide detailed information about the bug in this email.

---- details below ----

Bug details:

__vsock_stream_recvmsg() takes the SO_RCVTIMEO value once and passes
it by value to vsock_connectible_wait_data(). The helper updates only
its local copy from schedule_timeout() and does not return the
remaining time. After a partial dequeue below the MSG_WAITALL or
SO_RCVLOWAT target, the stream receive loop calls the helper again
with the original full timeout.

A peer that drip-feeds data just inside each interval can therefore
keep the receive blocked far beyond the configured timeout. This is a
receive-timeout contract violation, not a memory-safety bug.

The first patch changes vsock_connectible_wait_data() to take the
timeout by pointer so the remaining budget is preserved across
partial reads. The seqpacket call site is updated the same way; it
only waits once. The second patch adds a tools/testing/vsock
regression for SOCK_STREAM recv(MSG_WAITALL) against a drip-feeding
peer. The selftest keeps the data socket open until both sides
confirm.

Reproducer:

As an unprivileged local user, create a connected AF_VSOCK SOCK_STREAM
pair on VMADDR_CID_LOCAL. On the receiving end, set SO_RCVTIMEO to 1
second and issue recv(MSG_WAITALL) for 6 bytes. Have the peer send one
byte every 0.8 seconds. On an unfixed kernel the recv returns 6 bytes
after about 4.8 seconds instead of failing or returning partial data
near the 1 second timeout.

We ran the PoC in a 2 GB RAM x86 QEMU environment.

------BEGIN PoC------

#define _GNU_SOURCE
#include <errno.h>
#include <linux/vm_sockets.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <time.h>
#include <unistd.h>

#define TOTAL_BYTES 6
#define SEND_INTERVAL_USEC 800000
#define RCV_TIMEOUT_SEC 1

struct test_ctx {
	int listener_fd;
	unsigned int port;
};

static void fatal(const char *what)
{
	perror(what);
	exit(1);
}

static double elapsed_seconds(const struct timespec *start,
			      const struct timespec *end)
{
	time_t sec = end->tv_sec - start->tv_sec;
	long nsec = end->tv_nsec - start->tv_nsec;

	if (nsec < 0) {
		sec--;
		nsec += 1000000000L;
	}

	return (double)sec + (double)nsec / 1000000000.0;
}

static void *sender_thread(void *arg)
{
	struct test_ctx *ctx = arg;
	struct sockaddr_vm peer = {
		.svm_family = AF_VSOCK,
	};
	socklen_t peer_len = sizeof(peer);
	int conn_fd;
	char ch = 'A';
	int i;

	conn_fd = accept(ctx->listener_fd, (struct sockaddr *)&peer, &peer_len);
	if (conn_fd < 0)
		fatal("accept");

	fprintf(stdout,
		"sender: accepted peer cid=%u port=%u, sending %d bytes every %.3f s\n",
		peer.svm_cid, peer.svm_port, TOTAL_BYTES,
		(double)SEND_INTERVAL_USEC / 1000000.0);
	fflush(stdout);

	for (i = 0; i < TOTAL_BYTES; i++) {
		ssize_t n;

		usleep(SEND_INTERVAL_USEC);
		n = send(conn_fd, &ch, 1, 0);
		if (n != 1)
			fatal("send");
		fprintf(stdout, "sender: sent byte %d at +%.3f s\n", i + 1,
			(double)(i + 1) * (double)SEND_INTERVAL_USEC / 1000000.0);
		fflush(stdout);
		ch++;
	}

	close(conn_fd);
	return NULL;
}

int main(void)
{
	struct test_ctx ctx = {
		.listener_fd = -1,
	};
	struct sockaddr_vm addr = {
		.svm_family = AF_VSOCK,
		.svm_cid = VMADDR_CID_LOCAL,
		.svm_port = VMADDR_PORT_ANY,
	};
	struct sockaddr_vm bound = {
		.svm_family = AF_VSOCK,
	};
	struct timeval timeout = {
		.tv_sec = RCV_TIMEOUT_SEC,
		.tv_usec = 0,
	};
	struct timespec start;
	struct timespec end;
	socklen_t bound_len = sizeof(bound);
	pthread_t tid;
	char buf[TOTAL_BYTES];
	int client_fd;
	ssize_t n;
	double secs;
	int i;

	ctx.listener_fd = socket(AF_VSOCK, SOCK_STREAM, 0);
	if (ctx.listener_fd < 0)
		fatal("socket(listener)");

	if (bind(ctx.listener_fd, (struct sockaddr *)&addr, sizeof(addr)) < 0)
		fatal("bind(listener)");

	if (getsockname(ctx.listener_fd, (struct sockaddr *)&bound, &bound_len) < 0)
		fatal("getsockname(listener)");

	ctx.port = bound.svm_port;

	if (listen(ctx.listener_fd, 1) < 0)
		fatal("listen");

	fprintf(stdout, "listener: cid=%u port=%u\n", VMADDR_CID_LOCAL, ctx.port);
	fflush(stdout);

	if (pthread_create(&tid, NULL, sender_thread, &ctx) != 0)
		fatal("pthread_create");

	client_fd = socket(AF_VSOCK, SOCK_STREAM, 0);
	if (client_fd < 0)
		fatal("socket(client)");

	if (setsockopt(client_fd, SOL_SOCKET, SO_RCVTIMEO, &timeout,
		       sizeof(timeout)) < 0)
		fatal("setsockopt(SO_RCVTIMEO)");

	addr.svm_port = ctx.port;
	if (connect(client_fd, (struct sockaddr *)&addr, sizeof(addr)) < 0)
		fatal("connect");

	memset(buf, 0, sizeof(buf));
	if (clock_gettime(CLOCK_MONOTONIC, &start) != 0)
		fatal("clock_gettime(start)");

	n = recv(client_fd, buf, sizeof(buf), MSG_WAITALL);

	if (clock_gettime(CLOCK_MONOTONIC, &end) != 0)
		fatal("clock_gettime(end)");

	secs = elapsed_seconds(&start, &end);

	fprintf(stdout,
		"client: recv(MSG_WAITALL, %d) returned %zd after %.3f s (timeout=%d s)\n",
		TOTAL_BYTES, n, secs, RCV_TIMEOUT_SEC);
	if (n >= 0) {
		fprintf(stdout, "client: bytes received:");
		for (i = 0; i < n; i++)
			fprintf(stdout, " %c", buf[i]);
		fprintf(stdout, "\n");
	} else {
		fprintf(stdout, "client: errno=%d (%s)\n", errno, strerror(errno));
	}

	if (n == TOTAL_BYTES && secs > 4.0) {
		fprintf(stdout,
			"RESULT: bug observed. Finite SO_RCVTIMEO did not cap total wait time.\n");
	} else if (n > 0 && secs < 2.0) {
		fprintf(stdout,
			"RESULT: behavior looks fixed. Partial data returned near the original timeout.\n");
	} else {
		fprintf(stdout,
			"RESULT: inconclusive. Re-check timing, transport availability, or system load.\n");
	}

	fflush(stdout);

	close(client_fd);
	pthread_join(tid, NULL);
	close(ctx.listener_fd);
	return 0;
}

------END PoC--------

----BEGIN crash log----

Unprivileged user (test_user, CapEff=0), VMADDR_CID_LOCAL:

listener: cid=1 port=3381025544
sender: accepted peer cid=1 port=3381025545, sending 6 bytes every 0.800 s
sender: sent byte 1 at +0.800 s
sender: sent byte 2 at +1.600 s
sender: sent byte 3 at +2.400 s
sender: sent byte 4 at +3.200 s
sender: sent byte 5 at +4.000 s
sender: sent byte 6 at +4.800 s
client: recv(MSG_WAITALL, 6) returned 6 after 4.816 s (timeout=1 s)
client: bytes received: A B C D E F
RESULT: bug observed. Finite SO_RCVTIMEO did not cap total wait time.

-----END crash log-----

Best regards,
Ruide Cao

Ruide Cao (2):
  vsock: preserve receive timeout across partial reads
  vsock/test: add stream MSG_WAITALL receive timeout test

 net/vmw_vsock/af_vsock.c         |  14 ++--
 tools/testing/vsock/vsock_test.c | 112 +++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+), 7 deletions(-)


base-commit: cc7fe6e741730fef549e484379281736d32746f0
-- 
2.47.3
