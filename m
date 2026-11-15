Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794741477;
	b=RFggJMx0TQgUV/ZyyQYu0RmpumNWVHRF4K4m1jY8zqc1MfPWGhkfgyalopbGvRy/f/n6
	 eNm9E0cMl6bQTvh+JBb+uO4TaDNqXC3lkLRcbe3wcN6zIkWQCSqxT492ysqON0sgcf3Te
	 zfwEHQAM8eBEZfd0QHmAd2gXViYkq6rennXPTdNcN5QxVE5n+njfUsj7R0S5Co+M0HJx5
	 YAWSc0h6m4PMm41C0mdKs+2Wc0FLniZHGVZ7toTn0cYNBAbGWWAF0aX+Ifr4oCPSPJEPo
	 xAvY7FgmOwSKLOTXiYxS1xRvX5jiPy+h81FETw1NJ93ig/dKCeW9J6HQ4WNAL4Ll3DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794741477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Ae/6FmraT8UMxbaBrs/KG+57hTd5IFlrV2PVwG2/UgA=;
	b=L41NIERZU71yEGar6fJYWPNJMuFHf03xuDU/AunOQ0tAjDIDSd/ewrG2QOiASDxMrGFi
	 27IGwtMxjIxU2yxVclIzbvELczcUu1P/1H2VPV1BGbQCjTbL52Fs7AVfvzfW86syhDiv1
	 eZ4qrhIusLXiLXLo3i5/3M72lTf9vksYWEP/fHsp8FSrfDgiMbyud1WK1DputHMrmqj9C
	 zYTlev1LncG/nKqlMNU7YDCDOXxm4SExutIIskk8Ceb9sT0zOa/dRU7vvya07+OYbD5zQ
	 KHknDgmeVx1xGFQ7Q9SX2W0cG3j/i3F30u2o7aPz14qjtauoDAfA0oZotbQM+pzZy8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=RdVkKSJP;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C590C606A31F
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 11:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C590C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=RdVkKSJP
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb684859cbso1999927a12.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 03:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1794741476; x=1795346276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ae/6FmraT8UMxbaBrs/KG+57hTd5IFlrV2PVwG2/UgA=;
        b=RdVkKSJPW5nbCf+Qnt9DNrOk6wgxMylpzzJ++FlloE5jh0ofgQd1/MJU88zuemVry6
         dEFd02XGD2PujGRKU4STt3+kGkqN8YuiyKU5rfWBiejlCkLMFDaVujEZHrwRd1kV6pPn
         dxsuyf3dmVhFK3I3Ei07+x1D8gGkGxLuA8ZzeLFbESIOXhkcBEqZmXlWC99lLI5bXpna
         yZ7RwRDZCMYgsVHHFs2T0T9m4qKL+CoBzv37lx4NsfJTerGoRmz7pXBGFH0usbyf9UVe
         xLL0ly4GscK7AukrJHh+auxUMF+x5jC2SVth647pK8+IG0m3Il9D/W/0pwoOY93vubUL
         k1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794741476; x=1795346276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ae/6FmraT8UMxbaBrs/KG+57hTd5IFlrV2PVwG2/UgA=;
        b=ETol4IZy/hBZY6uHefIz0EXW8WJAnlCgG34TKWyNw4vJ96w+aYs/1HO6AY2kstPZB6
         ThshJcimhLmgP2duooZLGKLOPens7EveZWTV5SGjvIiuUcdkPARuAEL+xs2oZvAKH6jm
         prJ5nJz+ffbupoQg4xQNCbitz6J33y24fet5nruKHI0fM0FfvUc3oT6PFAufdGN7B+hP
         +2ILwoOJBtmZLzXAJHHhF/XXsSN02bIsT6vNfYR/DjCVhadQ22OEFNPVYZ5fhZVzsruM
         t9Rv3VU1ZXKm4vq0dW4ONwSwziNYBTGLz9inuxXM2wKOWIJ3Qxt082CNjdyavFrCCLlc
         h4cg==
X-Gm-Message-State: APuU4Z+1FoF2r//tsQ+D2J+8YozzL0ejtVuOnfwtCGI/ojtiWDQFE0Wl
	uTBV0Oczo8599IJbqFMJHFW2uCqWYlXOgX6w8ogwlW3C79zC2XQo2iUHYKvBmCq86phqH8IBfFW
	nemQrIQ==
