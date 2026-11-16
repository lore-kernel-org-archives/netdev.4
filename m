Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.79.31.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839006;
	b=WFsBVeODW0db72NBteNnkUDnGWUyTga7GrdA7qei+2kzUrvJRye5hQf56RpqHkN0gRav
	 rEisMI/QpAyWFMZxU9Hep5lbLSThYes1o0nvoK9aH99NIg/JESO3pMlN1XkeXKNIXzIF1
	 yelFfRxzSCBRjjOi6MiSNzxU3OsHCtxAw0aHX0VMJrw/+JGMW7PFt+zVo1XcIFsmuUD3/
	 d/Y9v+8xR934SBMQ9h8TPum+Rj59OABnVI9CowKDSfQ2ydYlB8Py5bdxqEPnMgwOqhTYH
	 3K4TbVk+zDKQ0klKezFX5ruzE/e0NSxDH8+tED9T+2aFZ/jV5EJjPSP432rWveHn2/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839006;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Gm-Message-State:
	 X-Received:Received:Received:From:MIME-Version:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-GEOIP-COUNTRY:X-REAL-IP;
	bh=uWcoj+ETf/x5lEEpFHf4Dh2Y4nTvRkxO7BnFMUci0S4=;
	b=Kxa24NcI8gHjidyo5YkmhMm5ENtELOuESIV+QjTbhAHKEpDHl4ertbytZqY1kx2HMSfA
	 5hHDyY8G/uwZPJRX09jh5qGkOZGHufAuyEVws+/+GPwGDRpz7fWFPBYfoqYaxyhxdcwtj
	 V3p1JS1PrmqcxIRVpanCJRHrEA6TAIUSJXebYtxePUMxBI7MH8QCnnn6oVTG1y1mVe62f
	 8ptz41D8U1qJozm2M0CUUgYrkLcEKwidbp2A6STrRqp3OJuUKh1K6nQw8KrIX+ZGj0Eq/
	 GE9BNk6hybRpKwuZpQfPttw5MUmHvQNwRFbhNnQkbgv+uEXctMD3OqsIWOukQZ2wUXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openservis.cz;
	spf=pass smtp.mailfrom=openservis.cz;
	dkim=pass header.d=openservis.cz header.i=@openservis.cz header.a=rsa-sha256 header.s=openservis header.b=QBGd0UVa;
	arc=none smtp.remote-ip=80.79.31.78
