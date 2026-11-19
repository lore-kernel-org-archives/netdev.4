Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047347;
	b=mRdAJGo+VZSf9WGx2wiHSpSmBlpFu/Jg416pGKieV/iwFsqvaVcztoafQci7o34Tnp5J
	 0iBZwU7w4S+NcvPZxWgDV6rRgLOIumACsC2qufLSJtXf24ZE5WgUzwL07MTTcOe9oe7hQ
	 SpDp0HSnW10l/98NEE8istWXgBsiORXt6zeoZOqqijqznemYto6CEJf0iGMCMzzPvt1ZG
	 hXKfNO8Tcxh+Iv/Q6KBnABEfbls4QSAZX2A26Uekld36tdsodtQ4+x698Nsj/Ka1nEIbV
	 O+bg56YG9trlF8wQS4fstvEcVzb1a0dFNaSeKmaoh68D10nivZVkoKRYzNH8n1PaxSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a0cpytaSnbpSDgYsd6fibR9583wayTm1f5V11sy0gRs=;
	b=REikFf4z1UhH1DLVV8cSoVe5yrKOTn2V3wOwrObm7PKk2d8V7lHTzsyXADYEE6kUVwdb
	 tuc5E+sV5kWt2wN2AaA/sN9mqc/zhN92V58VmVNnSpmWZ8AVcFTnGROlMeEqOnleBCwPQ
	 ePUmXCeoPSNRi81D4u7vCkuSs47z1HrXRWYE73ZiVRL/g93n4Hgenl0XdgU/D7x+C/EK7
	 JgC5ZsY2S69xO0/Z++ehFVWQzQPUf6W61HpaZoLhNSX7qVx7S/jcGyiLchCv0DqBlQ89K
	 nyVHvacxDO43aFLVyDctpJrNhShiu1yWWXeYPWJwHYZZcXWytKrbGsTz7yeIJMT9fmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jOh5xqSk;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF31606A32A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF31606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jOh5xqSk
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso1115293a12.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795047346; x=1795652146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0cpytaSnbpSDgYsd6fibR9583wayTm1f5V11sy0gRs=;
        b=jOh5xqSkmpJkSJGIKgPzGe9N059/vk/PwmHomyQNXH3hVhpFUFyFKr3A51ZhDQt1of
         jGW50DDVaMFffc7ssXqXHax3pXQykIaqvxfBx6CvX9MYNorUfjjuqjwERN7ZmaZ0bY5p
         ryXvr4ykJFNNCvghSr00xVGrXSLMEU2DOWQNgIaNpqxVLmdIs77xS9iWglB1kOkHPddP
         Ts2nWXvRwSQxBOTIY4Twmh1IJsDZMbnfj36Fd4XEFRXFY8zrZplYtZE+ze0GIUm3gjM5
         EDJWQGPN5HHxsItsR5CXyUMUHFS8biWEV/BWX2y3aSMX5z1AvsXKK99D/8J9daBlDRvn
         M6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047346; x=1795652146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a0cpytaSnbpSDgYsd6fibR9583wayTm1f5V11sy0gRs=;
        b=105oRL4AnWDYZ+xC7CazdRuZM5TGs6NoPi5Uv9f2x1cd9JC6jNGUzR9JtkNS+a/cNR
         AV5hYu5ipV1FnNVG1gVUrJ+jMGG3eNxX7QxLqOxTFz1qHRImq0i9Adm8T9lRZ62UPqFa
         QgHvuHOnTGBqr7er81rZZLbBX44hSAOWmy0EFRSEJMiVK0tNBQCZlJtw9Bx8BXVmrs6o
         FcasqDa9ck+6SOiQSSbTzyF/N59+qTChpNdlVfXB8E6aWYmZnsKlwFlFySrvUjQTR6xk
         vCu/guuraoJmjoGUS+5z04x4R65FAYrQEdc2TFMlf4g7lUOy1NYtFwGB7KcdLL4Qt+sa
         uoGw==
X-Gm-Message-State: APuU4Z9+Mjo7o7rgvUVmMtPkMaqW+c0mBY7NohzRziquKOqf6K8LyW1v
	xCWvTvBsBhgp+P9RLCzmG4B7Ybi3Fkf9OP3mzUHVbMbzXwWTpnAruMApMmgc+si2gEz1l8coKOc
	/sX2/
X-Gm-Gg: AZFdTZcavgPOjz4WiumeAiguU23Cb4dq99lfxBw5nKfUm1eMajFIQPr76HJB4dDgIl7
	y4nqMKAiKkal2DC6jhjAtZOhOfuh58XhLascRMo5Gxmnb/J83PNJ76kGBJ4yIN/6hq5w2cArprh
	62G2E5k6rqrQAH9nPneZG2M+srF6RsU2xKH4ymrTa2YAfdtsjgN1GYTnMAv4fxI0J5WD3NtUNJK
	haGHX4KGhaki96s/BSwSjHHPTLs91K6NQllKw5Y6V9sHXK3jb6/qMusy8c6wwH96lZEmvzSRFRM
	/PflhZFktq187VMDLhPMhR/pcnjakMiqgqTqCvrMzFWrV+ncByhLQRvXpJWrdJXSoCT98ymo73V
	BMLyAwQWSfe7Td1QcYWTCMG1XYyAh4g0PSiPasANlkOotIMVAW+pCpzrOh1v8A+L8CvSH0KNsRU
	uPoQfud0zvoCZGEblKxu1WqM0HoPKRtAqa4y9lpCviisutSt9EYH6pIwfmNgM7t7c/BPRb8OWjM
	MnchXHfMPJnqenSgFckR3E8LgNBfPoarusA8INd+Ik6fpiSAW66q4aHba2o9TEi4OuayCXJ+gVt
	qOmg7zGmWou1iIJ3EKxl8azZuRNSMjc9OlWy5FL60vZdDx7i00un66lmqq2XktdwseLp