X-Gm-Gg: AYBFou3GZct0F6x+2GAyuqCujEccxxqXZNvmwG+lpOPfPTvbRo+ZZeABldha4a/EpaU
	pFi1d8EE8Lof6z/CFuKLSoX40ZkCjxHV0gO1JYDOkIapVfvi7GkR3TKN9x596Q0nyd24l4SvCzn
	ZVAQgWB8hEgcGKsRz/pYEPqGUL5wlRQYRhjUug3ynKSrh5qrrpLUZRtqQCYoHSZ4/A5B9q9kkS5
	BEI0ql3HxhtlRPgMWlGrSxiSYpmo9IG5BNcuTRaTqwBmSHsN0W41y4AME7EUe7rh0MwsuWNlQYx
	DFYUohAZgnqx34G84NAOetxbbvugJyeYata8iA4hjpqB0+bA1BScW4jxtP3j0gNztBRt1gzqdud
	GKAU9lvBpgCC1Vgr8VGMFguvBeAV5k+2qiFcoWjfDjO86PNzBFAiDwbZtxcpFqDjNH7oP/QdrJE
	JjytQcYfWrC724st9ttcIDPCaO7gYSWUnuyR96ObLgkhFTca9e/6kcic0iXhTK9ofoTPcM7+Gef
	opzyjLHsCTzy1Ae33PS28/oJsjdHJDTTuzVvsBKZrdZEoLZvUCKU6gNmNvCDBC1wPgX9yJXYtPs
	oNDTgee9vFusmR0Ilg7ZzjC7EpUc89qgvC58IQsw5eR+mYZDqo9R9NW9C0Y2EIxartHZ5FxHpzW
	bLm5bN3N5/5cmZOL5AUpsSDJ4cpYteCshMSxc9+py9Yg=
X-Received: by 2002:a17:90b:4a43:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3b1b0a3c0dbmr7760504a91.43.1794741475728;
        Sun, 15 Nov 2026 03:17:55 -0800 (PST)
Received: from 24c857d0c3be.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdddc55efefsm2160435a12.6.2026.11.15.03.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:17:55 -0800 (PST)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	vega@nebusec.ai,
	zihanx@nebusec.ai
Subject: [PATCH net v2 0/1] ipv6: mcast: unify default interface resolution
Date: Sun, 15 Nov 2026 11:17:44 +0000
Message-ID: <cover.1794738094.git.zihanx@nebusec.ai>
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

We found an issue in net/ipv6/mcast.c. The bug is reachable by an
unprivileged process using the IPv6 multicast source-filter socket API.
The relevant details are provided below.

---- details below ----

An LLM was used to help create this patch.

Changes in v2:
- Resolve the default interface before duplicate membership checks. This
  also scopes ordinary ASM IPV6_ADD_MEMBERSHIP and MCAST_JOIN_GROUP
  duplicate checks to the route-selected interface, allowing the same
  group to be joined on separate links.
- Return the resolved ifindex from the SSM join helper and pass it to
  ip6_mc_source(), avoiding a second route lookup in the same operation.
  This follows the IPv4 group-source path's resolved-ifindex handoff.
- Clarify that source-filter operations target the resolved interface;
  callers can specify an ifindex to operate on a different membership.

Link: https://lore.kernel.org/all/cover.1794492711.git.zihanx@nebusec.ai/

This bug is tracked at: https://bugtracker.nebusec.ai/f/Z8p (Z8p)

Bug details:

When gsr_interface is zero, ip6_mc_source() resolves the multicast route
but previously treated zero as a wildcard when finding the socket
membership. With the same group joined on multiple interfaces, the
socket filter could be updated on one interface while the aggregate
filter was updated on another. The v1 review also found that the SSM
join helper performed its wildcard duplicate check before resolving the
default interface, causing MCAST_JOIN_SOURCE_GROUP to return EINVAL when
only another interface had the group joined. Resolving the interface in
both join and source-filter stages separately also allowed a concurrent
route change to make those stages choose different devices.

This revision checks and stores memberships against the concrete
resolved interface, then carries that same ifindex from the SSM join
helper into the source-filter update. Thus both stages use one route
selection. Source-filter operations with interface zero are scoped to
that resolved interface; if no membership exists there, they may return
EINVAL. Specify an interface index to target a membership on another
interface.

Reproducer:

