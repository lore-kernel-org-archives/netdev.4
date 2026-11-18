Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794978722;
	b=dlHarLMOoeqNPg6Cj7GiNRkLyreg28uyqIhHb68UwlSCCrl+irRzrpGMk2a7xMGeodmi
	 Huc24HzqgyzONqf4kQX6qeLk5ue3Vg6dq3Lr5cNGEOA4nMyBdXujnqHIgrP4AXog1V3xf
	 kMkUdfLR0PiNLLBR/hDDfbOickBZ4XrOI17P/sXT5mP7VA2Xx8O8yr95snHg4QCFjmwHi
	 iKGswdFewlOlbUQIp0YR6+skcwBhg7wELeHDGR/vnUK8LUBJcPbChnEBepwqMdwtGJJEI
	 gB0I8SlHFiPEu/y47mr+03FN+ub4NyEAp+PStpMIR0ypUMw+O/OwAfsj86lbpCgwV9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type;
	bh=6VEXINOC5jf6qsV8W68hqegOENJgVYN0tmqIEe9PQ8I=;
	b=hs+Y/Q0l0bSgcohNP/H8g8KGwWkFmOaY0LEz4nmwmym/RnsWGjLUx3MPybLAsQH+Qjbj
	 vNHtzk2YC5Ah5d/XxWB9H3fYv2m3ZrMJSlKJj1r17KO58Oe01NoPHTmZpwA4ULkq3ZrxQ
	 HICTrpLkY4SGH4jEzDq0iwpsSJGUETn75PhjrcyA0UTtplVY5k6kbNAhYx01tvEPLlPH2
	 QFszqSyb0Yse494IlZPZV/nnDPIuxg1xqwXnrw7JMprOTMQSWqIWoD0YZCNrrmMbRSF5r
	 ANsFdx4PAukzaODEV5rxHwxPefJdi1lyImbCyrwdwMij79TXiUHLYCccnT5E910Fk4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fRSa/QTT";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DF0606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 05:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6DF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fRSa/QTT
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a315ed211so427371eec.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794978721; x=1795583521; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6VEXINOC5jf6qsV8W68hqegOENJgVYN0tmqIEe9PQ8I=;
        b=fRSa/QTTdd5/6h3Jf6NakIZoGIxoxF1gCvoBc2VqzOfWIx6IgQyO0eyuVP3+x+bV+M
         PPHH1JhCf6z/kfHQqzMfACGvRRWjwG9vbrQRnAd34RkOXcS3eoqQRJpCCKv94n+A7vOS
         BE2lZwq+4h2Wnw/iCEmkjQDupG/+72RGqi3E5qRS3K03UvLsbuHRONx4fc+nHS5GlkZx
         V7ADvwXWV21JW5XvdpqndOzeZKjzzf+9hI+0QyJNEaMPAVd4biUHfu2YKT2iGedNbIFr
         kDLYZCDTZ7Yni+qKmf3Y4nrXTlFoCdN20gL+4ljn6YF/ia6vrWWIDXjhW7WYIYBGKB5j
         jD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794978721; x=1795583521;
        h=content-type:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6VEXINOC5jf6qsV8W68hqegOENJgVYN0tmqIEe9PQ8I=;
        b=DgFUxKvMnbyowCgxiTVnyTiAxGRWg09cgC09oPXX/tcZMJOnU1MT41o/r5DqPVa0P8
         csrlUUzAVLUGVAE4XB9gKMU7FDhyX1kV06aHNMGivBvbIMWGmQYIO+C8um51EMhvigIB
         Xe/4R8/8WjDMhWue5iBXXhY+EJ1J11rIQjhzRi5aXTjd7lN8njEXGW6ef1lATO+2JMbv
         b/zlV0qXC7J51NZWoIME/J3dPC2o5sy00sFd3kYG+iLqwMoimhoCQq/zb3eianIQQ8W0
         0qgnSvNe2hl0tQTGeRBF02Q8xXVNWIu3bEgWsxrnH8L4KxPCwvKKeRvH0pkztZFXaiaM
         fkOA==
X-Forwarded-Encrypted: i=1; AL+hErHBIjjnMzJGs3YsNpwZn5EbHE5L7nrBjHsNYXRLOh75enYpfYiajPXAXlbk7BnDQpEQ0zJObdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QSA/37TF7E8BHb8ZF9gzCSURNHnzecs4VqgiEnha2zptPi8UB
	XNIbr3ak+n3USJOv8hrPIxZVksL1Q/h/NvRyMpMI3V4zzH3Zne2ONbrt