X-Received: by 2002:a17:90b:1649:b0:3b3:a9a4:8c9a with SMTP id 98e67ed59e1d1-3b3d064200emr4241861a91.1.1795047345924;
        Wed, 18 Nov 2026 16:15:45 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe0b62e7sm444278a91.11.2026.11.18.16.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:15:45 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Thomas Graf <tgraf@suug.ch>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Alexei Starovoitov <ast@plumgrid.com>,
	Jiri Pirko <jiri@resnulli.us>
Subject: [PATCH iproute2-next 3/5] tc: remove eBPF map export and exec bpf import
Date: Wed, 18 Nov 2026 16:15:07 -0800
Message-ID: <20261119001539.2868072-4-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119001539.2868072-1-stephen@networkplumber.org>
References: <20261119001539.2868072-1-stephen@networkplumber.org>
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

The export option of tc bpf filters and actions sends the map file
descriptors to whatever process is bound to the given Unix socket.
The socket owner is not checked, so the maps can end up with an
unrelated process that happens to be bound to that path.

This only works with the legacy ELF loader; with libbpf nothing is
sent, so the feature has been dead in default builds for a while.
Maps can be shared by pinning them in bpffs instead.

Remove the export option, the exec bpf import and run commands, and
the TC_BPF_UDS environment variable.

Also update the man page.

Fixes: 6256f8c9e45f ("tc, bpf: finalize eBPF support for cls and act front-end")
Reported-by: Anthropic OSS scanner (ANT-2026-5S9IO0L4)
Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 bash-completion/tc |  18 +---
 include/bpf_scm.h  |  77 ----------------
 include/bpf_util.h |  18 +---
 lib/bpf_legacy.c   | 217 +--------------------------------------------
 man/man8/tc-bpf.8  | 113 +++--------------------
 tc/e_bpf.c         | 157 ++++++--------------------------
 tc/f_bpf.c         |  15 +---
 tc/m_bpf.c         |  16 +---
 8 files changed, 50 insertions(+), 581 deletions(-)
 delete mode 100644 include/bpf_scm.h

diff --git a/bash-completion/tc b/bash-completion/tc
index c18288a3..dfbe5624 100644
--- a/bash-completion/tc
+++ b/bash-completion/tc
@@ -205,7 +205,7 @@ _tc_direct_complete()
             ;;
 
         # BPF options - used for filters, actions, and exec
-        export|bytecode|bytecode-file|object-file)
+        bytecode|bytecode-file|object-file)
             _filedir
             return 0
             ;;
@@ -230,10 +230,6 @@ _tc_direct_complete()
             fi
             return 0
             ;;
-        import|run)
-            _filedir
-            return 0
-            ;;
         type)
             COMPREPLY+=( $( compgen -W 'cls act' -- "$cur" ) )
             return 0