Build and run as an unprivileged user in a Linux guest where ff0e::1234
routes through eth0 and lo is available:

    gcc -O2 -Wall -Wextra -o ssm-route-interface-test ssm-route-interface-test.c
    ip -6 route get ff0e::1234
    ./ssm-route-interface-test

The test first joins ff0e::1234 on lo, then performs a source-specific
join with gsr_interface zero. On v1 this returned EINVAL and created no
membership on the route-selected interface. With v2 it succeeded; the
source appeared in that interface's INCLUDE filter, and source leave
removed only that membership. It also verifies default ASM joins,
duplicate EADDRINUSE results, default BLOCK/UNBLOCK and explicit
interface filtering. It was run as uid 1001 (test_user) in a 2 vCPU,
2 GiB x86 QEMU/KVM guest.

For a route-switch case, create/enable dummy0 and prefer its local
multicast route over eth0. As root in the guest:

    ip link show dummy0 || ip link add dummy0 type dummy
    ip link set dummy0 up
    ip -6 route replace ff00::/8 dev dummy0 metric 1 table local
    ip -6 route get ff0e::1234

Then run the test as an unprivileged user:

    su -s /bin/sh test_user -c './ssm-route-interface-test route-switched-dummy'

The test begins with the group joined on eth0 after the route has moved
to dummy0. The SSM join, source leave, ASM join, and source filters
follow dummy0; explicit eth0 filtering remains on eth0. No kernel crash
was observed.

------BEGIN PoC------

#define _GNU_SOURCE

#include <arpa/inet.h>
#include <errno.h>
#include <net/if.h>
#include <netinet/in.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>

static void set_addr(struct sockaddr_storage *ss, const char *address)
{
	struct sockaddr_in6 *sin6 = (struct sockaddr_in6 *)ss;

	sin6->sin6_family = AF_INET6;
	if (inet_pton(AF_INET6, address, &sin6->sin6_addr) != 1) {
		perror("inet_pton");
		exit(EXIT_FAILURE);
	}
}

static void show_filter(int fd, unsigned int ifindex, const char *ifname)
{
	struct group_filter *gf;
	socklen_t len = sizeof(*gf) + sizeof(struct sockaddr_storage);
	struct sockaddr_in6 *sin6;

	/* Allow the kernel to return one source address. */
	gf = calloc(1, len);
	if (!gf) {
		perror("calloc");
		exit(EXIT_FAILURE);
	}
	gf->gf_interface = ifindex;
	gf->gf_numsrc = 1;
	set_addr(&gf->gf_group, "ff0e::1234");
	if (getsockopt(fd, SOL_IPV6, MCAST_MSFILTER, gf, &len) < 0) {
		printf("filter[%s]: %s\n", ifname, strerror(errno));
		free(gf);
		return;
	}
	printf("filter[%s]: mode=%s sources=%u", ifname,
	       gf->gf_fmode == MCAST_INCLUDE ? "INCLUDE" : "EXCLUDE",
	       gf->gf_numsrc);
	if (gf->gf_numsrc) {
		char source[INET6_ADDRSTRLEN];

		sin6 = (struct sockaddr_in6 *)&gf->gf_slist[0];
		inet_ntop(AF_INET6, &sin6->sin6_addr, source, sizeof(source));
		printf(" first-source=%s", source);
	}
	putchar('\n');
	free(gf);
}