Received: from s01.openservis.net (s01.openservis.net [80.79.31.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94FC606A883
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 14:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94FC606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openservis.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openservis.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=openservis.cz header.i=@openservis.cz header.a=rsa-sha256 header.s=openservis header.b=QBGd0UVa
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(Authenticated sender: info@openservis.cz)
	by s01.openservis.net (Postfix) with ESMTPSA id B719D213
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 15:23:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openservis.cz;
	s=openservis; t=1794839003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=uWcoj+ETf/x5lEEpFHf4Dh2Y4nTvRkxO7BnFMUci0S4=;
	b=QBGd0UVawWNlLxkI7dptWQ8dIKqbQjalbCyGKKu8A7D5O+1nRGMB80J5vAgetav2sWOgZ8
	kWndS7m81iaEDssAeQRuPj7ch6hoqJ3ar8JlQZO1h26d6+eBGZVMU45PMdH/m7Zj/W6IJS
	tnJUtSEJWs08A/TH9COLfH2BlVqWWPSioxkQwiI1C0YS6kOvOpblY54lfLx44fo7c68ith
	PcS6vYI89OY+4CSfCuKppMFICp6ASwt8zhOb9iltt0pGCnrpz2Y2NJYHEckOg2mGxtmLIG
	KKNiNwBFLNihEafTJA2P4gNqOnqT3os94mmmPvrOnXlQyonAxXk4vy7WOJfi0w==
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55d360ca878so10949571cf.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:23:23 -0800 (PST)
X-Gm-Message-State: APuU4Z+piCDR7DYKDIIyprLc8itA8XOqL7KmvAGpdo+4HcYOSYLi5hiV
	K9/whcGL2UBDDFG3CMkJPUKi05sTjRD6tNJ8Nr0DikJA+BMB3bErctzYGcZvFQthlELCNHH9pXr
	CZnC7oNTxJgQ8t/1lMHycXTb0uAB+bAg=
X-Received: by 2002:a05:622a:5a11:b0:536:6d88:6018 with SMTP id
 d75a77b69052e-55ac818b139mr166563661cf.51.1794839002540; Mon, 16 Nov 2026
 06:23:22 -0800 (PST)
Received: from 702513959580 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Nov 2026 06:23:22 -0800
Received: from 702513959580 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Nov 2026 09:04:09 -0500
From: info@openservis.cz
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 16 Nov 2026 06:23:21 -0800
X-Gmail-Original-Message-ID: <CAFvzkdAXBNAWcHFNo6akAo63Wd8B_jvhkt=AEmuLR9fgPBEfGg@mail.gmail.com>
X-Gm-Features: AclHuK9PtwwpL45ielHB87Wg1P40TL9Qhd5JdjFR6YzTA_GwMA2zlWGjgVSVmkU
Message-ID: <CAFvzkdAXBNAWcHFNo6akAo63Wd8B_jvhkt=AEmuLR9fgPBEfGg@mail.gmail.com>
Subject: [BUG] netfilter: synproxy: server ACK carries TSecr shifted twice,
 rejected by tcp_check_req() since v6.15
To: netfilter-devel@vger.kernel.org
Cc: netdev@vger.kernel.org, coreteam@netfilter.org, 
	Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
	Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-GEOIP-COUNTRY: US
X-REAL-IP: 209.85.160.172

(Resent as plain text, the list rejected the first copy as HTML.)

Hello,

with SYNPROXY --timestamp in front of a Linux backend, every
handshake ACK that SYNPROXY sends to the backend is dropped by the
backend's tcp_check_req() TSecr check added in 3ba075278c11 ("tcp: be
less liberal in TSEcr received while in SYN_RECV state", v6.15). The
connection then only completes with the client's first data segment.
If the backend's millisecond clock ticks between its SYN-ACK and its
reply to the rejected ACK, the client echoes the newer TSval, the data
segment is rejected too, and the connection stalls until the backend
retransmits its SYN-ACK after 1 s (about 1.6 s in total).

Cause, as far as we can read the code (mainline a9daf327f3ff,
net/netfilter/nf_synproxy_core.c, IPv4; the IPv6 path at lines
1149-1180 is the same, not measured):

- ipv4_synproxy_hook(), state TCP_CONNTRACK_SYN_RECV (line 719):
  synproxy->tsoff = opts.tsval - synproxy->its (line 727), then
  swap(opts.tsval, opts.tsecr) and synproxy_send_server_ack() (line
  736), so the ACK is built with TSecr already equal to the backend's
  TSval.
- synproxy_send_server_ack() sends it via synproxy_send_tcp() with no
  conntrack attached (line 573). Conntrack then associates it with the
  connection in the ORIGINAL direction and the same hook calls
  synproxy_tstamp_adjust() on it (line 750), which adds tsoff to TSecr
  a second time (lines 227-231).
- net/ipv4/tcp_minisocks.c, tcp_check_req() (line 687): tsecr_reject
  = !between(rcv_tsecr, snt_tsval_first, snt_tsval_last) (lines
  709-711), the segment is dropped and answered with an ACK (lines
  843-861, LINUX_MIB_TSECRREJECTED).

Before v6.15 the wrong TSecr was ignored in SYN_RECV, so the bug was
invisible.

Measurement (network-namespace lab, no hardware involved):
- kernel 7.1.13-200.fc44.x86_64, iptables v1.8.11 (nf_tables)
- host namespace with Docker-style DNAT of :443 to a backend in
  another namespace behind a bridge; client in a third namespace
  behind a veth
- rules:
    iptables -t raw -I PREROUTING -p tcp --syn -m multiport \
      --dports 443,80 ! -i br-+ -m addrtype --dst-type LOCAL \
      --limit-iface-in -j CT --notrack
    iptables -I INPUT -p tcp -m multiport --dports 443,80 ! -i br-+ \
      -m addrtype --dst-type LOCAL --limit-iface-in \
      -m conntrack --ctstate INVALID,UNTRACKED \
      -j SYNPROXY --sack-perm --timestamp --wscale 10 --mss 1460
    sysctl net.netfilter.nf_conntrack_tcp_loose=0
- client: 1000 sequential connections, each connect() followed
  immediately by a small HTTP request

Results:
- in the backend namespace, TcpExtTSEcrRejected grew by 1004 to 1024
  per 1000 connections (3056 for 3000 in a captured run), i.e. every
  handshake ACK from SYNPROXY was rejected
- 0 to 7 of 1000 connections took 1.6 to 1.7 s instead of under 1 ms;
  TcpExtTCPSynRetrans in the backend grew by exactly the number of
  slow connections (6 of 1000 in one run, 14 of 3000 in the capture)
- without SYNPROXY: 0 of 1000 slow
- capture of one connection: backend SYN-ACK "TS val 1224945131", the
  ACK from SYNPROXY to the backend "TS ecr 2263544124"; the difference
  1038598993 is exactly tsoff of that connection (1224945131 minus
  the cookie TSval 186346138 sent to the client)

Possible fix (untested): build the server ACK with TSecr =
synproxy->its, so that synproxy_tstamp_adjust() brings it to the
backend's TSval, or keep the generated ACK out of the adjustment.

We can run a patch through the same lab if that helps.

Thanks,
Dominik Shaim Ulrich