@@ -387,10 +383,7 @@ _tc_qdisc_options()
 _tc_bpf_options()
 {
     [[ ${words[${#words[@]}-3]} == object-file ]] && \
-        _tc_once_attr 'section export'
-    [[ ${words[${#words[@]}-5]} == object-file ]] && \
-        [[ ${words[${#words[@]}-3]} =~ (section|export) ]] && \
-        _tc_once_attr 'section export'
+        _tc_once_attr 'section'
     _tc_one_of_list 'bytecode bytecode-file object-file object-pinned'
     _tc_once_attr 'verbose index direct-action action classid'
     return 0
@@ -524,11 +517,6 @@ _tc_action_options()
 _tc_exec_options()
 {
     case $1 in
-        import)
-            [[ ${words[${#words[@]}-3]} == import ]] && \
-                _tc_once_attr 'run'
-            return 0
-            ;;
         graft)
             COMPREPLY+=( $( compgen -W 'key type' -- "$cur" ) )
             [[ ${words[${#words[@]}-3]} == object-file ]] && \
@@ -772,7 +760,7 @@ _tc()
         exec)
             case $subcmd in
                 bpf)
-                    local excmd exwd EXEC_KIND=' import debug graft '
+                    local excmd exwd EXEC_KIND=' debug graft '
                     for ((exwd=$subcword; exwd < ${#words[@]}-1; exwd++)); do
                         if [[ $EXEC_KIND =~ ' '${words[exwd]}' ' ]]; then
                             excmd=${words[exwd]}
diff --git a/include/bpf_scm.h b/include/bpf_scm.h
deleted file mode 100644
index 669f0538..00000000
--- a/include/bpf_scm.h
+++ /dev/null
@@ -1,77 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __BPF_SCM__
-#define __BPF_SCM__
-
-#include <sys/types.h>
-#include <sys/socket.h>
-#include <sys/un.h>
-
-#include "utils.h"
-#include "bpf_elf.h"
-
-#define BPF_SCM_AUX_VER		1
-#define BPF_SCM_MAX_FDS		ELF_MAX_MAPS
-#define BPF_SCM_MSG_SIZE	1024
-
-struct bpf_elf_st {
-	dev_t st_dev;
-	ino_t st_ino;
-};
-
-struct bpf_map_aux {
-	unsigned short uds_ver;
-	unsigned short num_ent;
-	char obj_name[64];
-	struct bpf_elf_st obj_st;
-	struct bpf_elf_map ent[BPF_SCM_MAX_FDS];
-};
-
-struct bpf_map_set_msg {
-	struct msghdr hdr;
-	struct iovec iov;
-	char msg_buf[BPF_SCM_MSG_SIZE];
-	struct bpf_map_aux aux;
-};
-
-static inline int *bpf_map_set_init(struct bpf_map_set_msg *msg,
-				    struct sockaddr_un *addr,
-				    unsigned int addr_len)
-{
-	const unsigned int cmsg_ctl_len = sizeof(int) * BPF_SCM_MAX_FDS;
-	struct cmsghdr *cmsg;
-
-	msg->iov.iov_base = &msg->aux;
-	msg->iov.iov_len = sizeof(msg->aux);
-
-	msg->hdr.msg_iov = &msg->iov;
-	msg->hdr.msg_iovlen = 1;
-
-	msg->hdr.msg_name = (struct sockaddr *)addr;
-	msg->hdr.msg_namelen = addr_len;
-
-	BUILD_BUG_ON(sizeof(msg->msg_buf) < cmsg_ctl_len);
-	msg->hdr.msg_control = &msg->msg_buf;
-	msg->hdr.msg_controllen	= cmsg_ctl_len;
-
-	cmsg = CMSG_FIRSTHDR(&msg->hdr);
-	cmsg->cmsg_len = msg->hdr.msg_controllen;
-	cmsg->cmsg_level = SOL_SOCKET;
-	cmsg->cmsg_type	= SCM_RIGHTS;
-
-	return (int *)CMSG_DATA(cmsg);
-}
-
-static inline void bpf_map_set_init_single(struct bpf_map_set_msg *msg,
-					   int num)
-{
-	struct cmsghdr *cmsg;
-
-	msg->hdr.msg_controllen = CMSG_LEN(sizeof(int) * num);
-	msg->iov.iov_len = offsetof(struct bpf_map_aux, ent) +
-			   sizeof(struct bpf_elf_map) * num;
-
-	cmsg = CMSG_FIRSTHDR(&msg->hdr);
-	cmsg->cmsg_len = msg->hdr.msg_controllen;
-}
-
-#endif /* __BPF_SCM__ */
diff --git a/include/bpf_util.h b/include/bpf_util.h
index e1b8d327..78c38e80 100644
--- a/include/bpf_util.h
+++ b/include/bpf_util.h
@@ -16,9 +16,8 @@
 #include <linux/elf-em.h>
 
 #include "utils.h"
-#include "bpf_scm.h"
+#include "bpf_elf.h"
 
-#define BPF_ENV_UDS	"TC_BPF_UDS"
 #define BPF_ENV_MNT	"TC_BPF_MNT"
 
 #ifndef BPF_MAX_LOG
@@ -60,7 +59,6 @@ struct bpf_cfg_in {
 	const char *object;
 	const char *section;
 	const char *prog_name;
-	const char *uds;
 	enum bpf_prog_type type;
 	enum bpf_mode mode;
 	__u32 ifindex;
@@ -282,9 +280,6 @@ int bpf_dump_prog_info(FILE *f, uint32_t id);
 int bpf(int cmd, union bpf_attr *attr, unsigned int size);
 
 #ifdef HAVE_ELF
-int bpf_send_map_fds(const char *path, const char *obj);
-int bpf_recv_map_fds(const char *path, int *fds, struct bpf_map_aux *aux,
-		     unsigned int entries);
 #ifdef HAVE_LIBBPF
 int iproute2_bpf_elf_ctx_init(struct bpf_cfg_in *cfg);
 int iproute2_bpf_fetch_ancillary(void);
@@ -296,17 +291,6 @@ int iproute2_find_map_name_by_id(unsigned int map_id, char *name);
 int iproute2_load_libbpf(struct bpf_cfg_in *cfg);
 #endif /* HAVE_LIBBPF */
 #else
-static inline int bpf_send_map_fds(const char *path, const char *obj)
-{
-	return 0;
-}
-
-static inline int bpf_recv_map_fds(const char *path, int *fds,
-				   struct bpf_map_aux *aux,
-				   unsigned int entries)
-{
-	return -1;
-}
 #ifdef HAVE_LIBBPF
 static inline int iproute2_load_libbpf(struct bpf_cfg_in *cfg)
 {
diff --git a/lib/bpf_legacy.c b/lib/bpf_legacy.c
index 5b8ac47d..f9844fd4 100644
--- a/lib/bpf_legacy.c
+++ b/lib/bpf_legacy.c
@@ -42,13 +42,11 @@
 
 #include "bpf_util.h"
 #include "bpf_elf.h"
-#include "bpf_scm.h"
 
 struct bpf_prog_meta {
 	const char *type;
 	const char *subdir;
 	const char *section;
-	bool may_uds_export;
 };
 
 static const enum bpf_prog_type __bpf_types[] = {
@@ -65,13 +63,11 @@ static const struct bpf_prog_meta __bpf_prog_meta[] = {
 		.type		= "cls",
 		.subdir		= "tc",
 		.section	= ELF_SECTION_CLASSIFIER,
-		.may_uds_export	= true,
 	},
 	[BPF_PROG_TYPE_SCHED_ACT] = {
 		.type		= "act",
 		.subdir		= "tc",
 		.section	= ELF_SECTION_ACTION,
-		.may_uds_export	= true,
 	},
 	[BPF_PROG_TYPE_XDP] = {
 		.type		= "xdp",
@@ -827,7 +823,7 @@ static int bpf_obj_pinned(const char *pathname, enum bpf_prog_type type)
 
 static int bpf_do_parse(struct bpf_cfg_in *cfg, const bool *opt_tbl)
 {
-	const char *file, *section, *uds_name, *prog_name;
+	const char *file, *section, *prog_name;
 	bool verbose = false;
 	int i, ret, argc;
 	char **argv;
@@ -858,7 +854,7 @@ static int bpf_do_parse(struct bpf_cfg_in *cfg, const bool *opt_tbl)
 	}
 
 	NEXT_ARG();
-	file = section = uds_name = prog_name = NULL;
+	file = section = prog_name = NULL;
 	if (cfg->mode == EBPF_OBJECT || cfg->mode == EBPF_PINNED) {
 		file = *argv;
 		NEXT_ARG_FWD();
@@ -901,16 +897,6 @@ static int bpf_do_parse(struct bpf_cfg_in *cfg, const bool *opt_tbl)
 			NEXT_ARG_FWD();
 		}
 
-		if (__bpf_prog_meta[cfg->type].may_uds_export) {
-			uds_name = getenv(BPF_ENV_UDS);
-			if (argc > 0 && !uds_name &&
-			    matches(*argv, "export") == 0) {
-				NEXT_ARG();
-				uds_name = *argv;
-				NEXT_ARG_FWD();
-			}
-		}
-
 		if (argc > 0 && matches(*argv, "verbose") == 0) {
 			verbose = true;
 			NEXT_ARG_FWD();
@@ -934,7 +920,6 @@ static int bpf_do_parse(struct bpf_cfg_in *cfg, const bool *opt_tbl)
 
 	cfg->object  = file;
 	cfg->section = section;
-	cfg->uds     = uds_name;
 	cfg->argc    = argc;
 	cfg->argv    = argv;
 	cfg->verbose = verbose;
@@ -1179,7 +1164,6 @@ struct bpf_elf_ctx {
 	enum bpf_prog_type	type;
 	__u32			ifindex;
 	bool			verbose;
-	struct bpf_elf_st	stat;
 	struct bpf_hash_entry	*ht[256];
 	char			*log;
 	size_t			log_size;
@@ -1191,13 +1175,6 @@ struct bpf_elf_sec_data {
 	const char		*sec_name;
 };
 
-struct bpf_map_data {
-	int			*fds;
-	const char		*obj;
-	struct bpf_elf_st	*st;
-	struct bpf_elf_map	*ent;
-};
-
 static bool bpf_log_has_data(struct bpf_elf_ctx *ctx)
 {
 	return ctx->log && ctx->log[0];
@@ -2647,24 +2624,6 @@ static int bpf_fill_prog_arrays(struct bpf_elf_ctx *ctx)
 	return 0;
 }
 
-static void bpf_save_finfo(struct bpf_elf_ctx *ctx)
-{
-	struct stat st;
-	int ret;
-
-	memset(&ctx->stat, 0, sizeof(ctx->stat));
-
-	ret = fstat(ctx->obj_fd, &st);
-	if (ret < 0) {
-		fprintf(stderr, "Stat of elf file failed: %s\n",
-			strerror(errno));
-		return;
-	}
-
-	ctx->stat.st_dev = st.st_dev;
-	ctx->stat.st_ino = st.st_ino;
-}
-
 static int bpf_read_pin_mapping(FILE *fp, uint32_t *id, char *path)
 {
 	char buff[PATH_MAX];
@@ -2877,7 +2836,6 @@ static int bpf_elf_ctx_init(struct bpf_elf_ctx *ctx, const char *pathname,
 		goto out_free;
 	}
 
-	bpf_save_finfo(ctx);
 	bpf_hash_init(ctx, CONF_ETC_DIR "/bpf_pinning");
 	if (ret == -ENOENT)
 		ret = bpf_hash_init(ctx, CONF_USR_DIR "/bpf_pinning");
@@ -2892,19 +2850,6 @@ out_fd:
 	return ret;
 }
 
-static int bpf_maps_count(struct bpf_elf_ctx *ctx)
-{
-	int i, count = 0;
-
-	for (i = 0; i < ARRAY_SIZE(ctx->map_fds); i++) {
-		if (!ctx->map_fds[i])
-			break;
-		count++;
-	}
-
-	return count;
-}
-
 static void bpf_maps_teardown(struct bpf_elf_ctx *ctx)
 {
 	int i;
@@ -2975,164 +2920,6 @@ out:
 	return fd;
 }
 
-static int
-bpf_map_set_send(int fd, struct sockaddr_un *addr, unsigned int addr_len,
-		 const struct bpf_map_data *aux, unsigned int entries)
-{
-	struct bpf_map_set_msg msg = {
-		.aux.uds_ver = BPF_SCM_AUX_VER,
-		.aux.num_ent = entries,
-	};
-	int *cmsg_buf, min_fd;
-	char *amsg_buf;
-	int i;
-
-	strlcpy(msg.aux.obj_name, aux->obj, sizeof(msg.aux.obj_name));
-	memcpy(&msg.aux.obj_st, aux->st, sizeof(msg.aux.obj_st));
-
-	cmsg_buf = bpf_map_set_init(&msg, addr, addr_len);
-	amsg_buf = (char *)msg.aux.ent;
-
-	for (i = 0; i < entries; i += min_fd) {
-		int ret;
-
-		min_fd = min(BPF_SCM_MAX_FDS * 1U, entries - i);
-		bpf_map_set_init_single(&msg, min_fd);
-
-		memcpy(cmsg_buf, &aux->fds[i], sizeof(aux->fds[0]) * min_fd);
-		memcpy(amsg_buf, &aux->ent[i], sizeof(aux->ent[0]) * min_fd);
-
-		ret = sendmsg(fd, &msg.hdr, 0);
-		if (ret <= 0)
-			return ret ? : -1;
-	}
-
-	return 0;
-}
-
-static int
-bpf_map_set_recv(int fd, int *fds,  struct bpf_map_aux *aux,
-		 unsigned int entries)
-{
-	struct bpf_map_set_msg msg;
-	int *cmsg_buf, min_fd;
-	char *amsg_buf, *mmsg_buf;
-	unsigned int needed = 1;
-	int i;
-
-	cmsg_buf = bpf_map_set_init(&msg, NULL, 0);
-	amsg_buf = (char *)msg.aux.ent;
-	mmsg_buf = (char *)&msg.aux;
-
-	for (i = 0; i < min(entries, needed); i += min_fd) {
-		struct cmsghdr *cmsg;
-		int ret;
-
-		min_fd = min(entries, entries - i);
-		bpf_map_set_init_single(&msg, min_fd);
-
-		ret = recvmsg(fd, &msg.hdr, 0);
-		if (ret <= 0)
-			return ret ? : -1;
-
-		cmsg = CMSG_FIRSTHDR(&msg.hdr);
-		if (!cmsg || cmsg->cmsg_type != SCM_RIGHTS)
-			return -EINVAL;
-		if (msg.hdr.msg_flags & MSG_CTRUNC)
-			return -EIO;
-		if (msg.aux.uds_ver != BPF_SCM_AUX_VER)
-			return -ENOSYS;
-
-		min_fd = (cmsg->cmsg_len - sizeof(*cmsg)) / sizeof(fd);
-		if (min_fd > entries || min_fd <= 0)
-			return -EINVAL;
-
-		memcpy(&fds[i], cmsg_buf, sizeof(fds[0]) * min_fd);
-		memcpy(&aux->ent[i], amsg_buf, sizeof(aux->ent[0]) * min_fd);
-		memcpy(aux, mmsg_buf, offsetof(struct bpf_map_aux, ent));
-
-		needed = aux->num_ent;
-	}
-
-	return 0;
-}
-
-int bpf_send_map_fds(const char *path, const char *obj)
-{
-	struct bpf_elf_ctx *ctx = &__ctx;
-	struct sockaddr_un addr = { .sun_family = AF_UNIX };
-	struct bpf_map_data bpf_aux = {
-		.fds = ctx->map_fds,
-		.ent = ctx->maps,
-		.st  = &ctx->stat,
-		.obj = obj,
-	};
-	int fd, ret = -1;
-
-	fd = socket(AF_UNIX, SOCK_DGRAM, 0);
-	if (fd < 0) {
-		fprintf(stderr, "Cannot open socket: %s\n",
-			strerror(errno));
-		goto out;
-	}
-
-	strlcpy(addr.sun_path, path, sizeof(addr.sun_path));
-
-	ret = connect(fd, (struct sockaddr *)&addr, sizeof(addr));
-	if (ret < 0) {
-		fprintf(stderr, "Cannot connect to %s: %s\n",
-			path, strerror(errno));
-		goto out;
-	}
-
-	ret = bpf_map_set_send(fd, &addr, sizeof(addr), &bpf_aux,
-			       bpf_maps_count(ctx));
-	if (ret < 0)
-		fprintf(stderr, "Cannot send fds to %s: %s\n",
-			path, strerror(errno));
-
-	bpf_maps_teardown(ctx);
-out:
-	if (fd >= 0)
-		close(fd);
-	return ret;
-}
-
-int bpf_recv_map_fds(const char *path, int *fds, struct bpf_map_aux *aux,
-		     unsigned int entries)
-{
-	struct sockaddr_un addr = { .sun_family = AF_UNIX };
-	int fd, ret = -1;
-
-	fd = socket(AF_UNIX, SOCK_DGRAM, 0);
-	if (fd < 0) {
-		fprintf(stderr, "Cannot open socket: %s\n",
-			strerror(errno));
-		goto out;
-	}
-
-	strlcpy(addr.sun_path, path, sizeof(addr.sun_path));
-
-	ret = bind(fd, (struct sockaddr *)&addr, sizeof(addr));
-	if (ret < 0) {
-		fprintf(stderr, "Cannot bind to socket: %s\n",
-			strerror(errno));
-		goto out;
-	}
-
-	ret = bpf_map_set_recv(fd, fds, aux, entries);
-	if (ret < 0)
-		fprintf(stderr, "Cannot recv fds from %s: %s\n",
-			path, strerror(errno));
-
-	unlink(addr.sun_path);
-
-out:
-	if (fd >= 0)
-		close(fd);
-	return ret;
-}
-
 #ifdef HAVE_LIBBPF
 /* The following functions are wrapper functions for libbpf code to be
  * compatible with the legacy format. So all the functions have prefix
diff --git a/man/man8/tc-bpf.8 b/man/man8/tc-bpf.8
index 01230ce6..cd781eea 100644
--- a/man/man8/tc-bpf.8
+++ b/man/man8/tc-bpf.8
@@ -10,8 +10,6 @@ queueing disciplines
 OBJ_FILE ] [
 .B section
 CLS_NAME ] [
-.B export
-UDS_FILE ] [
 .B verbose
 ] [
 .B direct-action
@@ -35,8 +33,6 @@ CLASSID ]
 OBJ_FILE ] [
 .B section
 CLS_NAME ] [
-.B export
-UDS_FILE ] [
 .B verbose
 ]
 
@@ -158,17 +154,6 @@ that a single object file can contain multiple classifier and actions,
 the corresponding section name needs to be specified, if it differs
 from the defaults.
 
-.SS export
-points to a Unix domain socket file. In case the eBPF object file also
-contains a section named "maps" with eBPF map specifications, then the
-map file descriptors can be handed off via the Unix domain socket to
-an eBPF "agent" herding all descriptors after tc lifetime. This can be
-some third party application implementing the IPC counterpart for the
-import, that uses them for calling into
-.B bpf(2)
-system call to read out or update eBPF map data from user space, for
-example, for monitoring purposes or to push down new policies.
-
 .SS verbose
 if set, it will dump the eBPF verifier output, even if loading the eBPF
 program was successful. By default, only on error, the verifier log is
@@ -250,8 +235,8 @@ rather resides in a text file.
 
 .SH EXAMPLES
 .SS eBPF TOOLING
-A full blown example including eBPF agent code can be found inside the
-iproute2 source package under:
+Example eBPF programs can be found inside the iproute2 source package
+under:
 .B examples/bpf/
 
 As prerequisites, the kernel needs to have the eBPF system call namely
@@ -424,90 +409,20 @@ example:
 The advantage of this is that the classifier and the two actions can
 then share eBPF maps with each other, if implemented in the programs.
 
-In order to access eBPF maps from user space beyond
-.B tc(8)
-setup lifetime, the ownership can be transferred to an eBPF agent via
-Unix domain sockets. There are two possibilities for implementing this:
-
-.B 1)
-implementation of an own eBPF agent that takes care of setting up
-the Unix domain socket and implementing the protocol that
+eBPF maps can be accessed from user space beyond
 .B tc(8)
-dictates. A code example of this can be found inside the iproute2
-source package under:
-.B examples/bpf/
-
-.B 2)
-use
-.B tc exec
-for transferring the eBPF map file descriptors through a Unix domain
-socket, and spawning an application such as
-.B sh(1)
-\&. This approach's advantage is that tc will place the file descriptors
-into the environment and thus make them available just like stdin, stdout,
-stderr file descriptors, meaning, in case user applications run from within
-this fd-owner shell, they can terminate and restart without losing eBPF
-maps file descriptors. Example invocation with the previous classifier and
-action mixture:
-
-.in +4n
-.B tc exec bpf imp /tmp/bpf
-.br
-.B tc filter add dev em1 parent 1: bpf obj bpf.o exp /tmp/bpf flowid 1:1 \e
-.br
-.in +25n
-.B                          action bpf obj bpf.o sec action-mark \e
-.br
-.B                          action bpf obj bpf.o sec action-rand ok
-.in -25n
-.in -4n
-
-Assuming that eBPF maps are shared with classifier and actions, it's
-enough to export them once, for example, from within the classifier
-or action command. tc will setup all eBPF map file descriptors at the
-time when the object file is first parsed.
-
-When a shell has been spawned, the environment will have a couple of
-eBPF related variables. BPF_NUM_MAPS provides the total number of maps
-that have been transferred over the Unix domain socket. BPF_MAP<X>'s
-value is the file descriptor number that can be accessed in eBPF agent
-applications, in other words, it can directly be used as the file
-descriptor value for the
+setup lifetime by pinning them in the BPF file system. Maps declared
+with the
+.B pinning
+attribute set to
+.B LIBBPF_PIN_BY_NAME
+are pinned under
+.B /sys/fs/bpf/tc/globals/
+and can be inspected or updated with
+.B bpftool(8)
+or any program using the
 .B bpf(2)
-system call to retrieve or alter eBPF map values. <X> denotes the
-identifier of the eBPF map. It corresponds to the
-.B id
-member of
-.B struct bpf_elf_map
-\& from the tc eBPF map specification.
-
-The environment in this example looks as follows:
-
-.in +4n
-.nf
-.sp
-sh# env | grep BPF
-    BPF_NUM_MAPS=3
-    BPF_MAP1=6
-    BPF_MAP0=5
-    BPF_MAP2=7
-sh# ls -la /proc/self/fd
-    [...]
-    lrwx------. 1 root root 64 Apr 14 16:46 5 -> anon_inode:bpf-map
-    lrwx------. 1 root root 64 Apr 14 16:46 6 -> anon_inode:bpf-map
-    lrwx------. 1 root root 64 Apr 14 16:46 7 -> anon_inode:bpf-map
-sh# my_bpf_agent
-.fi
-.in
-
-eBPF agents are very useful in that they can prepopulate eBPF maps from
-user space, monitor statistics via maps and based on that feedback, for
-example, rewrite classids in eBPF map values during runtime. Given that eBPF
-agents are implemented as normal applications, they can also dynamically
-receive traffic control policies from external controllers and thus push
-them down into eBPF maps to dynamically adapt to network conditions. Moreover,
-eBPF maps can also be shared with other eBPF program types (e.g. tracing),
-thus very powerful combination can therefore be implemented.
+system call.
 
 .SS eBPF PROGRAMMING
 
diff --git a/tc/e_bpf.c b/tc/e_bpf.c
index cca853f9..391a3554 100644
--- a/tc/e_bpf.c
+++ b/tc/e_bpf.c
@@ -6,167 +6,60 @@
  */
 
 #include <stdio.h>
-#include <unistd.h>
 
 #include "utils.h"
 
 #include "tc_util.h"
 
 #include "bpf_util.h"
-#include "bpf_elf.h"
-#include "bpf_scm.h"
-
-#define BPF_DEFAULT_CMD	"/bin/sh"
-
-static char *argv_default[] = { BPF_DEFAULT_CMD, NULL };
 
 static void explain(void)
 {
 	fprintf(stderr,
-		"Usage: ... bpf [ import UDS_FILE ] [ run CMD ]\n"
-		"       ... bpf [ debug ]\n"
+		"Usage: ... bpf [ debug ]\n"
 		"       ... bpf [ graft MAP_FILE ] [ key KEY ]\n"
 		"          `... [ object-file OBJ_FILE ] [ type TYPE ] [ section NAME ] [ verbose ]\n"
 		"          `... [ object-pinned PROG_FILE ]\n"
 		"\n"
-		"Where UDS_FILE provides the name of a unix domain socket file\n"
-		"to import eBPF maps and the optional CMD denotes the command\n"
-		"to be executed (default: \'%s\').\n"
 		"Where MAP_FILE points to a pinned map, OBJ_FILE to an object file\n"
 		"and PROG_FILE to a pinned program. TYPE can be {cls, act}, where\n"
 		"\'cls\' is default. KEY is optional and can be inferred from the\n"
-		"section name, otherwise it needs to be provided.\n",
-		BPF_DEFAULT_CMD);
-}
-
-static int bpf_num_env_entries(void)
-{
-	char **envp;
-	int num;
-
-	for (num = 0, envp = environ; *envp != NULL; envp++)
-		num++;
-	return num;
+		"section name, otherwise it needs to be provided.\n");
 }
 
 static int parse_bpf(const struct exec_util *eu, int argc, char **argv)
 {
-	char **argv_run = argv_default, **envp_run, *tmp;
-	int ret, i, env_old, env_num, env_map;
-	const char *bpf_uds_name = NULL;
-	int fds[BPF_SCM_MAX_FDS] = {};
-	struct bpf_map_aux aux = {};
-
 	if (argc == 0)
 		return 0;
 
-	while (argc > 0) {
-		if (matches(*argv, "run") == 0) {
-			NEXT_ARG();
-			argv_run = argv;
-			break;
-		} else if (matches(*argv, "import") == 0) {
-			NEXT_ARG();
-			bpf_uds_name = *argv;
-		} else if (matches(*argv, "debug") == 0 ||
-			   matches(*argv, "dbg") == 0) {
-			if (bpf_trace_pipe())
-				fprintf(stderr,
-					"No trace pipe, tracefs not mounted?\n");
-			return -1;
-		} else if (matches(*argv, "graft") == 0) {
-			const char *bpf_map_path;
-			bool has_key = false;
-			uint32_t key;
-
-			NEXT_ARG();
-			bpf_map_path = *argv;
+	if (matches(*argv, "debug") == 0 ||
+	    matches(*argv, "dbg") == 0) {
+		if (bpf_trace_pipe())
+			fprintf(stderr,
+				"No trace pipe, tracefs not mounted?\n");
+		return -1;
+	} else if (matches(*argv, "graft") == 0) {
+		const char *bpf_map_path;
+		bool has_key = false;
+		uint32_t key;
+
+		NEXT_ARG();
+		bpf_map_path = *argv;
+		NEXT_ARG();
+		if (matches(*argv, "key") == 0) {
 			NEXT_ARG();
-			if (matches(*argv, "key") == 0) {
-				NEXT_ARG();
-				if (get_unsigned(&key, *argv, 0)) {
-					fprintf(stderr, "Illegal \"key\"\n");
-					return -1;
-				}
-				has_key = true;
-				NEXT_ARG();
+			if (get_unsigned(&key, *argv, 0)) {
+				fprintf(stderr, "Illegal \"key\"\n");
+				return -1;
 			}
-			return bpf_graft_map(bpf_map_path, has_key ?
-					     &key : NULL, argc, argv);
-		} else {
-			explain();
-			return -1;
+			has_key = true;
+			NEXT_ARG();
 		}
-
-		NEXT_ARG_FWD();
+		return bpf_graft_map(bpf_map_path, has_key ?
+				     &key : NULL, argc, argv);
 	}
 
-	if (!bpf_uds_name) {
-		fprintf(stderr, "bpf: No import parameter provided!\n");
-		explain();
-		return -1;
-	}
-
-	if (argv_run != argv_default && argc == 0) {
-		fprintf(stderr, "bpf: No run command provided!\n");
-		explain();
-		return -1;
-	}
-
-	ret = bpf_recv_map_fds(bpf_uds_name, fds, &aux, ARRAY_SIZE(fds));
-	if (ret < 0) {
-		fprintf(stderr, "bpf: Could not receive fds!\n");
-		return -1;
-	}
-
-	if (aux.num_ent == 0) {
-		envp_run = environ;
-		goto out;
-	}
-
-	env_old = bpf_num_env_entries();
-	env_num = env_old + aux.num_ent + 2;
-	env_map = env_old + 1;
-
-	envp_run = malloc(sizeof(*envp_run) * env_num);
-	if (!envp_run) {
-		fprintf(stderr, "bpf: No memory left to allocate env!\n");
-		goto err;
-	}
-
-	for (i = 0; i < env_old; i++)
-		envp_run[i] = environ[i];
-
-	ret = asprintf(&tmp, "BPF_NUM_MAPS=%u", aux.num_ent);
-	if (ret < 0)
-		goto err_free;
-
-	envp_run[env_old] = tmp;
-
-	for (i = env_map; i < env_num - 1; i++) {
-		ret = asprintf(&tmp, "BPF_MAP%u=%u",
-			       aux.ent[i - env_map].id,
-			       fds[i - env_map]);
-		if (ret < 0)
-			goto err_free_env;
-
-		envp_run[i] = tmp;
-	}
-
-	envp_run[env_num - 1] = NULL;
-out:
-	ret = execvpe(argv_run[0], argv_run, envp_run);
-	free(envp_run);
-	return ret;
-
-err_free_env:
-	for (--i; i >= env_old; i--)
-		free(envp_run[i]);
-err_free:
-	free(envp_run);
-err:
-	for (i = 0; i < aux.num_ent; i++)
-		close(fds[i]);
+	explain();
 	return -1;
 }
 
diff --git a/tc/f_bpf.c b/tc/f_bpf.c
index 50fe01ca..7bf9c463 100644
--- a/tc/f_bpf.c
+++ b/tc/f_bpf.c
@@ -27,7 +27,7 @@ static void explain(void)
 		" bytecode-file FILE\n"
 		"\n"
 		"eBPF use case:\n"
-		" object-file FILE [ section CLS_NAME ] [ export UDS_FILE ]"
+		" object-file FILE [ section CLS_NAME ]"
 		" [ verbose ] [ direct-action ] [ skip_hw | skip_sw ]\n"
 		" object-pinned FILE [ direct-action ] [ skip_hw | skip_sw ]\n"
 		"\n"
@@ -45,9 +45,6 @@ static void explain(void)
 		"Where CLS_NAME refers to the section name containing the\n"
 		"classifier (default \'%s\').\n"
 		"\n"
-		"Where UDS_FILE points to a unix domain socket file in order\n"
-		"to hand off control of all created eBPF maps to an agent.\n"
-		"\n"
 		"ACTION_SPEC := ... look at individual actions\n"
 		"NOTE: CLASSID is parsed as hexadecimal input.\n",
 		bpf_prog_to_default_section(bpf_type));
@@ -74,7 +71,6 @@ static const struct bpf_cfg_ops bpf_cb_ops = {
 static int bpf_parse_opt(const struct filter_util *qu, char *handle,
 			 int argc, char **argv, struct nlmsghdr *n)
 {
-	const char *bpf_obj = NULL, *bpf_uds_name = NULL;
 	struct tcmsg *t = NLMSG_DATA(n);
 	unsigned int bpf_gen_flags = 0;
 	unsigned int bpf_flags = 0;
@@ -82,7 +78,6 @@ static int bpf_parse_opt(const struct filter_util *qu, char *handle,
 	bool seen_run = false;
 	bool skip_sw = false;
 	struct rtattr *tail;
-	int ret = 0;
 
 	if (handle) {
 		if (get_u32(&t->tcm_handle, handle, 0)) {
@@ -117,9 +112,6 @@ opt_bpf:
 
 			argc = cfg.argc;
 			argv = cfg.argv;
-
-			bpf_obj = cfg.object;
-			bpf_uds_name = cfg.uds;
 		} else if (matches(*argv, "classid") == 0 ||
 			   matches(*argv, "flowid") == 0) {
 			unsigned int classid;
@@ -181,10 +173,7 @@ opt_bpf:
 
 	tail->rta_len = (((void *)n) + n->nlmsg_len) - (void *)tail;
 
-	if (bpf_uds_name)
-		ret = bpf_send_map_fds(bpf_uds_name, bpf_obj);
-
-	return ret;
+	return 0;
 }
 
 static int bpf_print_opt(const struct filter_util *qu, FILE *f,
diff --git a/tc/m_bpf.c b/tc/m_bpf.c
index 83b21b57..c848a9d3 100644
--- a/tc/m_bpf.c
+++ b/tc/m_bpf.c
@@ -29,7 +29,7 @@ static void explain(void)
 		" bytecode-file FILE\n"
 		"\n"
 		"eBPF use case:\n"
-		" object-file FILE [ section ACT_NAME ] [ export UDS_FILE ]"
+		" object-file FILE [ section ACT_NAME ]"
 		" [ verbose ]\n"
 		" object-pinned FILE\n"
 		"\n"
@@ -43,9 +43,6 @@ static void explain(void)
 		"Where ACT_NAME refers to the section name containing the\n"
 		"action (default \'%s\').\n"
 		"\n"
-		"Where UDS_FILE points to a unix domain socket file in order\n"
-		"to hand off control of all created eBPF maps to an agent.\n"
-		"\n"
 		"Where optionally INDEX points to an existing action, or\n"
 		"explicitly specifies an action index upon creation.\n",
 		bpf_prog_to_default_section(bpf_type));
@@ -72,12 +69,11 @@ static const struct bpf_cfg_ops bpf_cb_ops = {
 static int bpf_parse_opt(const struct action_util *a, int *ptr_argc, char ***ptr_argv,
 			 int tca_id, struct nlmsghdr *n)
 {
-	const char *bpf_obj = NULL, *bpf_uds_name = NULL;
 	struct tc_act_bpf parm = {};
 	struct bpf_cfg_in cfg = {};
 	bool seen_run = false;
 	struct rtattr *tail;
-	int argc, ret = 0;
+	int argc;
 	char **argv;
 
 	argv = *ptr_argv;
@@ -107,9 +103,6 @@ opt_bpf:
 
 			argc = cfg.argc;
 			argv = cfg.argv;
-
-			bpf_obj = cfg.object;
-			bpf_uds_name = cfg.uds;
 		} else if (matches(*argv, "help") == 0) {
 			explain();
 			return -1;
@@ -142,13 +135,10 @@ opt_bpf:
 	addattr_l(n, MAX_MSG, TCA_ACT_BPF_PARMS, &parm, sizeof(parm));
 	addattr_nest_end(n, tail);
 
-	if (bpf_uds_name)
-		ret = bpf_send_map_fds(bpf_uds_name, bpf_obj);
-
 	*ptr_argc = argc;
 	*ptr_argv = argv;
 
-	return ret;
+	return 0;
 }
 
 static int bpf_print_opt(const struct action_util *au, FILE *f, struct rtattr *arg)
-- 
2.53.0