X-Gm-Gg: AZFdTZdN07ErqZcdxZ/9CSrd91lHdvYeeKJ3iRc5rDmfNzqqPsEW2bPzsQcHNgBHiEB
	KEfqCKyMc+iaXTxdy4aKiPo1p8wLwK9A9V1nlgFWEdKWHT1C3Rnw73WYKzSUPBs9XqTmO/LMDkS
	ZyTerw9Vay9+8Tq/Oa9kFDbsye1SvTc5RGlctVHZ7/+0xmgZBym6MfDfI7pKOUmOGpRyOIoNXjg
	0qN5DRnuCcl+xt5ekCfA+o4/wc7E+tZDWrcmd73A663v9sDhDgmZj0UalCkCE3+1jnXjSxb/gxx
	Bi2C3Du1egR0z0xjIlJm8gUsNM7pAcDa2eQmSBzX9zMmkwDlcDLoA2JfzSVnGvvkHPZMpo78N7Q
	ImfhHILyuGeNbcW7mvcFZbya9ETEoTWy18Vnakpn8cfB4YA3wPWYEsdhlvVHHu7/tb7KPL0yuNP
	+ax0Tw0PAVllqZUgg4aYxk9Z7Vzxf9YaPwzyw2QB/nVkYggIHCnOiD8VBOR6Fj4ih5Ah22MyrSo
	8a2lOHlin5kcacnWZH8dznoed2H14dE6CMTLj5I7OknBXmzq4HacEC44GB66Sa81bhz0QE=
X-Received: by 2002:a05:7300:8aa3:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-3828026b871mr1460994eec.4.1794978720703;
        Tue, 17 Nov 2026 21:12:00 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm5130297eec.5.2026.11.17.21.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:11:59 -0800 (PST)
Date: Tue, 17 Nov 2026 21:11:59 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 David Howells <dhowells@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [BUG] ipv6: splicing a fragmented UDP datagram over an xfrm route
 warns in __ip6_append_data() and fails with EIO
Message-ID: <179497871649.630760.14878797494884573363@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4206675707071764351=="

--===============4206675707071764351==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David, Ido,

While testing v7.4-rc3 with an LLM-guided test generator that we are
developing as a research prototype, we found that sendfile() of a UDPv6
datagram that needs fragmentation, on a route through an xfrm tunnel
state, hits the WARN_ON_ONCE() in the MSG_SPLICE_PAGES branch of
__ip6_append_data(), and every such sendfile() fails with EIO:

  WARNING: net/ipv6/ip6_output.c:1796 at __ip6_append_data+0x17ed/0x4b70, CPU#0: test/115
  CPU: 0 UID: 65534 PID: 115 Comm: test Not tainted 7.4.0-rc3 #1 PREEMPT(lazy) 
  RIP: 0010:__ip6_append_data+0x17ed/0x4b70
  Call Trace:
   <TASK>
   ip6_make_skb+0x24d/0x420
   udpv6_sendmsg+0x1f6f/0x2d70
   sock_sendmsg+0x21f/0x360
   splice_to_socket+0x8fa/0x1180
   direct_splice_actor+0x164/0x6d0
   splice_direct_to_actor+0x2b3/0x990
   do_splice_direct+0x12b/0x1f0
   do_sendfile+0x91b/0xf40
   __x64_sys_sendfile64+0x195/0x1d0
   do_syscall_64+0x116/0x630
   entry_SYSCALL_64_after_hwframe+0x77/0x7f

When __ip6_append_data() starts a new skb for a fragment that is not the
last one, it treats the dst's trailer space as data space:

	if (datalen != length + fraggap) {
		datalen += rt->dst.trailer_len;
	}

On the paged path, pagedlen was computed before that, so with an xfrm
dst (trailer_len > 0)

	copy = datalen - transhdrlen - fraggap - pagedlen;

is trailer_len rather than 0. getfrag() then copies those bytes from the
message iterator into the linear part, but the branch right after it
also runs when getfrag() succeeds:

	if (copy > 0 &&
	    INDIRECT_CALL_1(getfrag, ip_generic_getfrag,
			   from, data + transhdrlen, offset,
			   copy, fraggap, skb) < 0) {
		...
	} else if (flags & MSG_SPLICE_PAGES) {
		copy = 0;
	}

	offset += copy;
	length -= copy + transhdrlen;