static int check_filter(int fd, unsigned int ifindex, const char *ifname,
			int present, uint32_t mode, unsigned int count,
			const char *expected_source)
{
	struct group_filter *gf;
	struct sockaddr_in6 *sin6;
	socklen_t len = sizeof(*gf) + sizeof(struct sockaddr_storage);
	struct in6_addr expected;
	int ret = -1;

	gf = calloc(1, len);
	if (!gf) {
		perror("calloc");
		return -1;
	}
	gf->gf_interface = ifindex;
	gf->gf_numsrc = 1;
	set_addr(&gf->gf_group, "ff0e::1234");
	if (getsockopt(fd, SOL_IPV6, MCAST_MSFILTER, gf, &len) < 0) {
		if (!present && errno == EADDRNOTAVAIL) {
			printf("check[%s]: no membership as expected\n", ifname);
			ret = 0;
		} else {
			fprintf(stderr, "check[%s]: getsockopt failed: %s\n",
				ifname, strerror(errno));
		}
		goto out;
	}
	if (!present) {
		fprintf(stderr, "check[%s]: unexpected membership\n", ifname);
		goto out;
	}
	if (gf->gf_fmode != mode || gf->gf_numsrc != count) {
		fprintf(stderr,
			"check[%s]: expected mode=%u sources=%u, got mode=%u sources=%u\n",
			ifname, mode, count, gf->gf_fmode, gf->gf_numsrc);
		goto out;
	}
	if (expected_source) {
		if (inet_pton(AF_INET6, expected_source, &expected) != 1 || !count) {
			fprintf(stderr, "check[%s]: invalid/missing expected source %s\n",
				ifname, expected_source);
			goto out;
		}
		sin6 = (struct sockaddr_in6 *)&gf->gf_slist[0];
		if (memcmp(&sin6->sin6_addr, &expected, sizeof(expected))) {
			fprintf(stderr, "check[%s]: expected source %s\n",
				ifname, expected_source);
			goto out;
		}
	}
	printf("check[%s]: mode=%s sources=%u as expected\n", ifname,
	       mode == MCAST_INCLUDE ? "INCLUDE" : "EXCLUDE", count);
	ret = 0;
out:
	free(gf);
	return ret;
}