so length stays trailer_len larger than what is left in msg->msg_iter.
On the next pass the splice branch finds copy > msg->msg_iter.count,
warns and returns -EIO. IPv4 is not affected: __ip_append_data() does
not add trailer_len to datalen, so copy is 0 there.

The branch dates from ce650a166335 ("udp6: Fix __ip6_append_data()'s
handling of MSG_SPLICE_PAGES"), when copy could be negative on this
path. Since 736b380e28d0 ("ipv6: account for fraggap on the paged
allocation path") a negative copy returns -EINVAL before this point, so
dropping the branch should be enough. With it removed, the reproducer
runs clean in 6 of 6 runs and all its sendfile() calls succeed, where
they all fail with EIO before.

The reproducer creates a user and network namespace as an unprivileged
user (uid 65534) and sets lo's MTU to 1280. It then adds an IPv6 ESP
tunnel state ::1 -> ::1 with cbc(aes) and hmac(sha256), and an outbound
policy for UDP to [::1]:9. Last, it calls sendfile() from a memfd into a
connected UDPv6 socket for lengths of 1200 to 8000 bytes. The same
happens with an IP-TFS state (mode 5); the source has a MODE define.
On an x86_64 QEMU guest with 2 vCPUs and KASAN (gcc 13.3, config
attached), the warning fires in every run (12 of 12), and each
sendfile() longer than one fragment fails.

Checked against v7.4-rc3 (aebb72744764); the branch is the same in
net-next (6ff4c5942a30) and ipsec (f0e68014f4ac). The earlier "WARNING
in __ip6_append_data" (CVE-2023-52527, l2tp transhdrlen) is a different
cause, and we found no report of this one.

The reproducer (repro.c) and the kernel config are attached.

Thanks,
Kyuwon Cho

--===============4206675707071764351==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="repro.c"
MIME-Version: 1.0

// WARNING in __ip6_append_data: sendfile() of datagrams larger than the MTU into a UDPv6 socket whose traffic an
// xfrm tunnel state carries. MODE is XFRM_MODE_TUNNEL (1) or IP-TFS (5).
#define _GNU_SOURCE
#include <arpa/inet.h>
#include <fcntl.h>
#include <linux/netlink.h>
#include <linux/xfrm.h>
#include <net/if.h>
#include <netinet/in.h>
#include <sched.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/sendfile.h>
#include <sys/socket.h>
#include <unistd.h>

#ifndef MODE
#define MODE 5
#endif
#define ATTR_SA_DIR 33
#define SA_DIR_OUT 2

static int fd;

static void put_attr(char *buf, size_t *len, unsigned short type, const void *data, size_t dlen)
{
	struct nlattr *a = (struct nlattr *)(buf + *len);

	a->nla_type = type;
	a->nla_len = NLA_HDRLEN + dlen;
	memcpy((char *)a + NLA_HDRLEN, data, dlen);
	*len += NLA_ALIGN(a->nla_len);
}

static int req(unsigned short type, const void *body, size_t blen, const char *attrs, size_t alen)
{
	char msg[4096] = {0}, rb[4096];
	struct nlmsghdr *nh = (struct nlmsghdr *)msg;

	memcpy(NLMSG_DATA(nh), body, blen);
	memcpy((char *)NLMSG_DATA(nh) + NLMSG_ALIGN(blen), attrs, alen);
	nh->nlmsg_len = NLMSG_LENGTH(NLMSG_ALIGN(blen) + alen);
	nh->nlmsg_type = type;
	nh->nlmsg_flags = NLM_F_REQUEST | NLM_F_ACK;
	if (send(fd, msg, nh->nlmsg_len, 0) < 0 || recv(fd, rb, sizeof(rb), 0) < 0)
		return -1;
	return ((struct nlmsgerr *)NLMSG_DATA((struct nlmsghdr *)rb))->error;
}

static void write_file(const char *path, const char *s)
{
	int f = open(path, O_WRONLY);

	if (f < 0 || write(f, s, strlen(s)) < 0)
		exit(1);
	close(f);
}

int main(void)
{
	struct { struct xfrm_algo a; char key[16]; } crypt = {0};
	struct { struct xfrm_algo_auth a; char key[32]; } auth = {0};
	struct xfrm_userpolicy_info pol = {0};
	struct xfrm_usersa_info sa = {0};
	struct xfrm_user_tmpl tmpl = {0};
	struct sockaddr_in6 dst = {0};
	struct ifreq ifr = {0};
	static char buf[8192];
	unsigned char dir = SA_DIR_OUT;
	char attrs[512], map[32];
	size_t al = 0;
	int s, u, f, len, bad = 0;

	snprintf(map, sizeof(map), "0 %d 1", getuid());
	if (unshare(CLONE_NEWUSER | CLONE_NEWNET))
		return 1;
	write_file("/proc/self/setgroups", "deny");
	write_file("/proc/self/uid_map", map);
	snprintf(map, sizeof(map), "0 %d 1", getgid());
	write_file("/proc/self/gid_map", map);

	s = socket(AF_INET, SOCK_DGRAM, 0);
	strcpy(ifr.ifr_name, "lo");
	ifr.ifr_mtu = 1280;
	ioctl(s, SIOCSIFMTU, &ifr);
	ifr.ifr_flags = IFF_UP;
	ioctl(s, SIOCSIFFLAGS, &ifr);
	fd = socket(AF_NETLINK, SOCK_RAW, NETLINK_XFRM);

	/* Outbound ESP tunnel state ::1 -> ::1. */
	inet_pton(AF_INET6, "::1", &sa.id.daddr);
	inet_pton(AF_INET6, "::1", &sa.saddr);
	sa.id.spi = htonl(0x100);
	sa.id.proto = IPPROTO_ESP;
	sa.family = AF_INET6;
	sa.mode = MODE;
	sa.reqid = 1;
	sa.lft.soft_byte_limit = sa.lft.hard_byte_limit = XFRM_INF;
	sa.lft.soft_packet_limit = sa.lft.hard_packet_limit = XFRM_INF;
	strcpy(crypt.a.alg_name, "cbc(aes)");
	crypt.a.alg_key_len = 128;
	strcpy(auth.a.alg_name, "hmac(sha256)");
	auth.a.alg_key_len = 256;
	auth.a.alg_trunc_len = 128;
	put_attr(attrs, &al, XFRMA_ALG_CRYPT, &crypt, sizeof(crypt));
	put_attr(attrs, &al, XFRMA_ALG_AUTH_TRUNC, &auth, sizeof(auth));
	put_attr(attrs, &al, ATTR_SA_DIR, &dir, 1);
	printf("newsa: %d\n", req(XFRM_MSG_NEWSA, &sa, sizeof(sa), attrs, al));

	/* Outbound policy for UDP to ::1 port 9 through that state. */
	pol.sel.family = AF_INET6;
	inet_pton(AF_INET6, "::1", &pol.sel.daddr);
	pol.sel.prefixlen_d = 128;
	pol.sel.proto = IPPROTO_UDP;
	pol.sel.dport = htons(9);
	pol.sel.dport_mask = 0xffff;
	pol.dir = XFRM_POLICY_OUT;
	pol.action = XFRM_POLICY_ALLOW;
	pol.lft = sa.lft;
	tmpl.id = sa.id;
	tmpl.family = AF_INET6;
	tmpl.saddr = sa.saddr;
	tmpl.reqid = 1;
	tmpl.mode = MODE;
	tmpl.aalgos = tmpl.ealgos = tmpl.calgos = ~0;
	al = 0;
	put_attr(attrs, &al, XFRMA_TMPL, &tmpl, sizeof(tmpl));
	printf("newpolicy: %d\n", req(XFRM_MSG_NEWPOLICY, &pol, sizeof(pol), attrs, al));

	u = socket(AF_INET6, SOCK_DGRAM, 0);
	dst.sin6_family = AF_INET6;
	dst.sin6_port = htons(9);
	inet_pton(AF_INET6, "::1", &dst.sin6_addr);
	connect(u, (struct sockaddr *)&dst, sizeof(dst));
	f = memfd_create("data", 0);
	memset(buf, 0x33, sizeof(buf));
	if (write(f, buf, sizeof(buf)) < 0)
		return 1;
	for (len = 1200; len <= 8000; len += 50) {
		lseek(f, 0, SEEK_SET);
		if (sendfile(u, f, NULL, len) < 0)
			bad++;
	}
	printf("done, %d sendfile errors\n", bad);
	return 0;
}

--===============4206675707071764351==
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"
MIME-Version: 1.0

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
f5wHAoGXAgA=

--===============4206675707071764351==--