int main(int argc, char **argv)
{
	struct in6_addr group;
	struct ipv6_mreq mreq = { 0 };
	struct group_req greq = { 0 };
	struct group_source_req gsr = { 0 };
	const char *route_name = "eth0";
	const char *old_name = "lo";
	unsigned int route_if, old_if;
	int fd, ret;

	if (argc > 2) {
		fprintf(stderr, "usage: %s [route-switched|route-switched-dummy]\n",
			argv[0]);
		return EXIT_FAILURE;
	}
	if (argc == 2 && !strcmp(argv[1], "route-switched")) {
		route_name = "lo";
		old_name = "eth0";
	} else if (argc == 2 && !strcmp(argv[1], "route-switched-dummy")) {
		route_name = "dummy0";
		old_name = "eth0";
	}
	route_if = if_nametoindex(route_name);
	old_if = if_nametoindex(old_name);
	if (!route_if || !old_if) {
		fprintf(stderr, "%s or %s is unavailable\n", route_name, old_name);
		return EXIT_FAILURE;
	}
	if (inet_pton(AF_INET6, "ff0e::1234", &group) != 1) {
		perror("inet_pton");
		return EXIT_FAILURE;
	}
	fd = socket(AF_INET6, SOCK_DGRAM, 0);
	if (fd < 0) {
		perror("socket");
		return EXIT_FAILURE;
	}
	/* Keep the prior membership off the interface selected by the route. */
	mreq.ipv6mr_multiaddr = group;
	mreq.ipv6mr_interface = old_if;
	if (setsockopt(fd, SOL_IPV6, IPV6_ADD_MEMBERSHIP, &mreq, sizeof(mreq))) {
		perror("IPV6_ADD_MEMBERSHIP(prior interface)");
		return EXIT_FAILURE;
	}
	gsr.gsr_interface = 0;
	set_addr(&gsr.gsr_group, "ff0e::1234");
	set_addr(&gsr.gsr_source, "2001:db8::2");

	printf("route interface: %s(%u); prior membership: %s(%u)\n",
	       route_name, route_if, old_name, old_if);
	show_filter(fd, route_if, route_name);
	show_filter(fd, old_if, old_name);
	errno = 0;
	ret = setsockopt(fd, SOL_IPV6, MCAST_JOIN_SOURCE_GROUP,
			 &gsr, sizeof(gsr));
	printf("MCAST_JOIN_SOURCE_GROUP(ifindex=0): ret=%d errno=%d (%s)\n",
	       ret, errno, ret ? strerror(errno) : "success");
	show_filter(fd, route_if, route_name);
	show_filter(fd, old_if, old_name);
	if (!ret && (check_filter(fd, route_if, route_name, 1, MCAST_INCLUDE,
				 1, "2001:db8::2") ||
		     check_filter(fd, old_if, old_name, 1, MCAST_EXCLUDE, 0, NULL)))
		ret = -1;

	if (ret == 0) {
		errno = 0;
		ret = setsockopt(fd, SOL_IPV6, MCAST_LEAVE_SOURCE_GROUP,
				 &gsr, sizeof(gsr));
		printf("MCAST_LEAVE_SOURCE_GROUP(ifindex=0): ret=%d errno=%d (%s)\n",
		       ret, errno, ret ? strerror(errno) : "success");
		show_filter(fd, route_if, route_name);
		show_filter(fd, old_if, old_name);
		if (!ret && (check_filter(fd, route_if, route_name, 0, 0, 0, NULL) ||
			     check_filter(fd, old_if, old_name, 1,
					  MCAST_EXCLUDE, 0, NULL)))
			ret = -1;
	}
	if (ret)
		goto out;

	/* Generic ASM join can add the route interface beside the old one. */
	greq.gr_interface = 0;
	set_addr(&greq.gr_group, "ff0e::1234");
	errno = 0;
	ret = setsockopt(fd, SOL_IPV6, MCAST_JOIN_GROUP, &greq, sizeof(greq));
	printf("MCAST_JOIN_GROUP(ifindex=0): ret=%d errno=%d (%s)\n",
	       ret, errno, ret ? strerror(errno) : "success");
	if (ret)
		goto out;
	show_filter(fd, route_if, route_name);
	show_filter(fd, old_if, old_name);
	if (check_filter(fd, route_if, route_name, 1, MCAST_EXCLUDE, 0, NULL) ||
	    check_filter(fd, old_if, old_name, 1, MCAST_EXCLUDE, 0, NULL)) {
		ret = -1;
		goto out;
	}

	/* Remove that membership explicitly, then test IPV6_ADD_MEMBERSHIP. */
	greq.gr_interface = route_if;
	ret = setsockopt(fd, SOL_IPV6, MCAST_LEAVE_GROUP, &greq, sizeof(greq));
	printf("MCAST_LEAVE_GROUP(explicit route): ret=%d errno=%d (%s)\n",
	       ret, errno, ret ? strerror(errno) : "success");
	if (ret)
		goto out;
	if (check_filter(fd, route_if, route_name, 0, 0, 0, NULL) ||
	    check_filter(fd, old_if, old_name, 1, MCAST_EXCLUDE, 0, NULL)) {
		ret = -1;
		goto out;
	}

	/* ASM joins with interface zero are scoped to the resolved route. */
	mreq.ipv6mr_interface = 0;
	errno = 0;
	ret = setsockopt(fd, SOL_IPV6, IPV6_ADD_MEMBERSHIP,
			 &mreq, sizeof(mreq));
	printf("IPV6_ADD_MEMBERSHIP(ifindex=0): ret=%d errno=%d (%s)\n",
	       ret, errno, ret ? strerror(errno) : "success");
	if (ret)
		goto out;
	show_filter(fd, route_if, route_name);
	show_filter(fd, old_if, old_name);
	if (check_filter(fd, route_if, route_name, 1, MCAST_EXCLUDE, 0, NULL) ||
	    check_filter(fd, old_if, old_name, 1, MCAST_EXCLUDE, 0, NULL)) {
		ret = -1;
		goto out;
	}

	/* A second default ASM join duplicates the route interface only. */
	errno = 0;
	ret = setsockopt(fd, SOL_IPV6, IPV6_ADD_MEMBERSHIP,
			 &mreq, sizeof(mreq));
	printf("IPV6_ADD_MEMBERSHIP(ifindex=0, duplicate): ret=%d errno=%d (%s)\n",
	       ret, errno, ret ? strerror(errno) : "success");
	if (ret == 0 || errno != EADDRINUSE) {
		fprintf(stderr, "default ASM duplicate was not rejected\n");
		ret = -1;
		goto out;
	}
	if (check_filter(fd, route_if, route_name, 1, MCAST_EXCLUDE, 0, NULL) ||
	    check_filter(fd, old_if, old_name, 1, MCAST_EXCLUDE, 0, NULL)) {
		ret = -1;
		goto out;
	}

	/* The generic MCAST_JOIN_GROUP API shares the same duplicate check. */
	greq.gr_interface = 0;
	set_addr(&greq.gr_group, "ff0e::1234");
	errno = 0;
	ret = setsockopt(fd, SOL_IPV6, MCAST_JOIN_GROUP, &greq, sizeof(greq));
	printf("MCAST_JOIN_GROUP(ifindex=0, duplicate): ret=%d errno=%d (%s)\n",
	       ret, errno, ret ? strerror(errno) : "success");
	if (ret == 0 || errno != EADDRINUSE) {
		fprintf(stderr, "generic default ASM duplicate was not rejected\n");
		ret = -1;
		goto out;
	}

	/* Block and unblock a source on the route-selected interface. */
	gsr.gsr_interface = 0;
	errno = 0;
	ret = setsockopt(fd, SOL_IPV6, MCAST_BLOCK_SOURCE, &gsr, sizeof(gsr));
	printf("MCAST_BLOCK_SOURCE(ifindex=0): ret=%d errno=%d (%s)\n",
	       ret, errno, ret ? strerror(errno) : "success");
	if (ret)
		goto out;
	show_filter(fd, route_if, route_name);
	show_filter(fd, old_if, old_name);
	if (check_filter(fd, route_if, route_name, 1, MCAST_EXCLUDE,
			 1, "2001:db8::2") ||
	    check_filter(fd, old_if, old_name, 1, MCAST_EXCLUDE, 0, NULL)) {
		ret = -1;
		goto out;
	}

	errno = 0;
	ret = setsockopt(fd, SOL_IPV6, MCAST_UNBLOCK_SOURCE, &gsr, sizeof(gsr));
	printf("MCAST_UNBLOCK_SOURCE(ifindex=0): ret=%d errno=%d (%s)\n",
	       ret, errno, ret ? strerror(errno) : "success");
	if (ret)
		goto out;
	show_filter(fd, route_if, route_name);
	show_filter(fd, old_if, old_name);
	if (check_filter(fd, route_if, route_name, 1, MCAST_EXCLUDE, 0, NULL) ||
	    check_filter(fd, old_if, old_name, 1, MCAST_EXCLUDE, 0, NULL)) {
		ret = -1;
		goto out;
	}

	/* Explicit interface selection continues to target the old membership. */
	gsr.gsr_interface = old_if;
	ret = setsockopt(fd, SOL_IPV6, MCAST_BLOCK_SOURCE, &gsr, sizeof(gsr));
	printf("MCAST_BLOCK_SOURCE(explicit %s): ret=%d errno=%d (%s)\n",
	       old_name, ret, errno, ret ? strerror(errno) : "success");
	if (ret)
		goto out;
	show_filter(fd, route_if, route_name);
	show_filter(fd, old_if, old_name);
	if (check_filter(fd, route_if, route_name, 1, MCAST_EXCLUDE, 0, NULL) ||
	    check_filter(fd, old_if, old_name, 1, MCAST_EXCLUDE,
			 1, "2001:db8::2")) {
		ret = -1;
		goto out;
	}
	ret = setsockopt(fd, SOL_IPV6, MCAST_UNBLOCK_SOURCE, &gsr, sizeof(gsr));
	printf("MCAST_UNBLOCK_SOURCE(explicit %s): ret=%d errno=%d (%s)\n",
	       old_name, ret, errno, ret ? strerror(errno) : "success");
	if (ret)
		goto out;
	if (check_filter(fd, route_if, route_name, 1, MCAST_EXCLUDE, 0, NULL) ||
	    check_filter(fd, old_if, old_name, 1, MCAST_EXCLUDE, 0, NULL)) {
		ret = -1;
		goto out;
	}

	/* Remove only the ASM membership created on the route-selected device. */
	mreq.ipv6mr_interface = route_if;
	ret = setsockopt(fd, SOL_IPV6, IPV6_DROP_MEMBERSHIP,
			 &mreq, sizeof(mreq));
	printf("IPV6_DROP_MEMBERSHIP(route interface): ret=%d errno=%d (%s)\n",
	       ret, errno, ret ? strerror(errno) : "success");
	show_filter(fd, route_if, route_name);
	show_filter(fd, old_if, old_name);
	if (!ret && (check_filter(fd, route_if, route_name, 0, 0, 0, NULL) ||
		     check_filter(fd, old_if, old_name, 1,
				  MCAST_EXCLUDE, 0, NULL)))
		ret = -1;

out:
	close(fd);
	return ret ? EXIT_FAILURE : EXIT_SUCCESS;
}
------END PoC--------

Best regards,
Zihan Xi


Zihan Xi (1):
  ipv6: mcast: pass resolved interface to source update

 include/net/ipv6.h       |  3 ++-
 net/ipv6/ipv6_sockglue.c |  5 ++++-
 net/ipv6/mcast.c         | 39 ++++++++++++++++++++++++---------------
 3 files changed, 30 insertions(+), 17 deletions(-)

-- 
2.43.0

